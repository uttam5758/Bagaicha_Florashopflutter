import 'package:bagaicha_florashop/app.dart';
import 'package:bagaicha_florashop/app/service_locator/service_locator.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view/loginpage.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view/sign_up.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/login_view_model/login_view_model.dart';
import 'package:bagaicha_florashop/feature/auth/presentation/view_model/register_view_model/register_view_model.dart';
import 'package:bagaicha_florashop/screens/bottom_navigation.dart';
import 'package:bagaicha_florashop/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies and HiveService together
  await initDependencies();

  runApp(const BagaichaFlorashopApp());
}

class BagaichaFlorashopApp extends StatelessWidget {
  const BagaichaFlorashopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginViewModel>(
          create: (_) => serviceLocator<LoginViewModel>(),
        ),
        BlocProvider<RegisterViewModel>(
          create: (_) => serviceLocator<RegisterViewModel>(),
        ),
        // Add more bloc providers here if needed
      ],
      child: MaterialApp(
        title: 'Bagaicha Florashop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const LoginPage(),
          '/signup': (context) => const SignupScreen(),
          '/dashboard': (context) => BottomNavigation(),
        },
      ),
    );
  }
}
