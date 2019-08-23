import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //statusBar设置为透明，去除半透明遮罩
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //将style设置到app
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // platform: TargetPlatform.iOS,
        primaryColor: Colors.white,
      ),
      // initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      home: checkLogin(),
    );
  }
}
