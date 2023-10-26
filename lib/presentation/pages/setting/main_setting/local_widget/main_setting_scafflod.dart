import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../application/auth/auth_bloc.dart';
import '../../../../routes/router.dart';
import '../../../../widgets/app_button.dart';
import '../../local_widgets/setting_tile.dart';

class MainSettingScaffold extends StatelessWidget {
  const MainSettingScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => context.router.pop(),
                    child: Image.asset('assets/icons/back_button.png'),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    'Settings',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
              const SizedBox(height: 45),
              Text(
                'Account',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Update your personal info',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 22),
                // height: 300,
                decoration: const BoxDecoration(
                  color: kContainerGreyBackground,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: const Column(
                  children: [
                    SettingTile(
                      routeUrl: rChangeName,
                      icon: Icons.account_circle,
                      title: 'Change Name',
                    ),
                    SettingTile(
                      routeUrl: rChangePassword,
                      icon: Icons.password,
                      title: 'Change Password',
                    ),
                    SettingTile(
                      routeUrl: rDeactivateAccount,
                      icon: Icons.delete_forever_rounded,
                      title: 'Deactivate Account',
                    ),
                    SettingTile(
                      routeUrl: rPrivacyPolicy,
                      icon: Icons.article_rounded,
                      title: 'Privacy Policy',
                    ),
                    // SettingTile(
                    //   routeUrl: '',
                    //   icon: Icons.home,
                    //   title: 'title',
                    // ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                textString: 'Logout',
                margin: const EdgeInsets.all(0),
                color: kLogoutButtonColor,
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.signOut());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
