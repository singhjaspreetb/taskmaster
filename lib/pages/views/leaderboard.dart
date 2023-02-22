import 'package:flutter/material.dart';

class User {
  final String name;
  int dailyStreak;

  User(this.name, this.dailyStreak);
}

void updateStreak(User user) {
  if (user.dailyStreak > 0) {
    user.dailyStreak += 1;
  } else {
    user.dailyStreak = 1;
  }
}

List<User> users = [
  User('Jaspreet', 10),
  User('Dibyajyoti', 8),
  User('Pratek Rai', 7),
  User('Nikhil Bisht', 7),
];

class Leaderboard extends StatefulWidget {
  const Leaderboard({super.key});

  @override
  State<Leaderboard> createState() => _LeaderboardState();
}

class _LeaderboardState extends State<Leaderboard> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            users[index].name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Daily Streak: ${users[index].dailyStreak}'),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              updateStreak(users[index]);
            },
          ),
        );
      },
    );
  }
}
