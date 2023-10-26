import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:algolia/algolia.dart';

@module
abstract class PackageInjectableModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @singleton
  // @preResolve
  Algolia get algolia => const Algolia.init(
        applicationId: 'JD88YGON0U',
        apiKey: '48a2b5d745f6cd1be2c274c7c9e64a92',
      ).instance;
}
