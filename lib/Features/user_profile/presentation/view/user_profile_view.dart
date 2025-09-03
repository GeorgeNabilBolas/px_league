import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Core/routes/app_routes.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(FirebaseAuth.instance.currentUser?.email ?? 'Anonymous User'),
            Text(FirebaseAuth.instance.currentUser?.displayName ?? 'Anonymous'),
            CachedNetworkImage(
              imageUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '',
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            TextButton(
              onPressed: () {
                Future.wait([
                  FirebaseAuth.instance.signOut(),
                  GoogleSignIn.instance.signOut(),
                  FacebookAuth.instance.logOut(),
                ]).then((value) {
                  if (context.mounted) context.go(AppRoutes.loginRoute);
                });
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
