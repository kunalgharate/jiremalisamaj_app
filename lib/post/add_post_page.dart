import 'dart:ui';

import 'package:community_app/app-service-connector/post_service.dart';
import 'package:flutter/material.dart';
import 'package:community_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:community_app/utils/service.dart';
import 'package:path/path.dart';

class AddPostPage extends StatefulWidget {
  AddPostPage({super.key});

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  File? selectedImage;
  TextEditingController _postDescriptionController = TextEditingController();
  final PostService postService = Get.isRegistered()? Get.find():Get.put(PostService());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text("New Post"),
        actions: [
          Container(
            padding: EdgeInsets.all(10),
            width: 100,
            child: CustomButton(
              onPress: () {
                if (_postDescriptionController.text != null &&
                    selectedImage != null) {
                } else if (_postDescriptionController.text != null &&
                    selectedImage == null) {
                } else if (_postDescriptionController.text == null &&
                    selectedImage != null) {}
                Service service = Service();
                service.submitSubscription(

                  file: selectedImage!,
                  filename: basename(selectedImage!.path),
                  token: "b3a915ac01795f8f90a4705421d01ae114d0df57",
                );
                postService.createItem();
                postService.getPost();
              },
              buttonText: 'Post',
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            // Post Description Input
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _postDescriptionController,
                maxLines: null,
                // Set maxLines to null for multiline text
                minLines: 1,
                style: TextStyle(fontSize: 20.0),
                // Text size
                decoration: InputDecoration(
                    hintText: 'Type your text here...',
                    // Hint textontroller: _postDescriptionController,
                    hintStyle: TextStyle(fontSize: 20.0, color: Colors.grey),
                    // Hint text size and colorecoration: InputDecoration(
                    border: InputBorder.none),
              ),
            ),
            SizedBox(height: 16),
            // Image Box (Conditionally render based on selectedImage)
            if (selectedImage != null)
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image.file(selectedImage!),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade500),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        // Clear the selected image
                        setState(() {
                          selectedImage = null;
                        });
                      },
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showMediaOptions(context);
        },
        tooltip: 'Select Media',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _showMediaOptions(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  getImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(ImageSource source) async {
    ImagePicker imagePicker = new ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);

    setState(() {
      selectedImage = File(image!.path);
    });
  }
}
