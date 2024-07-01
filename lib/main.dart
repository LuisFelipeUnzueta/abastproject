import 'package:abast_app/providers/abast_provider.dart';
import 'package:abast_app/routes.dart';
import 'package:abast_app/screens/about_screen.dart';
import 'package:abast_app/screens/dashboard_screen.dart';
import 'package:abast_app/screens/details_screen.dart';
import 'package:abast_app/screens/form_screen.dart';
import 'package:abast_app/screens/signin_screen.dart';
import 'package:abast_app/screens/signup_picture_screen.dart';
import 'package:abast_app/screens/signup_screen.dart';
import 'package:abast_app/screens/veiculos_list_screen.dart';
import 'package:abast_pk/abast_pk.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth_provider.dart';
import 'screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AbastProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Auto Control Panel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple,
          hintColor: Colors.purpleAccent,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
          ),
        ),
        routes: {
          Routes.SIGNIN: (context) => SigninScreen(),
          Routes.SIGNUP: (context) => SignupScreen(),
          Routes.SIGNUPPICTURE: (context) => const SignUpPictureScreen(),
          Routes.HOME: (context) => const HomeScreen(),
          Routes.DASHBOARD: (context) => const DashboardScreen(),
          'about_screen': (context) => const AboutScreen(),
          'details_screen': (context) => DetailsScreen(),
          Routes.FORM: (context) => const FormScreen(),
          Routes.VEICULOSLISTSCREEN: (context) => const VeiculosListScreen(),
        },
      ),
    );
  }
}
