import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zetgram/src/model/chat_model/chat_mode.dart';
import 'package:zetgram/src/model/cometn_model/coment_model.dart';
import 'package:zetgram/src/model/post_model/post_model.dart';

class DataBaseHelper {
  static final DataBaseHelper _dataBaseHelper = DataBaseHelper._init();

  factory DataBaseHelper() => _dataBaseHelper;
  static Database? _db;

  DataBaseHelper._init();

  Future<Database> get AsosiyDB async {
    if (_db != null) return _db!;
    _db = await _initDb();
    return _db!;
  }

  _initDb() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'walletlist.db');

    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE chat(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE comment(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        postId INTEGER
      )
    ''');

    await db.execute('''
      CREATE TABLE post(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        text TEXT,
        image TEXT,
        time INTEGER,
        like INTEGER,
        comment INTEGER
      )
    ''');
  }

  // Chat
  Future<int> saveChat(ChatModel item) async {
    var dbClient = await AsosiyDB;
    return await dbClient.insert('chat', item.toJson());
  }

  Future<List<ChatModel>> getChat() async {
    var dbClient = await AsosiyDB;
    List<Map<String, dynamic>> list = await dbClient.query('chat');
    return list.map((item) => ChatModel(
      id: item['id'],
      text: item['text'],
    )).toList();
  }

  Future<int> deleteChat(int id) async {
    var db = await AsosiyDB;
    return await db.delete('chat', where: 'id = ?', whereArgs: [id]);
  }

  // Post
  Future<int> savePost(PostModel item) async {
    var dbClient = await AsosiyDB;
    return await dbClient.insert('post', item.toJson());
  }

  Future<List<PostModel>> getPost() async {
    print('object');

    var dbClient = await AsosiyDB;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM post');
    List<PostModel> data = [];

    for (int i = 0; i < list.length; i++) {
      PostModel postModel = PostModel(
        id: list[i]["id"] ?? 0,
        text: list[i]["text"] ?? "",
        image: list[i]["image"] ?? "",
        time: list[i]["time"] ?? 0,
        like: list[i]["like"] ?? 0,
        comment: list[i]["comment"] ?? "",
      );
      data.add(postModel);
    }

    return data;
  }

  Future<int> updatePostLike(int postId, int newLike) async {
    final db = await AsosiyDB;
    return await db.update(
      'post',
      {'like': newLike},
      where: 'id = ?',
      whereArgs: [postId],
    );
  }

  Future<int> deletePost(int id) async {
    var db = await AsosiyDB;
    return await db.delete('post', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updatePost(PostModel item) async {
    var db = await AsosiyDB;
    return await db.update('post', item.toJson(), where: 'id = ?', whereArgs: [item.id]);
  }

  // comment

  Future<int> saveComment(CommentModel item) async {
    var dbClient = await AsosiyDB;
    return await dbClient.insert('comment', item.toJson());
  }

  Future<List<CommentModel>> getComment() async {
    var dbClient = await AsosiyDB;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM comment');
    List<CommentModel> data = [];

    for (int i = 0; i < list.length; i++) {
      CommentModel commentModel = CommentModel(
        id: list[i]["id"] ?? 0,
        text: list[i]["text"] ?? "",
          postId: list[i]["postId"] ?? 0
      );
      data.add(commentModel);
    }

    return data;
  }

  Future<int> deleteComment(int id) async {
    var db = await AsosiyDB;
    return await db.delete('comment', where: 'id = ?', whereArgs: [id]);
  }
}
