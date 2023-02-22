import 'package:flutter/material.dart';
import 'package:taskmaster/helper/helper_function.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:taskmaster/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDqodlU1gsWHSq2SSq58mjQK2Y1MBZwwNU",
            appId: "1:834374294994:web:a5c58ea92c73f7b5903c0b",
            messagingSenderId: "834374294994",
            projectId: "flutter-61f0e"));
  } else {
    await Firebase.initializeApp();
  }

  runApp(App());
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  Color _primaryColor = HexColor('#1184e8');

  Color _accentColor = HexColor('#000');
  bool _isSignedIn = true;

  // Design color
  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Master',
      theme: ThemeData(
        primaryColor: _primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
            .copyWith(secondary: _accentColor),
      ),
      home: const SplashScreen(title: 'Task Master'),
      // home: ChatScreen(),
    );
  }
}
