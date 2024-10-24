import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:travel_app/view_model/login_view_model.dart';

import '../../view_model/home_view_model.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (context) => HomeViewModel()),
    ChangeNotifierProvider(create: (context) => AuthViewModel()),
  ];
}
