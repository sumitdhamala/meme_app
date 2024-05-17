import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meme_app/constants/constants.dart';

import '../../components/button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.15,
            image: AssetImage("assets/images/bubbles.jpg"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome Back,",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                "Sign up to continue",
                style: TextStyle(
                  fontSize: 18,
                  color: grey,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Phone",
                  prefixIcon: Icon(
                    Icons.phone_enabled_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Password",
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SignButton(name: "Sign Up"),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    style: TextStyle(color: grey),
                  ),
                  TextButton(
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all<Color>(paleBlue)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
