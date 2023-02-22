import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:taskmaster/pages/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  final Color _primaryColor = HexColor('#1184e8');
  final Color _accentColor = HexColor('#000');

  App({super.key});

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
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
