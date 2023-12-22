

import 'package:community_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
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

  final String tProfileImage = 'assets/images/logo_icon.svg';
  final double tDefaultSize = 15.0;
  final Color tPrimaryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Personal Information"),),
      body:SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 125,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SvgPicture.asset(
                          tProfileImage,
                          // Add the fit property if needed
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 65,
                      right: 0,
                      left: 20,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: tPrimaryColor,
                            width: 2.0,
                          ),
                        ),
                        child: IconButton(
                          color: tPrimaryColor,
                          onPressed: () {
                            // Add your functionality when the icon is pressed
                          },
                          icon: Icon(Icons.add, size: 30),
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
                              onPressed: () { },
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
                      onPress: () {}, buttonText: "Submit"),
                )
              ],
            )
        ),
      ),
    );
  }
}


