import 'package:auto_route/auto_route.dart';
import 'package:cv/util/logger.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  final providers = [EmailAuthProvider()];

  @override
  Widget build(BuildContext context) => SignInScreen(
        providers: providers,
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            talker.info('signIn');
          }),
        ],
      );
}
