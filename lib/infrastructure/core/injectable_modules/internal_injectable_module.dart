import 'package:injectable/injectable.dart';

import '../../../presentation/utils/utilities.dart';

@module
abstract class InternalInjectableModule {
  @lazySingleton
  Utilities get utilities => Utilities();
}
