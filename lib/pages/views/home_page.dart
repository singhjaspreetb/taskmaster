import 'package:flutter/material.dart';
import 'package:taskmaster/pages/chat/chat_screen.dart';
import 'package:taskmaster/pages/views/profile_page.dart';
import 'package:taskmaster/pages/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  void _onNavPressed(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Task Master",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          elevation: 0.5,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Theme.of(context).primaryColor,
                  Theme.of(context).colorScheme.secondary,
                ])),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(
                top: 16,
                right: 16,
              ),
              child: Stack(
                children: <Widget>[
                  const Icon(Icons.notifications_none),
                  // Positioned(
                  //   right: 0,
                  //   child: Container(
                  //     padding: const EdgeInsets.all(1),
                  //     decoration: BoxDecoration(
                  //       color: Colors.red,
                  //       borderRadius: BorderRadius.circular(6),
                  //     ),
                  //     constraints: const BoxConstraints(
                  //       minWidth: 12,
                  //       minHeight: 12,
                  //     ),
                  //     child: const Text(
                  //       '5',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 8,
                  //       ),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
            child: DrawerPage(
          press: (index) => _onNavPressed(index),
        )),
        body: Column(
          children: [
            if (index == 0) ...{
              const Expanded(
                child: ChatScreen(),
              )
            } else if (index == 1) ...{
              const ProfilePage(),
            }
          ],
        ));
  }
}
