import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_provider_base.dart';

class _AndriodAuthProvider implements AuthProviderBase {
  @override
  Future<FirebaseApp> initialize() async {
    return await Firebase.initializeApp(
      name: "Monarchs of Something",
      options: FirebaseOptions(
          apiKey: "AIzaSyD-mJFU_gDZ-UYDos7zmkYBwRl57ctGNlI",
          authDomain: "monarchs-of-something.firebaseapp.com",
          projectId: "monarchs-of-something",
          storageBucket: "monarchs-of-something.appspot.com",
          messagingSenderId: "353055307322",
          appId: "1:353055307322:android:3f0362cfeaf8a6dafba703",
          measurementId: "G-9M2WCQJY2Q"),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

class AuthProvider extends _AndriodAuthProvider {}