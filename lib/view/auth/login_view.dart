import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          icon: const Icon(Icons.login, color: Colors.white),
          onPressed: () => loginViewModel.loginWithGoogle(context),
          label: const Text('Login with Google'),
        ),
      ),
    );
  }
}
