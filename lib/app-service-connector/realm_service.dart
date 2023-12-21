import 'package:community_app/model/post.dart';
import 'package:community_app/model/schemas.dart';
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
      realm.write<AppUser>(() => realm.add<AppUser>(newItem));
      return newItem;
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
      final imgur = ImgUr(
          'wkV3vTF',
          'RN6p1glEUXeFl1n',
          '171427605',
          'kunalgharate',
          'image/png',
          'https://i.imgur.com/wkV3vTF.png',
          'datetimeValue',
          'mp4Link');

      // Create an instance of _Post
      final post = Post(ObjectId(), "I like this application", "image",
          DateTime.now(), currentUser!.id,imgur: imgur);
      realm.write<Post>(() => realm.add<Post>(post));
    } catch (e) {
      print("Post add error $e");
    }
  }

  void getPost() {
    final data = realm.all<Post>();
    for (final post in data) {
      print('Post ID: ${post.id}');
      // Add more properties as needed
    }
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
