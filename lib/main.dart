import 'package:elastic_bean_stalk/Utils/Routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: RouteManager.home,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
