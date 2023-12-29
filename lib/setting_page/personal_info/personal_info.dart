import 'package:cached_network_image/cached_network_image.dart';
import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/model/FileUploadModel.dart';
import 'package:community_app/profile/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:community_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:community_app/utils/service.dart';
import 'package:path/path.dart';

import '../../app_services.dart';
import '../../landing_page/SharedController.dart';
import '../../utils/app_string.dart';

import 'info_controller.dart';

class Personal_Info extends StatefulWidget {
  const Personal_Info({super.key});


  @override
  State<Personal_Info> createState() => _Personal_InfoState();
}


class _Personal_InfoState extends State<Personal_Info> {
  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.orange, minimumSize: Size(15, 20),
    padding: EdgeInsets.symmetric(horizontal: 15),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(3)),
    ),
  );

  final InfoController infoController = Get.isRegistered()? Get.find():Get.put(InfoController());

  UploadController uploadController = Get.isRegistered()? Get.find():Get.put(UploadController());
  File? selectedImage;

  final AppServices appServices = GetIt.I.get<AppServices>();
  late RealmServices realmServices;
 // String profileImageUrl = "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=";



  @override
  void initState() {
    super.initState();
    realmServices = Get.isRegistered()
        ? Get.find()
        : Get.put(RealmServices(appServices.app));
  }


  final double tDefaultSize = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Information"),),
      body:SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              children: [
                if (selectedImage == null)
                  Stack(
                  children: [
                    SizedBox(
                      height: 125,
                      width: 125,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Obx(() => CachedNetworkImage(
                          imageUrl: uploadController.profileImageUrl.value,
                          progressIndicatorBuilder: (context, url, downloadProgress) =>
                              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),)
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 80,
                      right: -25,
                      left: 35,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add, size: 35),
                          color: Colors.white,
                          onPressed: () {
                          _showMediaOptions(context);
                          },
                        ),

                      ),
                    ),
                  ],
                ),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal Info-',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),

                      TextFormField(controller: infoController.nameController,validator: (value){
                        if (value == null || value.isEmpty) {
                          return AppString.errorMsg_fullnameIsEmpty;
                        }
                        else if(!value.isEmail)

                        {
                          return AppString.errorMsg_fullnameIsValid;
                        }

                        return null;
                      },
                        decoration: const InputDecoration(border: UnderlineInputBorder(),labelText: "Full Name"),
                      ),

                      TextFormField(controller: infoController.educationController,
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "DOB"),
                      ),
                      
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "Gender", hintText: "Male/Female"),
                      ),
                      SizedBox(height: 25,),

                      Text(
                        'Education-',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10,),
                      TextFormField(controller: infoController.educationController,
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "Education"),
                      ),
                      SizedBox(height: 10,),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          '+Add new Education',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue,
                          ),
                        ),
                      ),

                      SizedBox(height: 25,),


                      Text(
                        'Location-',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      TextFormField(controller: infoController.cityController,
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "City"),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(controller: infoController.stateController,
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "State"),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(controller: infoController.pincodeController,
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "Pincode"),
                      ),
                      SizedBox(height: 25,),

                      Text(
                        'Contact Info-',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),

                      SizedBox(height: 10,),

                      TextFormField(
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "Mobile No."),
                      ),
                      SizedBox(height: 20,),
                      TextFormField(validator: (value){
                        if (value == null || value.isEmpty) {
                          return AppString.errorMsg_fullnameIsEmpty;
                        }
                        else if(!value.isEmail)

                        {
                          return AppString.errorMsg_fullnameIsValid;
                        }
                        return null;
                      },
                        decoration: const InputDecoration( border: UnderlineInputBorder(),labelText: "Email"),
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              style: flatButtonStyle,
                              onPressed: () {
                              },
                              child: Text('Private'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 80, vertical: 10),
                  child: CustomButton(
                      onPress: (){}, buttonText: "Submit"),
                )
              ],
            )
        ),
      ),
    );
  }
  Future<void> uploadPhoto(Service service) async {
    FileUploadModel? fileUpload  =  await service.submitSubscription(
      file: selectedImage!,
      filename: basename(selectedImage!.path),
      token: "b3a915ac01795f8f90a4705421d01ae114d0df57",
    );
    if(fileUpload!=null) {

      realmServices.fileUploadModel.value=fileUpload;
    }
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
    ImagePicker imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(source: source);

    setState(() {
      selectedImage = File(image!.path);
      uploadController.uploadPhoto(selectedImage!);
    });
  }
}


