import 'package:flutter/material.dart';
import 'package:local_notifications/services/local_notifications_services.dart';
import 'package:timezone/data/latest_10y.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Local Notifications'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  LocalNotifications.notificationIntilization();
                  LocalNotifications.showNotification();
                },
                child: const Text('Test Me')),
            ElevatedButton(
                onPressed: () {
                  LocalNotifications.scheduleTime();
                },
                child: const Text('scheduled = 5 sec')),
            ElevatedButton(onPressed: () {}, child: const Text('group')),
          ],
        ),
      ),
    ));
  }
}
