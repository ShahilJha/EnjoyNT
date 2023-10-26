abstract class ISharedPreferenceService {
  Future<String> getRememberedEmail();
  Future<void> setRememberEmail(String emailStr);
  Future<void> unsetRememberEmail();
  Future<bool> checkIfFirstStart();
  Future<void> setFirstStart();
}
