import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_planning/core/routes/routes_name.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: const Icon(Icons.login, color: Colors.white),
              onPressed: () => loginViewModel.loginWithGoogle(context),
              label: const Text('Login with Google'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.login, color: Colors.white),
              onPressed: () => Navigator.of(context).pushReplacementNamed(
                  RoutesName.homeView,
                  arguments: {"name": "Sourany!"}),
              label: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
