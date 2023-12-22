// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class ImgUr extends _ImgUr with RealmEntity, RealmObjectBase, EmbeddedObject {
  ImgUr(
    String imgId,
    String deleteHash,
    String accountId,
    String accountUrl,
    String type,
    String link,
    String datetime,
    String mp4,
  ) {
    RealmObjectBase.set(this, 'imgId', imgId);
    RealmObjectBase.set(this, 'deleteHash', deleteHash);
    RealmObjectBase.set(this, 'accountId', accountId);
    RealmObjectBase.set(this, 'accountUrl', accountUrl);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'link', link);
    RealmObjectBase.set(this, 'datetime', datetime);
    RealmObjectBase.set(this, 'mp4', mp4);
  }

  ImgUr._();

  @override
  String get imgId => RealmObjectBase.get<String>(this, 'imgId') as String;
  @override
  set imgId(String value) => RealmObjectBase.set(this, 'imgId', value);

  @override
  String get deleteHash =>
      RealmObjectBase.get<String>(this, 'deleteHash') as String;
  @override
  set deleteHash(String value) =>
      RealmObjectBase.set(this, 'deleteHash', value);

  @override
  String get accountId =>
      RealmObjectBase.get<String>(this, 'accountId') as String;
  @override
  set accountId(String value) => RealmObjectBase.set(this, 'accountId', value);

  @override
  String get accountUrl =>
      RealmObjectBase.get<String>(this, 'accountUrl') as String;
  @override
  set accountUrl(String value) =>
      RealmObjectBase.set(this, 'accountUrl', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get link => RealmObjectBase.get<String>(this, 'link') as String;
  @override
  set link(String value) => RealmObjectBase.set(this, 'link', value);

  @override
  String get datetime =>
      RealmObjectBase.get<String>(this, 'datetime') as String;
  @override
  set datetime(String value) => RealmObjectBase.set(this, 'datetime', value);

  @override
  String get mp4 => RealmObjectBase.get<String>(this, 'mp4') as String;
  @override
  set mp4(String value) => RealmObjectBase.set(this, 'mp4', value);

  @override
  Stream<RealmObjectChanges<ImgUr>> get changes =>
      RealmObjectBase.getChanges<ImgUr>(this);

  @override
  ImgUr freeze() => RealmObjectBase.freezeObject<ImgUr>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(ImgUr._);
    return const SchemaObject(ObjectType.embeddedObject, ImgUr, 'ImgUr', [
      SchemaProperty('imgId', RealmPropertyType.string),
      SchemaProperty('deleteHash', RealmPropertyType.string),
      SchemaProperty('accountId', RealmPropertyType.string),
      SchemaProperty('accountUrl', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('link', RealmPropertyType.string),
      SchemaProperty('datetime', RealmPropertyType.string),
      SchemaProperty('mp4', RealmPropertyType.string),
    ]);
  }
}

class Post extends _Post with RealmEntity, RealmObjectBase, RealmObject {
  Post(
    ObjectId id,
    String postMessage,
    String postType,
    DateTime createdDate,
    String ownerId, {
    ImgUr? imgur,
    PostUser? postUser,
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'postMessage', postMessage);
    RealmObjectBase.set(this, 'postType', postType);
    RealmObjectBase.set(this, 'imgur', imgur);
    RealmObjectBase.set(this, 'postUser', postUser);
    RealmObjectBase.set(this, 'createdDate', createdDate);
    RealmObjectBase.set(this, 'owner_id', ownerId);
  }

  Post._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get postMessage =>
      RealmObjectBase.get<String>(this, 'postMessage') as String;
  @override
  set postMessage(String value) =>
      RealmObjectBase.set(this, 'postMessage', value);

  @override
  String get postType =>
      RealmObjectBase.get<String>(this, 'postType') as String;
  @override
  set postType(String value) => RealmObjectBase.set(this, 'postType', value);

  @override
  ImgUr? get imgur => RealmObjectBase.get<ImgUr>(this, 'imgur') as ImgUr?;
  @override
  set imgur(covariant ImgUr? value) =>
      RealmObjectBase.set(this, 'imgur', value);

  @override
  PostUser? get postUser =>
      RealmObjectBase.get<PostUser>(this, 'postUser') as PostUser?;
  @override
  set postUser(covariant PostUser? value) =>
      RealmObjectBase.set(this, 'postUser', value);

  @override
  DateTime get createdDate =>
      RealmObjectBase.get<DateTime>(this, 'createdDate') as DateTime;
  @override
  set createdDate(DateTime value) =>
      RealmObjectBase.set(this, 'createdDate', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  Stream<RealmObjectChanges<Post>> get changes =>
      RealmObjectBase.getChanges<Post>(this);

  @override
  Post freeze() => RealmObjectBase.freezeObject<Post>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Post._);
    return const SchemaObject(ObjectType.realmObject, Post, 'Post', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('postMessage', RealmPropertyType.string),
      SchemaProperty('postType', RealmPropertyType.string),
      SchemaProperty('imgur', RealmPropertyType.object,
          optional: true, linkTarget: 'ImgUr'),
      SchemaProperty('postUser', RealmPropertyType.object,
          optional: true, linkTarget: 'PostUser'),
      SchemaProperty('createdDate', RealmPropertyType.timestamp),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
    ]);
  }
}

class PostUser extends _PostUser
    with RealmEntity, RealmObjectBase, EmbeddedObject {
  PostUser(
    String userId,
    String profileUrl,
    String name,
  ) {
    RealmObjectBase.set(this, 'userId', userId);
    RealmObjectBase.set(this, 'profileUrl', profileUrl);
    RealmObjectBase.set(this, 'name', name);
  }

  PostUser._();

  @override
  String get userId => RealmObjectBase.get<String>(this, 'userId') as String;
  @override
  set userId(String value) => RealmObjectBase.set(this, 'userId', value);

  @override
  String get profileUrl =>
      RealmObjectBase.get<String>(this, 'profileUrl') as String;
  @override
  set profileUrl(String value) =>
      RealmObjectBase.set(this, 'profileUrl', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  Stream<RealmObjectChanges<PostUser>> get changes =>
      RealmObjectBase.getChanges<PostUser>(this);

  @override
  PostUser freeze() => RealmObjectBase.freezeObject<PostUser>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PostUser._);
    return const SchemaObject(ObjectType.embeddedObject, PostUser, 'PostUser', [
      SchemaProperty('userId', RealmPropertyType.string),
      SchemaProperty('profileUrl', RealmPropertyType.string),
      SchemaProperty('name', RealmPropertyType.string),
    ]);
  }
}

class PostLike extends _PostLike
    with RealmEntity, RealmObjectBase, RealmObject {
  PostLike(
    String postId, {
    PostUser? postUser,
  }) {
    RealmObjectBase.set(this, '_id', postId);
    RealmObjectBase.set(this, 'postUser', postUser);
  }

  PostLike._();

  @override
  String get postId => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set postId(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  PostUser? get postUser =>
      RealmObjectBase.get<PostUser>(this, 'postUser') as PostUser?;
  @override
  set postUser(covariant PostUser? value) =>
      RealmObjectBase.set(this, 'postUser', value);

  @override
  Stream<RealmObjectChanges<PostLike>> get changes =>
      RealmObjectBase.getChanges<PostLike>(this);

  @override
  PostLike freeze() => RealmObjectBase.freezeObject<PostLike>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PostLike._);
    return const SchemaObject(ObjectType.realmObject, PostLike, 'PostLike', [
      SchemaProperty('postId', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('postUser', RealmPropertyType.object,
          optional: true, linkTarget: 'PostUser'),
    ]);
  }
}

class PostComment extends _PostComment
    with RealmEntity, RealmObjectBase, RealmObject {
  PostComment(
    String postId,
    String comment, {
    PostUser? postUser,
  }) {
    RealmObjectBase.set(this, '_id', postId);
    RealmObjectBase.set(this, 'comment', comment);
    RealmObjectBase.set(this, 'postUser', postUser);
  }

  PostComment._();

  @override
  String get postId => RealmObjectBase.get<String>(this, '_id') as String;
  @override
  set postId(String value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get comment => RealmObjectBase.get<String>(this, 'comment') as String;
  @override
  set comment(String value) => RealmObjectBase.set(this, 'comment', value);

  @override
  PostUser? get postUser =>
      RealmObjectBase.get<PostUser>(this, 'postUser') as PostUser?;
  @override
  set postUser(covariant PostUser? value) =>
      RealmObjectBase.set(this, 'postUser', value);

  @override
  Stream<RealmObjectChanges<PostComment>> get changes =>
      RealmObjectBase.getChanges<PostComment>(this);

  @override
  PostComment freeze() => RealmObjectBase.freezeObject<PostComment>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(PostComment._);
    return const SchemaObject(
        ObjectType.realmObject, PostComment, 'PostComment', [
      SchemaProperty('postId', RealmPropertyType.string,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('comment', RealmPropertyType.string),
      SchemaProperty('postUser', RealmPropertyType.object,
          optional: true, linkTarget: 'PostUser'),
    ]);
  }
}
