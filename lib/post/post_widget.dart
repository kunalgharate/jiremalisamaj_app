import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
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
                      backgroundImage: NetworkImage('user_profile_image_url'),
                    ),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User Name',
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
                  widget.post.text,
                  maxLines: showFullText ? null : 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                if (widget.post.text.length > maxTextLengthToShowSeeMore)
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
                if (widget.post.imageUrl != null)
                  Container(
                    margin: EdgeInsets.only(top: 7),
                      child: ConstrainedBox(
                        constraints: new BoxConstraints(
                          minHeight: 350,
                          minWidth: MediaQuery.of(context).size.width,
                          maxHeight: 400,
                          maxWidth: MediaQuery.of(context).size.width,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: widget.post.imageUrl!,
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
              IconTextButton(
                icon: Icons.thumb_up,
                text: 'Like',
                onPressed: () {
                  // Handle like button press
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

class Post {
  final String text;
  final String? imageUrl;

  Post({required this.text, this.imageUrl});
}
