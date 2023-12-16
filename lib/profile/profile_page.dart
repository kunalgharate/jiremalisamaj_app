import 'package:community_app/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Replace these variables with your actual values
  final String tProfileImage = 'assets/images/logo_icon.svg';
  final double tDefaultSize = 15.0;
  final Color tPrimaryColor = Colors.blue; // Replace with your desired color

  // Mock data for GridView. Replace this with your actual data.
  final List<String> gridImages = [
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    'assets/images/1.jpeg',
    // Add more image paths as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
        (title: Text("Username"), actions: _settingActions()),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
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
                  right: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: tPrimaryColor,
                        width: 2.0,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      color: tPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("YASH PATIL", style: TextStyle(fontWeight: FontWeight.bold , fontSize:25),),
                  Text("MCA STUDENT" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize:15), ),
                  Text("Rane Nagar, Nashik", style: TextStyle(fontSize: 15 ),),
                ],
              )
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    height: 35,
                    child: ElevatedButton(child: Text("Friends") ,onPressed:(){},style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
                      foregroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),))
                ),
                Container(
                    width: MediaQuery.of(context).size.width/2.3,
                    height: 35,
                    child: ElevatedButton(child: Text("Massage") ,onPressed:(){},style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white60 ,foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),)
                ),

              ],
            ),
          ),
          //
          // Padding(
          //   padding: const EdgeInsets.all(4),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       ElevatedButton(child: Text("Friends") ,onPressed:(){},style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
          //         foregroundColor: Colors.black ,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),)),
          //       ElevatedButton(child: Text("Massage") ,onPressed:(){},style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.white60 ,foregroundColor: Colors.black, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),),
          //
          //     ],
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 3.5,
                mainAxisSpacing: 3.5,
              ),
              itemCount: gridImages.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image.asset(
                    gridImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _settingActions() {
    return [
      IconButton(
        icon: Icon(Icons.settings),
        onPressed: () {
          // Add your settings logic here
        },
      ),
    ];
  }
}
