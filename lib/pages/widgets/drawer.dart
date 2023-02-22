import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmaster/pages/auth/login_page.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key, this.name = 'Guest User', required this.press});
  final name;
  final Function(int) press;
  @override
  State<DrawerPage> createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  var currentIndex = 0;
  final double _drawerIconSize = 24;
  final double _drawerFontSize = 17;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
            0.0,
            1.0
          ],
              colors: [
            Theme.of(context).primaryColor.withOpacity(0.2),
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          ])),
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.0, 1.0],
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                widget.name,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person_2_rounded,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              setState(() {
                currentIndex = 1;
                HapticFeedback.lightImpact();
                widget.press(currentIndex);
              });
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(Icons.home,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              setState(() {
                currentIndex = 0;
                HapticFeedback.lightImpact();
                widget.press(currentIndex);
              });
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(Icons.timer,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'My Routine',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              setState(() {
                currentIndex = 2;
                HapticFeedback.lightImpact();
                widget.press(currentIndex);
              });
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(Icons.people_sharp,
                size: _drawerIconSize,
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              'Leader Board',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              setState(() {
                currentIndex = 3;
                HapticFeedback.lightImpact();
                widget.press(currentIndex);
              });
            },
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 1,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              size: _drawerIconSize,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: _drawerFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            onTap: () {
              SystemNavigator.pop();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
