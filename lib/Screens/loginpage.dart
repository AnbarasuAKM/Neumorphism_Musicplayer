import 'package:flutter/material.dart';
import 'package:musicplayee/Screens/signinpage.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emialcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffe6eefe),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(0, 60, 0, 0),
            child: Column(
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                      color: Colors.white38,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(-10, -10),
                            color: Colors.white.withOpacity(0.30),
                            blurRadius: 15),
                        BoxShadow(
                            offset: const Offset(10, 10),
                            color: Colors.black26.withOpacity(0.20),
                            blurRadius: 15)
                      ]),
                  child: const Icon(
                    Icons.account_circle,
                    size: 140,
                    color: Colors.orangeAccent,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Login in",
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: "Tuesday",
                        color: Colors.orangeAccent),
                  ),
                ),
                Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white38,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(-0.6, -12),
                            color: Colors.black12.withOpacity(0.04),
                            blurRadius: 15),
                        BoxShadow(
                            offset: const Offset(0.4, 20),
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 15)
                      ]),
                  child: TextField(
                    controller: emialcontroller,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.mail_outline,
                        color: Colors.orangeAccent,
                      ),
                      hintText: "Enter Your Email",
                      hintStyle: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Tuesday",
                          color: Colors.orangeAccent),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: const BorderSide(color: Colors.white)),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.white10,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    width: 300,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white38,
                        shape: BoxShape.rectangle,
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(-0.6, -12),
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 15),
                          BoxShadow(
                              offset: const Offset(0.4, 20),
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 15)
                        ]),
                    child: TextField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.lock,
                          color: Colors.orangeAccent,
                        ),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Tuesday",
                            color: Colors.orangeAccent),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.white10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(color: Colors.white)),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.white10,
                        )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(SignInPage());
                        },
                      child: Text(
                        "Sign in ?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.orangeAccent),
                      ),
                    )
                  ],
                ),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.orangeAccent),
                      child: const Center(
                          child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      )),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Or Login In with",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(-10, -10),
                                  color: Colors.white.withOpacity(0.30),
                                  blurRadius: 15),
                              BoxShadow(
                                  offset: const Offset(10, 10),
                                  color: Colors.black26.withOpacity(0.20),
                                  blurRadius: 15)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Facebook_Logo_2023.png/1200px-Facebook_Logo_2023.png"),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(-10, -10),
                                  color: Colors.white.withOpacity(0.30),
                                  blurRadius: 15),
                              BoxShadow(
                                  offset: const Offset(10, 10),
                                  color: Colors.black26.withOpacity(0.20),
                                  blurRadius: 15)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              "https://cdn4.iconfinder.com/data/icons/social-messaging-ui-color-shapes-2/128/social-circle-google-plus-2-512.png"),
                        )),
                    Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white38,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(-10, -10),
                                  color: Colors.white.withOpacity(0.30),
                                  blurRadius: 15),
                              BoxShadow(
                                  offset: const Offset(10, 10),
                                  color: Colors.black26.withOpacity(0.20),
                                  blurRadius: 15)
                            ]),
                        child: const CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Instagram_logo_2016.svg/240px-Instagram_logo_2016.svg.png"),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
