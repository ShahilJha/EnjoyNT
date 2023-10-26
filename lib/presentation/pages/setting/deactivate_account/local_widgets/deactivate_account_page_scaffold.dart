import 'package:auto_route/auto_route.dart';
import 'package:config/config.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/app_button.dart';

class DeactivateAccountPageScaffold extends StatelessWidget {
  const DeactivateAccountPageScaffold({super.key});

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
                'Deactivate Account',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to deactivate your account?\nPlease keep in mind that deactivating an account is irreversible.',
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
                  children: [],
                ),
              ),
              const SizedBox(height: 20),
              AppButton(
                textString: 'Deactivate',
                margin: const EdgeInsets.all(0),
                color: kTileDeleteButtonColor,
                onPressed: () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
