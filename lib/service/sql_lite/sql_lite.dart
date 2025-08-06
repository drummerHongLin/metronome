import 'package:flutter/material.dart' show WidgetsFlutterBinding;
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/player_config.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteDb {
  // 创建单例对象
  static final SqliteDb _instance = SqliteDb._internal();

  static SqliteDb get instance => _instance;

  SqliteDb._internal();
  // 获取数据库对象
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // 默认数据库路径
    String path = join(await getDatabasesPath(), 'jinghong.db');
    // 保证应用已经挂靠
    WidgetsFlutterBinding.ensureInitialized();

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    // 创建会话表
    await db.execute('''
      CREATE TABLE payment_record(
        paymentNo TEXT PRIMARY KEY,
        accountToken TEXT NOT NULL,
        createTime TEXT NOT NULL,
        productName TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        amount REAL NOT NULL,
        payStatus INTEGER,
        transactionId TEXT,
        payTime TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE player_config(
        playerConfigNo TEXT PRIMARY KEY,
        createTime TEXT NOT NULL,
        updateTime TEXT NOT NULL,
        bpm INTEGER NOT NULL,
        beatNum INTEGER NOT NULL,
        beatNote INTEGER NOT NULL,
        referenceBeat INTEGER,
        subBeats TEXT,
        configTitle TEXT
      )
    ''');
  }
}

class PayDbClient extends PayService {
  @override
  Future<GetPaymentListResponse> getPaymentList(
    GetPaymentListRequest request,
  ) async {
    final db = await SqliteDb.instance.database;
    final rst = await db.query(
      'payment_record',
      where: "accountToken = ? ",
      whereArgs: [request.accountToken],
      limit: request.end - request.start,
      offset: request.start,
    );
    final paymentList = rst.map((e) => PaymentRecord.fromJson(e)).toList();
    return GetPaymentListResponse(
      accountToken: request.accountToken,
      paymentRecords: paymentList,
    );
  }

  @override
  Future<CreatePaymentRecordResponse> createPayment(
    CreatePaymentRecordRequest request,
  ) async {
    final db = await SqliteDb.instance.database;
    // 需要本地生成paymentNo
    final paymentNo = "FK${DateTime.now().millisecondsSinceEpoch}";
    // 将请求转化成json
    final paymentInfoJson = request.toJson();
    paymentInfoJson['paymentNo'] = paymentNo;
    await db.insert('payment_record', paymentInfoJson);
    return CreatePaymentRecordResponse(paymentNo: paymentNo);
  }

  @override
  Future<void> updatePayment(UpdatePaymentRecordRequest request) async {
    final db = await SqliteDb.instance.database;
    // 需要本地生成paymentNo
    final paymentNo = "FK${DateTime.now().millisecondsSinceEpoch}";
    // 将请求转化成json
    final paymentInfoJson = request.toJson();
    paymentInfoJson['paymentNo'] = paymentNo;
    await db.update(
      'payment_record',
      paymentInfoJson,
      where: 'paymentNo = ?',
      whereArgs: [paymentNo],
    );
    return;
  }
}

class PlayerConfigDbClient extends PlayerConfigService {
  @override
  Future<void> createPlayerConfig(PlayerConfig p) async {
    final db = await SqliteDb.instance.database;
    await db.insert('player_config', p.toJson());
    return;
  }

  @override
  Future<void> deletePlayerConfig(String pNo) async {
    final db = await SqliteDb.instance.database;
    await db.delete(
      'player_config',
      where: "playerConfigNo = ?",
      whereArgs: [pNo],
    );
    return;
  }

  @override
  Future<List<PlayerConfig>> getPlayerConfigs(int offset, int limit) async {
    final db = await SqliteDb.instance.database;
    final rst = await db.query('player_config', limit: limit, offset: offset);

    final playerConfigList = rst.map((e) => PlayerConfig.fromJson(e)).toList();

    return playerConfigList;
  }

  @override
  Future<void> updatePlayerConfig(PlayerConfig p) async {
    final db = await SqliteDb.instance.database;
    await db.update(
      'player_config',
      p.toJson(),
      where: "playerConfigNo = ?",
      whereArgs: [p.playerConfigNo],
    );
    return;
  }
}
