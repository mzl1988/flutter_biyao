import 'package:flutter/material.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // platform: TargetPlatform.iOS,
        primaryColor: Colors.white,
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
