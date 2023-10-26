// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:algolia/algolia.dart' as _i3;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import 'application/auth/auth_bloc.dart' as _i18;
import 'application/auth/sign_in_form/sign_in_form_bloc.dart' as _i21;
import 'application/auth/sign_up_form/sign_up_form_bloc.dart' as _i15;
import 'application/onboarding/bloc/onboard_bloc.dart' as _i13;
import 'domain/auth/i_auth_facade.dart' as _i7;
import 'domain/auth/user/i_user_repository.dart' as _i11;
import 'domain/core/services/i_shared_preference_service.dart' as _i19;
import 'domain/firestore_data/i_firestore_data_facade.dart' as _i9;
import 'infrastructure/auth/firebase_auth_facade.dart' as _i8;
import 'infrastructure/auth/user_repository.dart' as _i12;
import 'infrastructure/core/firestore/firebase_injectable_module.dart' as _i23;
import 'infrastructure/core/injectable_modules/internal_injectable_module.dart'
    as _i24;
import 'infrastructure/core/injectable_modules/package_injectable_module.dart'
    as _i22;
import 'infrastructure/core/services/shared_preference_service.dart' as _i20;
import 'infrastructure/firestore_data/firestore_facade.dart' as _i10;
import 'presentation/core/theme/theme_manager.dart' as _i16;
import 'presentation/utils/utilities.dart' as _i17;

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
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    final internalInjectableModule = _$InternalInjectableModule();
    gh.singleton<_i3.Algolia>(packageInjectableModule.algolia);
    gh.lazySingleton<_i4.FirebaseAuth>(
        () => firebaseInjectableModule.firebaseAuth);
    gh.lazySingleton<_i5.FirebaseFirestore>(
        () => firebaseInjectableModule.fireStore);
    gh.lazySingleton<_i6.GoogleSignIn>(
        () => firebaseInjectableModule.googleSignIn);
    gh.lazySingleton<_i7.IAuthFacade>(() => _i8.FirebaseAuthFacade(
          gh<_i4.FirebaseAuth>(),
          gh<_i6.GoogleSignIn>(),
        ));
    gh.lazySingleton<_i9.IFirestoreDataFacade>(() => _i10.FirestoreDataFacade(
          gh<_i4.FirebaseAuth>(),
          gh<_i5.FirebaseFirestore>(),
        ));
    gh.lazySingleton<_i11.IUserRepository>(
        () => _i12.UserRepository(gh<_i5.FirebaseFirestore>()));
    gh.factory<_i13.OnboardBloc>(() => _i13.OnboardBloc());
    await gh.lazySingletonAsync<_i14.SharedPreferences>(
      () => packageInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i15.SignUpFormBloc>(
        () => _i15.SignUpFormBloc(gh<_i7.IAuthFacade>()));
    gh.singleton<_i16.ThemeManager>(_i16.ThemeManager());
    gh.lazySingleton<_i17.Utilities>(() => internalInjectableModule.utilities);
    gh.factory<_i18.AuthBloc>(() => _i18.AuthBloc(gh<_i7.IAuthFacade>()));
    gh.lazySingleton<_i19.ISharedPreferenceService>(
        () => _i20.SharedPreferenceService(gh<_i14.SharedPreferences>()));
    gh.factory<_i21.SignInFormBloc>(() => _i21.SignInFormBloc(
          gh<_i7.IAuthFacade>(),
          gh<_i19.ISharedPreferenceService>(),
        ));
    return this;
  }
}

class _$PackageInjectableModule extends _i22.PackageInjectableModule {}

class _$FirebaseInjectableModule extends _i23.FirebaseInjectableModule {}

class _$InternalInjectableModule extends _i24.InternalInjectableModule {}
