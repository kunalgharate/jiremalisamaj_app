import 'package:realm/realm.dart';

part 'post.g.dart';


@RealmModel(ObjectType.embeddedObject)
class _ImgUr {
  late String id;
  late String deleteHash;
  late String accountId;
  late String accountUrl;
  late String type;
  late String link;
  late String datetime;
  late String mp4;
}

@RealmModel()
class _Post {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String postMessage;
  late String postType;
  _ImgUr? imgur;
  late DateTime createdDate;
  @MapTo('owner_id')
  late String ownerId;
}