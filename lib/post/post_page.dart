

import 'package:community_app/post/post_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../app-service-connector/realm_service.dart';
import '../app_services.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  final AppServices appServices = GetIt.I.get<AppServices>();
  late RealmServices realmServices;

  @override
  void initState() {
    super.initState();
    realmServices = Get.isRegistered() ? Get.find() : Get.put(RealmServices(appServices.app));
    realmServices.getPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Obx(() =>
          ListView.builder(
              itemCount: realmServices.posts.length,
              itemBuilder: (BuildContext context, int index) {
                return PostWidget(userPost: PostModel(singlePost: realmServices.posts[index],likeCount: 10,isLiked: false));
              })),
    );
  }
}
