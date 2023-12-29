import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../model/post.dart';

class PostWidget extends StatefulWidget {
  final PostModel userPost;
  const PostWidget({Key? key, required this.userPost}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class PostModel {
  final Post singlePost;
  int likeCount; // New property for like count
  bool isLiked; // New property to track whether the post is liked

  PostModel({required this.singlePost,this.likeCount = 0, this.isLiked = false});
}

class _PostWidgetState extends State<PostWidget> {
  bool showFullText = false;
  final int maxTextLengthToShowSeeMore = 100;

  void _showCommentBox() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Set to true to make the sheet take up the full height
      builder: (BuildContext context) {
        return CommentBox(
          onPost: (String comment) {
            // Handle posting the comment
            print('Posted Comment: $comment');
            Navigator.pop(context); // Close the bottom sheet
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // User Profile Section
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3106/3106773.png'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.userPost.singlePost.postUser?.name}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '2h • Public',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Post Text
                Text(
                  widget.userPost.singlePost.postMessage,
                  maxLines: showFullText ? null : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                if (widget.userPost.singlePost.postMessage.length > maxTextLengthToShowSeeMore)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showFullText = !showFullText;
                      });
                    },
                    child: Text(
                      showFullText ? "See less" : "See more",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (widget.userPost.singlePost.imgur?.link != null)
                  Container(
                    margin: EdgeInsets.only(top: 7),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 350,
                        minWidth: MediaQuery.of(context).size.width,
                        maxHeight: 450,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "${widget.userPost.singlePost.imgur?.link}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LikeButton(
                isLiked: widget.userPost.isLiked,
                likeCount: widget.userPost.likeCount,
                onPressed: () {
                  setState(() {
                    widget.userPost.isLiked = !widget.userPost.isLiked;
                    if (widget.userPost.isLiked) {
                      widget.userPost.likeCount++;
                    } else {
                      widget.userPost.likeCount--;
                    }
                  });
                },
              ),
              IconTextButton(
                icon: Icons.comment,
                text: 'Comment',
                onPressed: _showCommentBox,
              ),
              IconTextButton(
                icon: Icons.send,
                text: 'Send',
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final bool isLiked;
  final int likeCount;
  final VoidCallback? onPressed;

  const LikeButton({
    Key? key,
    required this.isLiked,
    required this.likeCount,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
              color: isLiked ? Colors.orange : null,
            ),
            SizedBox(width: 4),
            Text('$likeCount Likes'),
          ],
        ),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;

  const IconTextButton({
    Key? key,
    required this.icon,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(width: 4),
            Text(text),
          ],
        ),
      ),
    );
  }
}

class CommentBox extends StatefulWidget {
  final Function(String) onPost;

  CommentBox({Key? key, required this.onPost}) : super(key: key);

  @override
  _CommentBoxState createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  TextEditingController _commentController = TextEditingController();
  List<Map<String, dynamic>> allComments = [
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
    {"comment": "hello", "isStatic": true},
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
    {"comment": "hello", "isStatic": true},
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
    {"comment": "hello", "isStatic": true},
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
    {"comment": "hello", "isStatic": true},
    {"comment": "nice", "isStatic": true},
    {"comment": "bhai bhai|", "isStatic": true},
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Display all comments in reverse order
          Expanded(
            child: ListView.builder(
              reverse: true, // Display comments from the top
              itemCount: allComments.length,
              itemBuilder: (context, index) {
                var commentData = allComments[index];
                return Container(

                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                  ),
                  child: Text(
                    commentData["comment"],
                    style: TextStyle(fontSize: 16.0),
                  ),
                );
              },
            ),
          ),
          // Text input row
          Container(
            margin: EdgeInsets.only(top: 16.0),
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: Colors.orange[200],
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(
                color: Colors.orangeAccent,
                width: 1.0,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your comment...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String comment = _commentController.text;
                    if (comment.isNotEmpty) {
                      // Add the user's comment to the list
                      allComments.add({"comment": comment, "isStatic": false});

                      // Call the onPost callback
                      widget.onPost(comment);

                      // Clear the TextField after posting
                      _commentController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}