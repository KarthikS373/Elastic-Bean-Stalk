import 'package:elastic_bean_stalk/Utils/Routes/routes.dart';
import 'package:elastic_bean_stalk/Utils/Theme/theme.dart';

import 'package:flutter/material.dart';

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
      theme: (CustomTheme.isDark) ? CustomTheme.darkTheme() : CustomTheme.lightTheme(),
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
