///
/// venosyd © 2016-2021
///
/// sergio lisan <sels@venosyd.com>
///
library opensyd.providers.database;

import 'dart:async';

import 'package:opensyd_dart/opensyd_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
/// database utils
///
class FlutterDatabase implements Database {
  ///
  FlutterDatabase();

  ///
  SharedPreferences _instance;

  ///
  Future<SharedPreferences> get instance async {
    _instance ??= await SharedPreferences.getInstance();
    return _instance;
  }

  @override
  Future<void> clear() async => (await instance).clear();

  @override
  Future<String> retrieve(String key) async =>
      (await instance).get(key) as String ?? '';

  @override
  Future<String> save(key, data) async {
    (await instance).setString(key, data);
    return 'DONE';
  }

  @override
  Future<bool> contains(key) async => (await instance).containsKey(key);

  @override
  Future<String> retrieveImage(String key) {
    return null;
  }

  @override
  Future<String> saveImage(String key, String image) {
    return null;
  }

  @override
  Future<List<String>> keys() async {
    return (await instance).getKeys().toList();
  }
}
