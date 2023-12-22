import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({super.key});

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  void setLanguage(String language) {
    // Implement logic to set the selected language
    print('Selected language: $language');
    // You can navigate to the appropriate page or perform other actions based on the selected language.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Select Your Language',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            LanguageListItem(
              Language: "English",
              onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            LanguageListItem(
                Language: "Hindi",
                onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            LanguageListItem(
                Language: "Marathi",
                onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            LanguageListItem(
                Language: "Gujrathi",
                onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            LanguageListItem(
                Language: "Tamil",
                onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            LanguageListItem(
                Language: "Telgu",
                onTap: (){},
                trailing: Icon(Icons.check_box_outline_blank)
            ),
            SizedBox(height: 20,),

            ],
        ),
      ),
    );
  }
  Widget LanguageListItem ({
    required String Language,
    required VoidCallback onTap,
    Widget? trailing
  }){
    return ListTile(
      title: Text(Language),
      onTap: onTap,
      trailing: trailing,
    );
  }
}








