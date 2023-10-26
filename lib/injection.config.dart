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
import 'package:shared_preferences/shared_preferences.dart' as _i11;

import 'application/auth/auth_bloc.dart' as _i15;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i18;
import 'application/auth/sign_up_form/sign_up_form_bloc.dart' as _i12;
import 'application/onboarding/bloc/onboard_bloc.dart' as _i10;
import 'domain/auth/i_auth_facade.dart' as _i6;
import 'domain/auth/user/i_user_repository.dart' as _i8;
import 'domain/core/services/i_shared_preference_service.dart' as _i16;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i7;
import 'infrastructure/auth/user_repository.dart' as _i9;
import 'infrastructure/core/firestore/firebase_injectable_module.dart' as _i19;
import 'infrastructure/core/injectable_modules/internal_injectable_module.dart'
    as _i21;
import 'infrastructure/core/injectable_modules/package_injectable_module.dart'
    as _i20;
import 'infrastructure/core/services/shared_preference_service.dart' as _i17;
import 'presentation/core/theme/theme_manager.dart' as _i13;
import 'presentation/utils/utilities.dart' as _i14;

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
    gh.lazySingleton<_i8.IUserRepository>(
        () => _i9.UserRepository(gh<_i4.FirebaseFirestore>()));
    gh.factory<_i10.OnboardBloc>(() => _i10.OnboardBloc());
    await gh.lazySingletonAsync<_i11.SharedPreferences>(
      () => packageInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i12.SignUpFormBloc>(
        () => _i12.SignUpFormBloc(gh<_i6.IAuthFacade>()));
    gh.singleton<_i13.ThemeManager>(_i13.ThemeManager());
    gh.lazySingleton<_i14.Utilities>(() => internalInjectableModule.utilities);
    gh.factory<_i15.AuthBloc>(() => _i15.AuthBloc(gh<_i6.IAuthFacade>()));
    gh.lazySingleton<_i16.ISharedPreferenceService>(
        () => _i17.SharedPreferenceService(gh<_i11.SharedPreferences>()));
    gh.factory<_i18.SignInFormBloc>(() => _i18.SignInFormBloc(
          gh<_i6.IAuthFacade>(),
          gh<_i16.ISharedPreferenceService>(),
        ));
    return this;
  }
}

class _$FirebaseInjectableModule extends _i19.FirebaseInjectableModule {}

class _$PackageInjectableModule extends _i20.PackageInjectableModule {}

class _$InternalInjectableModule extends _i21.InternalInjectableModule {}
