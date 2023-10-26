// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'application/auth/auth_bloc.dart' as _i12;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i15;
import 'application/auth/sign_up_form/sign_up_form_bloc.dart' as _i9;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/core/services/i_shared_preference_service.dart' as _i13;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/core/firestore/firebase_injectable_module.dart' as _i16;
import 'infrastructure/core/injectable_modules/internal_injectable_module.dart'
    as _i18;
import 'infrastructure/core/injectable_modules/package_injectable_module.dart'
    as _i17;
import 'infrastructure/core/services/shared_preference_service.dart' as _i14;
import 'presentation/core/theme/theme_manager.dart' as _i10;
import 'presentation/utils/utilities.dart' as _i11;

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
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    final packageInjectableModule = _$PackageInjectableModule();
    final internalInjectableModule = _$InternalInjectableModule();
    gh.lazySingleton<_i3.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i4.FirebaseFirestore>(
        () => firebaseInjectableModule.fireStore);
    gh.lazySingleton<_i5.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i6.IAuthFacade>(() => _i7.FirebaseAuthFacade(
          gh<_i3.FirebaseAuth>(),
          gh<_i5.GoogleSignIn>(),
        ));
    await gh.lazySingletonAsync<_i8.SharedPreferences>(
      () => packageInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i9.SignUpFormBloc>(
        () => _i9.SignUpFormBloc(gh<_i6.IAuthFacade>()));
    gh.singleton<_i10.ThemeManager>(_i10.ThemeManager());
    gh.lazySingleton<_i11.Utilities>(() => internalInjectableModule.utilities);
    gh.factory<_i12.AuthBloc>(() => _i12.AuthBloc(gh<_i6.IAuthFacade>()));
    gh.lazySingleton<_i13.ISharedPreferenceService>(
        () => _i14.SharedPreferenceService(gh<_i8.SharedPreferences>()));
    gh.factory<_i15.SignInFormBloc>(() => _i15.SignInFormBloc(
          gh<_i6.IAuthFacade>(),
          gh<_i13.ISharedPreferenceService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i16.FirebaseInjectableModule {}

class _$PackageInjectableModule extends _i17.PackageInjectableModule {}

class _$InternalInjectableModule extends _i18.InternalInjectableModule {}
