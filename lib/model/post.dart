import 'package:realm/realm.dart';

part 'post.g.dart';


@RealmModel(ObjectType.embeddedObject)
class _ImgUr {
  late String imgId;
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
  late _ImgUr? imgur;
  late _PostUser? postUser;
  late DateTime createdDate;
  @MapTo('owner_id')
  late String ownerId;
}

@RealmModel(ObjectType.embeddedObject)
class _PostUser {
  late String userId;
  late String profileUrl;
  late String name;
}
@RealmModel()
class _PostLike {
  @MapTo('_id')
  @PrimaryKey()
  late String postId;
  late _PostUser? postUser;

}
@RealmModel()
class _PostComment {
  @MapTo('_id')
  @PrimaryKey()
  late String postId;
  late String comment;
  late _PostUser? postUser;

}