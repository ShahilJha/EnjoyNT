import 'package:config/config.dart';
import 'package:enjoy_nt/application/onboarding/bloc/onboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/enjoy_nt_logo.dart';
import 'on_board_tile.dart';

class UserTypeSelection extends StatelessWidget {
  const UserTypeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardBloc>();
    return BlocBuilder<OnboardBloc, OnboardState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          // padding: const EdgeInsets.symmetric(horizontal: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const EnjoyNtLogo(),
                const SizedBox(height: 8),
                const Text(
                  'Few questions before we start..',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black26,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Are you a . . . .?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 1.5 / 2,
                    crossAxisCount: 2,
                    children: [
                      OnBoardTile(
                        imageUrl: 'assets/images/image2.png',
                        title: 'Student',
                        textColor: state.userType == 'Student'
                            ? Colors.white
                            : kBackgroundInactiveColor,
                        color: state.userType == 'Student'
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(150)
                            : Theme.of(context).colorScheme.background,
                        onTap: () =>
                            bloc.add(OnboardEvent.clickedType('Student')),
                      ),
                      OnBoardTile(
                        imageUrl: 'assets/images/image3.png',
                        title: 'Tourist',
                        textColor: state.userType == 'Tourist'
                            ? Colors.white
                            : kBackgroundInactiveColor,
                        color: state.userType == 'Tourist'
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(150)
                            : Theme.of(context).colorScheme.background,
                        onTap: () =>
                            bloc.add(OnboardEvent.clickedType('Tourist')),
                      ),
                      OnBoardTile(
                        imageUrl: 'assets/images/image4.png',
                        title: 'Local',
                        textColor: state.userType == 'Local'
                            ? Colors.white
                            : kBackgroundInactiveColor,
                        color: state.userType == 'Local'
                            ? Theme.of(context)
                                .colorScheme
                                .primary
                                .withAlpha(150)
                            : Theme.of(context).colorScheme.background,
                        onTap: () =>
                            bloc.add(OnboardEvent.clickedType('Local')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
