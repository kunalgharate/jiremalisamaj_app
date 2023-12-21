import 'dart:ffi';
import 'package:community_app/model/FileUploadModel.dart';
import 'package:community_app/model/post.dart';
import 'package:community_app/model/schemas.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:realm/realm.dart';

class RealmServices extends GetxController {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  // bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RxList<Post> posts = RxList();

  // upload post paramters
  Rx<FileUploadModel?> fileUploadModel = FileUploadModel().obs;
  TextEditingController postDesc = TextEditingController();
  ImgUr? imgUr;


  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [
        AppUser.schema,
        Post.schema,
        ImgUr.schema
      ]));
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<AppUser>(),name: "appusers",update: true);
      mutableSubscriptions.add(realm.all<Post>(),name: "posts",update: true);
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
  }

  Future<void> switchSubscription(bool value) async {
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
  }


  Future<AppUser?> getUserByEmailAndPassword(
      String email, String password) async {
    final query = realm.query<AppUser>(
      r'email == $0 && password == $1',
      [email, password],
    );
    try {
      if (!query.isEmpty) {
        // Assuming that email and password are unique for each user
        print("User fetched = ${query.first.name}");
        return query.first;
        ;
      } else {
        print("${query}");
        return null;
      }
    } catch (e) {
      print(e);
    }

    print("User fetched = ${query.first}");
    return null;
  }

  void createItem(String name, String email, String mobile, String password) {
    final newItem =
        AppUser(ObjectId(), name, email, mobile, password, currentUser!.id);
    realm.write<AppUser>(() => realm.add<AppUser>(newItem));
    update();
  }

  AppUser? registerUser(
      String name, String email, String mobile, String password) {
    try {
      final newItem =
          AppUser(ObjectId(), name, email, mobile, password, currentUser!.id);
     return realm.write<AppUser>(() => realm.add<AppUser>(newItem));
    } catch (e) {
      return null;
    }
  }

  void deleteItem(AppUser AppUser) {
    realm.write(() => realm.delete(AppUser));
    update();
  }

  // Future<void> updateItem(AppUser AppUser,
  //     {String? summary, bool? isComplete, int? priority}) async {
  //   realm.write(() {
  //     if (summary != null) {
  //       AppUser.summary = summary;
  //     }
  //     if (isComplete != null) {
  //       AppUser.isComplete = isComplete;
  //     }
  //     if (priority != null) {
  //       AppUser.priority = priority;
  //     }
  //   });
  //   update();
  // }

  // Post related services

  Future<void> createPost() async {
    try {
     // await realm.subscriptions.waitForSynchronization(); // Ensure subscription

      if(fileUploadModel.value?.data!=null && fileUploadModel.value?.data?.id !=null)
        {
          Data data = fileUploadModel.value!.data!;
          imgUr = ImgUr(
              data.id.toString(),
              data.deletehash.toString(),
              data.accountId.toString(),
              data.accountUrl.toString(),
              data.type.toString(),
              data.link.toString(),
              data.datetime.toString(),
              data.mp4.toString());
        }
      // Create an instance of _Post
      final post = Post(ObjectId(),postDesc.text.isNotEmpty?postDesc.text.toString():"",imgUr==null ?"image":"text",
          DateTime.now(), currentUser!.id,imgur: imgUr);
      realm.write<Post>(() => realm.add<Post>(post));
      Get.snackbar("Post successfully", "Your post added successfully");
      postDesc.text="";
      imgUr =null;

    } catch (e) {
      Get.snackbar("Something went wrong", "Error $e");
      print("Post add error $e");
    }
  }

  void getPost() {
    posts.value = realm.all<Post>().toList();
  }

  Future<void> close() async {
    if (currentUser != null) {
      await currentUser?.logOut();
      currentUser = null;
    }
    realm.close();
  }

  @override
  void onClose() {
    realm.close();
    super.onClose();
  }
}
