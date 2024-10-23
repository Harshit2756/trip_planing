import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/routes/routes.dart'; // <-- Import AppRouter for routes
import 'core/routes/routes_name.dart'; // <-- Import route names
import 'core/theme.dart';
import 'view_model/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: RoutesName.home, // <-- Set the initial route
        onGenerateRoute:
            AppRouter.generateRoute, // <-- Use onGenerateRoute for navigation
      ),
    );
  }
}
