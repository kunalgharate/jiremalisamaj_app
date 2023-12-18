import 'package:community_app/app-service-connector/realm_service.dart';
import 'package:community_app/model/post.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:realm/realm.dart';

class PostService extends GetxController {
  final RealmServices appServices = GetIt.I.get<RealmServices>();

  void createItem() {
    final imgur = ImgUr('wkV3vTF', 'RN6p1glEUXeFl1n', '171427605',
        'kunalgharate', 'image/png', 'https://i.imgur.com/wkV3vTF.png', 'datetimeValue', 'mp4Link');

    // Create an instance of _Post
    final post = Post(ObjectId(),"I like this application", "image",DateTime.now(),appServices.currentUser!.id,imgur: imgur);
    appServices.realm.write<Post>(() => appServices.realm.add<Post>(post));
  }

  void getPost() {
    final data = appServices.realm.all<Post>();
    for (final post in data) {
      print('Post ID: ${post.id}');
      // Add more properties as needed
    }
  }




}
