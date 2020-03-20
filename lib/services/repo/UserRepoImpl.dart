import 'package:dio/dio.dart';
import 'package:kip/models/User.dart';
import 'package:kip/services/db/DatabaseProvider.dart';
import 'package:kip/services/db/dao/UserDao.dart';
import 'package:kip/services/repo/UserRepo.dart';
import 'package:sqflite/sqflite.dart';

class UserRepoImpl implements UserRepo {
  final dao = UserDao();

  final dio = Dio(
    BaseOptions(
      method: "GET",
      headers: {
        "x-api-key": "no api key right now"
      },
    ),
  );

  @override
  DatabaseProvider databaseProvider;

  UserRepoImpl(this.databaseProvider);

  @override
  Future insert(User data) async {
    final db = await databaseProvider.db();
    await db.insert(userTable, dao.toMap(data),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future update(User data) async {
    final db = await databaseProvider.db();
    await db.update(userTable, dao.toMap(data),
        where: '$userColumnEmail = ?', whereArgs: [data.email]);
  }

  @override
  Future delete(User data) async {
    final db = await databaseProvider.db();
    await db.delete(userTable,
        where: '$userColumnEmail = ?', whereArgs: [data.email]);
  }

  @override
  Future<User> getFromDb() async {
    final db = await databaseProvider.db();
    List<Map> map = await db.query(
      userTable,
      columns: [
        userColumnEmail,
        userColumnAvatar,
      ],
    );
    if (map.length > 0) {
      return dao.fromList(map).first;
    }
    return null;
  }

  @override
  Future<User> login(String email, String pass) async {
    final data = Map<String, String>();
    data[userColumnEmail] = email;
    data[userColumnPass] = pass;
    try {
      final response = await dio.post(LOGIN_URL, data: FormData.from(data));
      return User.fromMap(response.data) ?? null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<User> register(String email, String pass) async {
    final data = Map<String, String>();
    data[userColumnEmail] = email;
    data[userColumnPass] = pass;
    try {
      final response = await dio.post(REGISTER_URL, data: FormData.from(data));
      return User.fromMap(response.data) ?? null;
    } catch (e) {
      return null;
    }
  }
}

const LOGIN_URL = "http://192.168.1.159:8080/login";
const REGISTER_URL = "http://192.168.1.159:8080/register";
