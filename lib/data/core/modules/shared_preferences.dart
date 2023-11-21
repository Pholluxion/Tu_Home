import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class SharedPreferencesModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}

@injectable
class SharedPreferencesService {
  SharedPreferencesModule preferencesModule;

  SharedPreferencesService(this.preferencesModule);

  Future<void> setString(String key, String value) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.getBool(key);
  }

  Future<void> setInt(String key, int value) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.getInt(key);
  }

  Future<void> setDouble(String key, double value) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.setDouble(key, value);
  }

  Future<double?> getDouble(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.getDouble(key);
  }

  Future<void> setStringList(String key, List<String> value) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.setStringList(key, value);
  }

  Future<List<String>?> getStringList(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.getStringList(key);
  }

  Future<bool> containsKey(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    return preferences.containsKey(key);
  }

  Future<void> remove(String key) async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.remove(key);
  }

  Future<void> clear() async {
    final SharedPreferences preferences = await preferencesModule.prefs;
    await preferences.clear();
  }
}
