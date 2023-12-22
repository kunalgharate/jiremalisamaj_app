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
                if (widget.userPost.singlePost.postMessage.length> maxTextLengthToShowSeeMore)
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
                        maxHeight: 400,
                        maxWidth: MediaQuery.of(context).size.width,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: "${widget.userPost.singlePost.imgur?.link}",
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                                colorFilter:
                                ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
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
                  // Handle like button press
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
                onPressed: () {
                  // Handle comment button press
                },
              ),
              IconTextButton(
                icon: Icons.send,
                text: 'Send',
                onPressed: () {
                  // Handle send button press
                },
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