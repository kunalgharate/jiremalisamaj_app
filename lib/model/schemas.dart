import 'package:realm/realm.dart';

part 'schemas.g.dart';

@RealmModel()
class _AppUser {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String name;
  late String email;
  late String mobile;
  late String password;
  @MapTo('owner_id')
  late String ownerId;
}


