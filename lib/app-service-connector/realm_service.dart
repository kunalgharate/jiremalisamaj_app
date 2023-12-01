

import 'package:community_app/model/schemas.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:realm/realm.dart';

class RealmServices extends GetxController {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";
  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [AppUser.schema]));
      showAll = (realm.subscriptions.findByName(queryAllName) != null);
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      if (showAll) {
        mutableSubscriptions.add(realm.all<AppUser>(), name: queryAllName);
      } else {
        mutableSubscriptions.add(
            realm.query<AppUser>(r'owner_id == $0', [currentUser?.id]),
            name: queryMyItemsName);
      }
    });
    await realm.subscriptions.waitForSynchronization();
  }


  Future<AppUser?> getUserByEmailAndPassword(String email, String password) async {
    final query = realm.query<AppUser>(
      r'email == $0 && password == $1',
      [email, password],
    );
    try
    {
      if (!query.isEmpty) {
        // Assuming that email and password are unique for each user
        print("User fetched = ${query.first.name}");
        return query.first;;
      }
      else
        {
          print("${query}");
          return null;
        }
    }
    catch(e)
    {
      print(e);
    }

    print("User fetched = ${query.first}");
    return null;
  }


  void createItem(String name, String email, String mobile, String password) {
    final newItem = AppUser(
        ObjectId(), name,email,mobile,password,currentUser!.id);
    realm.write<AppUser>(() => realm.add<AppUser>(newItem));
    update();
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
