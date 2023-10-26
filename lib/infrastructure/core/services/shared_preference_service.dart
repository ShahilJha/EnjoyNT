import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/core/services/i_shared_preference_service.dart';

@LazySingleton(as: ISharedPreferenceService)
class SharedPreferenceService implements ISharedPreferenceService {
  SharedPreferenceService(this._sharedPreference);

  final SharedPreferences _sharedPreference;
  final kEmail = 'email';
  final kFirstStart = 'firstStart';

  @override
  Future<String> getRememberedEmail() async {
    String rememberedAddress = _sharedPreference.getString(kEmail) ?? '';
    return rememberedAddress;
  }

  @override
  Future<void> setRememberEmail(String emailStr) async {
    _sharedPreference.setString(kEmail, emailStr);
  }

  @override
  Future<void> unsetRememberEmail() async {
    _sharedPreference.setString(kEmail, '');
  }

  @override
  Future<bool> checkIfFirstStart() async {
    bool? result = _sharedPreference.getBool(kFirstStart);
    print('start usage =>>>>>>>>>>>>>>>>>>>>> $result');

    if (result == null || result == false) {
      print('PREF value ===========> false');

      await _sharedPreference.setBool(kFirstStart, true);
      print(
          'PREF Set to ==================> ${await _sharedPreference.getBool(kFirstStart)}');
      return true;
    }
    return result;
  }

  @override
  Future<void> setFirstStart() async {
    await _sharedPreference.setBool(kFirstStart, true);
  }
}
