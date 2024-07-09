import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../backend/supabase/supabase.dart';
import '../../flutter_flow/flutter_flow_util.dart';

Future<User?> googleSignInFunc() async {
  if (kIsWeb) {
    final success = await SupaFlow.client.auth.signInWithOAuth(Provider.google);
    return success ? SupaFlow.client.auth.currentUser : null;
  }

  final googleSignIn = GoogleSignIn(
    clientId: isAndroid
        ? null
        : "845438681594-q13t4fi0p7ps1b43qr9ndnhbv0gub7bk.apps.googleusercontent.com",
    serverClientId:
        "845438681594-q13t4fi0p7ps1b43qr9ndnhbv0gub7bk.apps.googleusercontent.com",
  );

  await googleSignIn.signOut().catchError((_) => null);
  final googleUser = await googleSignIn.signIn();
  final googleAuth = await googleUser!.authentication;
  final accessToken = googleAuth.accessToken;
  final idToken = googleAuth.idToken;

  if (accessToken == null) {
    throw 'No Access Token found.';
  }
  if (idToken == null) {
    throw 'No ID Token found.';
  }

  final authResponse = await SupaFlow.client.auth.signInWithIdToken(
    provider: Provider.google,
    idToken: idToken,
    accessToken: accessToken,
  );
  return authResponse.user;
}
