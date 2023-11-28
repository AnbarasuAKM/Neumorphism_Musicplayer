import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicplayee/Screens/Homescreen.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController namecontroller =TextEditingController();
  TextEditingController phonenumbercontroller =TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6eefe),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
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
                            offset: Offset(-10, -10),
                            color: Colors.white.withOpacity(0.30),
                            blurRadius: 15),
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Colors.black26.withOpacity(0.20),
                            blurRadius: 15)
                      ]),
                  child: Icon(
                    Icons.account_circle,
                    size: 140,
                    color: Colors.orangeAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    "Sign up",
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
                            offset: Offset(-0.6, -12),
                            color: Colors.black12.withOpacity(0.04),
                            blurRadius: 15),
                        BoxShadow(
                            offset: Offset(0.4, 20),
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 15)
                      ]),
                  child: TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.orangeAccent,
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontFamily: "Tuesday",
                          color: Colors.orangeAccent),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.white10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
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
                              offset: Offset(-0.6, -12),
                              color: Colors.black12.withOpacity(0.05),
                              blurRadius: 15),
                          BoxShadow(
                              offset: Offset(0.4, 20),
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 15)
                        ]),
                    child: TextField(
                      controller: phonenumbercontroller,
                      decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.call,
                          color: Colors.orangeAccent,
                        ),
                        hintText: "Mobile Number",
                        hintStyle: TextStyle(
                            fontSize: 20,
                            fontFamily: "Tuesday",
                            color: Colors.orangeAccent),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.white10)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(color: Colors.white)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white10,
                            )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password ?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.orangeAccent),
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(HomeScreens());

                  },
                  child: Padding(
                    padding:  EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.orangeAccent),
                      child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 17),
                          )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Or Login In with",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
