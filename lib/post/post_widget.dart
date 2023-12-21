import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool showFullText = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.post.text,
                  maxLines: showFullText ? null : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (!showFullText)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showFullText = true;
                      });
                    },
                    child: Text("See more"),
                  ),
                if (widget.post.imageUrl != null)
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    constraints: BoxConstraints.tightFor(height: 150),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.post.imageUrl!),
                        fit: BoxFit.cover,
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
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // Handle like button press
                },
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // Handle comment button press
                },
              ),
              IconButton(
                icon: Icon(Icons.send),
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

class Post {
  final String text;
  final String? imageUrl;
  Post({required this.text, this.imageUrl});
}
