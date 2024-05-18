import 'package:flutter/material.dart';
import 'package:meme_app/components/button.dart';
import 'package:meme_app/constants/constants.dart';
import 'package:meme_app/provider/setting_provider.dart';
import 'package:meme_app/views/login/signup.dart';
import 'package:meme_app/views/screens/home.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCntrl = TextEditingController();
    TextEditingController passwordCntrl = TextEditingController();
    var prov = Provider.of<SettingProvider>(context, listen: false);

    return Scaffold(
      body: Consumer<SettingProvider>(
        builder: (context, value, child) {
          return Container(
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
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Text(
                    "Welcome Back,",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Sign in to continue",
                    style: TextStyle(
                      fontSize: 18,
                      color: grey,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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
                    controller: passwordCntrl,
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
                  InkWell(
                    onTap: () async {
                      await prov.getData();
                      var email = emailCntrl.text;
                      bool emailExists = value.data
                          .any((element) => element["user"]["email"] == email);

                      if (!emailExists) {
                        print("Wrong email");
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: SignButton(name: "Sign in"),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(color: grey),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all<Color>(paleBlue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
