
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
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
                Service service = Service();
                service.submitSubscription(
                  file: selectedImage!,
                  filename: basename(selectedImage!.path),
                  token: "b3a915ac01795f8f90a4705421d01ae114d0df57",
                );
              },
              buttonText: 'Post',
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.6, // Increase vertical size
                child: FutureBuilder(
                  future: _getImage(context),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Text('Please wait');
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError)
                          return Text('Error: ${snapshot.error}');
                        else {
                          return selectedImage != null
                              ? Image.file(selectedImage!)
                              : Center(
                            child: Text("Please Get the Image"),
                          );
                        }
                    }
                  },
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade500),
                ),
              ),
            ],
          ),
        ],
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

  //resize the image
  Future<void> _getImage(BuildContext context) async {
    if (selectedImage != null) {
      var imageFile = selectedImage;
      // Handle image resizing logic if needed
    }
  }
}