
import 'dart:convert';
import 'dart:io';

import 'package:community_app/model/FileUploadModel.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class Service{

  Future<FileUploadModel?> submitSubscription({required File file,required String filename,required String token})async{
    ///MultiPart request
    var request = http.MultipartRequest(
      'POST', Uri.parse("https://api.imgur.com/3/upload"),

    );
    Map<String,String> headers={
      "Authorization":"Bearer $token",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: filename,
        contentType: MediaType('image','jpeg'),
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      "album":"PDz6rYO",
    });
    try {
      var res = await request.send();
      var responseString = await http.Response.fromStream(res);
      var jsonResponse = json.decode(responseString.body);

      // Check if the response has the expected structure
      if (jsonResponse.containsKey("status") && jsonResponse.containsKey("success") && jsonResponse.containsKey("data")) {
        return FileUploadModel.fromJson(jsonResponse);
      } else {
        print("Invalid JSON structure in response");
        return null;
      }
    } catch (e) {
      print("Error uploading file: $e");
      return null; // You can handle the error as needed
    }
   // return res.statusCode;
  }
}