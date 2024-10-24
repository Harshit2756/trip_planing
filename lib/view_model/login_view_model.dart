import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../core/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier {
  loginWithGoogle(BuildContext context) async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      print(userCredential.user!.email);
      Navigator.of(context).pushReplacementNamed(RoutesName.homeView,
          arguments: {"name": userCredential.user!.displayName??"Sourany!"});
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  // final TextEditingController phoneController = TextEditingController();
  // final TextEditingController otpController = TextEditingController();
  // String _verificationId = '';
  // Timer? _timer;
  // int _start = 80;

  // // getters

  // int get start => _start;
  // Timer get timer => _timer!;

  // resendOtp(BuildContext context) {
  //   _start > 0
  //       ? null
  //       : () async {
  //           final auth = FirebaseAuth.instance;
  //           try {
  //             await auth.verifyPhoneNumber(
  //               phoneNumber: '+91${phoneController.text.trim()}',
  //               verificationCompleted: (_) {},
  //               verificationFailed: (e) {
  //                 ScaffoldMessenger.of(context).showSnackBar(
  //                   SnackBar(content: Text(e.message ?? 'Error')),
  //                 );
  //               },
  //               codeSent: (verificationId, resendToken) {
  //                 _start = 80;
  //                 startTimer();
  //               },
  //               codeAutoRetrievalTimeout: (_) {},
  //             );
  //           } on FirebaseAuthException catch (e) {
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               SnackBar(content: Text(e.message ?? 'Error')),
  //             );
  //           }
  //         };
  // }

  // void sendOtp(BuildContext context) async {
  //   if (phoneController.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('Please enter phone number')),
  //     );
  //     return;
  //   }
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: '+91${phoneController.text.trim()}',
  //       verificationFailed: (FirebaseAuthException error) {
  //         print('Verification failed: $error');
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {
  //         print('Code auto retrieval timeout');
  //         _verificationId = verificationId;
  //       },
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       codeSent: (String verificationId, int? forceResendingToken) {
  //         _verificationId = verificationId;
  //         print('Code sent: $verificationId');
  //         startTimer();
  //         Navigator.pushNamed(context, RoutesName.otpView);
  //       },
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(e.message ?? 'Error')),
  //     );
  //   }
  //   print('Sending OTP to ${phoneController.text.trim()}');
  // }

  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start < 1) {
  //         timer.cancel();
  //       } else {
  //         _start = _start - 1;
  //       }
  //     },
  //   );
  // }

  // verifyOtp(BuildContext context) async {
  //   final otp = otpController.text;
  //   if (otp.length != 6) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('OTP should be of 6 digits')),
  //     );
  //     return;
  //   }
  //   final auth = FirebaseAuth.instance;
  //   try {
  //     final credential = PhoneAuthProvider.credential(
  //       verificationId: _verificationId,
  //       smsCode: otp,
  //     );
  //     await auth.signInWithCredential(credential);
  //     Navigator.of(context).pushReplacementNamed(RoutesName.homeView);
  //   } on FirebaseAuthException catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text(e.message ?? 'Error'),
  //       ),
  //     );
  //   }
  // }
}
