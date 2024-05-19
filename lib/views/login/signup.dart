import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meme_app/constants/constants.dart';
import 'package:http/http.dart' as http;

import '../../components/button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isPressed = false;
  TextEditingController emailCntrl = TextEditingController();
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController phoneCntrl = TextEditingController();
  TextEditingController passwordCntrl = TextEditingController();

  Future<void> addData() async {
    var response = await http.post(Uri.parse("$url/register"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': emailCntrl.text,
          'password': passwordCntrl.text,
          'name': nameCntrl.text,
          'phone': phoneCntrl.text
        }));
    var decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 201) {
      isPressed = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text("Account Created"),
        ),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(decodedResponse["message"]),
      ));
    }
  }

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
                controller: nameCntrl,
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
                controller: emailCntrl,
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
                controller: phoneCntrl,
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
                controller: passwordCntrl,
                decoration: InputDecoration(
                  hintText: "Password",
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
                  hintText: "Confirm Password",
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: grey,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              InkWell(
                  onTap: ()  {
                     addData();
                  },
                  child: SignButton(
                    name: "Sign Up",
                    isPressed: isPressed,
                  )),
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
                              WidgetStateProperty.all<Color>(paleBlue)),
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
