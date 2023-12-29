import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Add_Friends extends StatefulWidget {
  const Add_Friends({super.key});

  @override
  State<Add_Friends> createState() => _Add_FriendsState();
}

class _Add_FriendsState extends State<Add_Friends> {

  final String tProfileImage = 'assets/images/logo_icon.svg';// Replace with your desired color


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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 100,
                  width: 125,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: SvgPicture.asset(
                        tProfileImage,
                        // Add the fit property if needed
                        // fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                padding: EdgeInsets.only(left: 30,top: 10),
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
                      child: ElevatedButton(child: Text("Add Friend") ,onPressed:(){},style: ElevatedButton.styleFrom(backgroundColor: Colors.orangeAccent,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
              child: GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
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
      ),
    );
  }

  List<Widget> _settingActions() {
    return [
      IconButton(
        icon: Icon(Icons.more_vert_sharp),
        onPressed: (){}
      ),
    ];
  }

}
