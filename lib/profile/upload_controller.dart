
import 'dart:io';

import 'package:get/get.dart';
import 'package:path/path.dart';

import '../model/FileUploadModel.dart';
import '../utils/service.dart';

class UploadController extends GetxController
{
  RxInt selectedIndex = 0.obs;
  Service service = Service();
  Rx<FileUploadModel?> fileUpload = FileUploadModel().obs;
  final profileImageUrl = "https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=".obs;



  Future<void> uploadPhoto(File selectedImage) async {
     fileUpload.value  =  await service.submitSubscription(
      file: selectedImage,
      filename: basename(selectedImage!.path),
      token: "b3a915ac01795f8f90a4705421d01ae114d0df57",
    );
     profileImageUrl.value= fileUpload.value!.data!.link!;
  }


}