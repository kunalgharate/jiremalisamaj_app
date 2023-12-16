

import 'package:realm/realm.dart';

part 'post.g.dart';


@RealmModel()
class _Post {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String post_message;
  @MapTo('owner_id')
  late String ownerId;
}