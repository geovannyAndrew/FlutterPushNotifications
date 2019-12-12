import 'package:flutter/material.dart';
import 'package:push_notifications/src/pages/home_page.dart';
import 'package:push_notifications/src/pages/message_page.dart';
import 'package:push_notifications/src/providers/push_nofitications_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushNotificationProvider = PushNotificationProvider();
    pushNotificationProvider.initNotifications();
    pushNotificationProvider.messages.listen((argument){
      //Navigator.pushNamed(context, 'message');
      print('===== Argument push ==========');
      print(argument);
      navigatorKey.currentState.pushNamed('message', arguments: argument);
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Push Local',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'    : (BuildContext context) => HomePage(),
        'message' : (BuildContext context) => MessagePage(),
      },
    );
  }
}