// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../view_model/login_view_model.dart';

// class OtpView extends StatelessWidget {
//   const OtpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final authViewModel = Provider.of<AuthViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(title: const Text('OTP Verification')),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Enter the OTP sent to your phone number',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: authViewModel.otpController,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: 'Enter OTP',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () => authViewModel.verifyOtp(context),
//               child: const Text('Verify'),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Resend OTP in ${authViewModel.start ~/ 60}:${authViewModel.start.remainder(60).toString().padLeft(2, '0')}',
//                   style: TextStyle(
//                     color: authViewModel.start > 0
//                         ? Colors.grey
//                         : Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => authViewModel.resendOtp(context),
//                   child: const Text('Resend OTP'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
