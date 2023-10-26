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
        apiKey: '0c4756ba21dc4c0e95395d22dde2496b',
      ).instance;
}
