import 'package:flutter/material.dart';
import 'utils/theme.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/profile_setup_screen.dart';
import 'database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await DatabaseHelper().database;
    print('Base de données initialisée avec succès');
  } catch (e) {
    print("Erreur lors de l'initialisation de la base de données: $e");
  }
  runApp(SauveMoiApp());
}

class SauveMoiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sauve Moi',
      theme: appTheme,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/profile_setup': (context) => ProfileSetupScreen(),
      },
    );
  }
}
