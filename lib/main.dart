import 'package:flutter/material.dart';
import 'package:elastic_bean_stalk/Utils/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteManager.signup,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
