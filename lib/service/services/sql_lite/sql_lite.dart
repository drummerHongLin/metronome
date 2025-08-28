import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/player_config.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

mixin _SqliteDb {
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
        price  REAL NOT NULL,
        amount REAL NOT NULL,
        payStatus INTEGER,
        transactionId TEXT,
        payTime TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE player_config(
        playConfigNo TEXT PRIMARY KEY,
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

class PayDbClient extends PayService with _SqliteDb {

  PayDbClient._();

  static final _instance = PayDbClient._();

  static PayDbClient get instance => _instance;


  @override
  Future<GetPaymentListResponse> getPaymentList(
    GetPaymentListRequest request,
  ) async {
    final db = await database;
    final rst = await db.query(
      'payment_record',
      where: "accountToken = ? ",
      whereArgs: [request.accountToken],
      limit: request.end - request.start,
      offset: request.start,
    );
    final paymentList = rst.map((e) => PaymentRecord.fromJson(e)).toList();
    return GetPaymentListResponse(
      hasMore: paymentList.isEmpty,
      paymentRecords: paymentList,
    );
  }

  @override
  Future<CreatePaymentRecordResponse> createPayment(
    CreatePaymentRecordRequest request,
  ) async {
    final db = await database;
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
    // 将请求转化成json
    request.toJson();
    return;
  }

  Future<List<PaymentRecord>> getAllPaymentList() async {
    final db = await database;
    final rst = await db.query('payment_record');
    final paymentList = rst.map((e) => PaymentRecord.fromJson(e)).toList();
    return paymentList;
  }

  Future<void> truncatePaymentRecord() async {
    final db = await database;
    return db.execute('delete from payment_record');
  }
}

class PlayerConfigDbClient extends PlayerConfigService with _SqliteDb {
  @override
  Future<void> createPlayerConfig(PlayerConfig p) async {
    final db = await database;
    await db.insert('player_config', p.toJson());
    return;
  }

  @override
  Future<void> deletePlayerConfig(String pNo) async {
    final db = await database;
    await db.delete(
      'player_config',
      where: "playerConfigNo = ?",
      whereArgs: [pNo],
    );
    return;
  }

  @override
  Future<GetPlayerConfigsResponse> getPlayerConfigs(
    int offset,
    int limit,
  ) async {
    final db = await database;
    final rst = await db.query(
      'player_config',
      limit: limit,
      offset: offset,
      orderBy: "createTime",
    );

    final playerConfigList = rst.map((e) => PlayerConfig.fromJson(e)).toList();

    final hasMore = playerConfigList.length == limit;

    return GetPlayerConfigsResponse(
      hasMore: hasMore,
      playConfigs: playerConfigList,
    );
  }

  @override
  Future<void> updatePlayerConfig(PlayerConfig p) async {
    final db = await database;
    await db.update(
      'player_config',
      p.toJson(),
      where: "playConfigNo = ?",
      whereArgs: [p.playConfigNo],
    );
    return;
  }

  Future<List<PlayerConfig>> getAllPlayerConfigs() async {
    final db = await database;
    final rst = await db.query('player_config', orderBy: "createTime");
    final playerConfigList = rst.map((e) => PlayerConfig.fromJson(e)).toList();
    return playerConfigList;
  }

  Future<void> truncatePlayerConfigs() async {
    final db = await database;
    return db.execute(' delete from player_config');
  }
}
