import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // color: Colors.red ,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Form(
                  child: Column(
                    children:  [
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const TextField(
                          decoration:
                          InputDecoration(
                              hintText: "Enter email or username",
                              filled: true,
                              // fillColor: ,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.black))
                          ),
                          autocorrect: false,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: const TextField(
                          decoration:
                          InputDecoration(
                              hintText: "Enter password",
                              filled: true,
                              // fillColor: Colors.green,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 3,color: Colors.black))
                          ),
                          autocorrect: false,
                        ),
                      )
                    ],

                  )
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
