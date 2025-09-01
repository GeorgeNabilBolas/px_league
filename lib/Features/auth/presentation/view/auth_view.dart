import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/repo/auth_repo_imp.dart';
import '../cubit/auth/auth_cubit.dart';
import 'widgets/auth_widgets/auth_appbar.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        AuthRepoImp(
          firebaseAuth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn.instance,
          facebookAuth: FacebookAuth.instance,
        ),
      ),
      child: Scaffold(
        appBar: const AuthAppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
