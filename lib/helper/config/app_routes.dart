import 'package:get/get.dart';

import '../../features/login/login_screen.dart';
import '../../features/sign_up/sign_up_screen.dart';
import '../../screens/home_screen/home_screen.dart';
import '../../screens/registration_screen.dart';

final List<GetPage> appRoutes = [
  GetPage(
    name: RegistrationScreen.routeName,
    page: () => const RegistrationScreen(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: SignUpScreen.routeName,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
  ),
];
