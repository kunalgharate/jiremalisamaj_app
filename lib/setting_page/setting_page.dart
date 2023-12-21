import 'package:community_app/setting_page/change_password/change_password.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10,),

              buildSettingsListItem(
                title: 'Personal Details',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              buildSettingsListItem(
                title: 'Donation',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              buildSettingsListItem(
                title: 'Language',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              Text(
                'General Settings',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              buildSettingsListItem(
                title: 'Theme',
                onTap: () {
                  // Implement your logic to toggle dark mode
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              buildSettingsListItem(
                title: 'Notifications',
                onTap: () {
                  // Implement your logic to toggle notifications
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              SizedBox(height: 20),

              Text(
                'About',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              buildSettingsListItem(
                title: 'About Us',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              buildSettingsListItem(
                title: 'Terms And Conditions',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              buildSettingsListItem(
                title: 'Privacy Policy',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              SizedBox(height: 20),

              Text(
                'Get Help',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10,),

              buildSettingsListItem(
                title: 'I Frequently Ask questions',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              buildSettingsListItem(
                title: 'Contact Us',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              buildSettingsListItem(
                title: 'Feedback',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),


              Text(
                'Others',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10),

              buildSettingsListItem(
                title: 'Rate Us',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              buildSettingsListItem(
                title: 'Change Password',
                onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChangePassword()));

                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),

              SizedBox(height: 20,),

              Text(
                'Logins',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 10,),

              buildSettingsListItem(
                title: 'Add Account',
                onTap: () {
                  // Implement your logic to navigate to change password page
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
              buildSettingsListItem(
                title: 'Logout',
                onTap: () {
                  // Implement your logic to handle logout
                },
                trailing: Icon(Icons.keyboard_arrow_right),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingsListItem({
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
