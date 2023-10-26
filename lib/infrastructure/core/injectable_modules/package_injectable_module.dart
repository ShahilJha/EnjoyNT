import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:algolia/algolia.dart';

@module
abstract class PackageInjectableModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  @preResolve
  Algolia get algolia => const Algolia.init(
        applicationId: 'JD88YGON0U',
        apiKey: '015d67e7b78d3db34fb2466216aaa3bc',
      ).instance;
}
