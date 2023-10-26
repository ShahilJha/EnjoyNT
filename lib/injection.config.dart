// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'application/auth/auth_bloc.dart' as _i9;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i12;
import 'application/auth/sign_up_form/sign_up_form_bloc.dart' as _i6;
import 'domain/auth/i_auth_facade.dart' as _i3;
import 'domain/core/services/i_shared_preference_service.dart' as _i10;
import 'infrastructure/auth/auth_facade.dart' as _i4;
import 'infrastructure/core/injectable_modules/internal_injectable_module.dart'
    as _i14;
import 'infrastructure/core/injectable_modules/package_injectable_module.dart'
    as _i13;
import 'infrastructure/core/services/shared_preference_service.dart' as _i11;
import 'presentation/core/theme/theme_manager.dart' as _i7;
import 'presentation/utils/utilities.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final packageInjectableModule = _$PackageInjectableModule();
    final internalInjectableModule = _$InternalInjectableModule();
    gh.lazySingleton<_i3.IAuthFacade>(() => _i4.AuthFacade());
    await gh.lazySingletonAsync<_i5.SharedPreferences>(
      () => packageInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i6.SignUpFormBloc>(
        () => _i6.SignUpFormBloc(gh<_i3.IAuthFacade>()));
    gh.singleton<_i7.ThemeManager>(_i7.ThemeManager());
    gh.lazySingleton<_i8.Utilities>(() => internalInjectableModule.utilities);
    gh.factory<_i9.AuthBloc>(() => _i9.AuthBloc(gh<_i3.IAuthFacade>()));
    gh.lazySingleton<_i10.ISharedPreferenceService>(
        () => _i11.SharedPreferenceService(gh<_i5.SharedPreferences>()));
    gh.factory<_i12.SignInFormBloc>(() => _i12.SignInFormBloc(
          gh<_i3.IAuthFacade>(),
          gh<_i10.ISharedPreferenceService>(),
        ));
    return this;
  }
}

class _$PackageInjectableModule extends _i13.PackageInjectableModule {}

class _$InternalInjectableModule extends _i14.InternalInjectableModule {}
