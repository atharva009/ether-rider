import 'package:ether_rider/Widgets/ProgressDialog.dart';
import 'package:flutter/material.dart';
import 'package:ether_rider/Services/AuthenticationService.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.18,
                    left: MediaQuery.of(context).size.height * 0.05),
                child: Text('Hello\n    There',
                    style: TextStyle(color: Colors.white, fontSize: 40)),
              ),
              SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: _key,
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.5,
                          right: 35,
                          left: 35),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: 'Email',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  fillColor: Colors.grey.shade100,
                                  filled: true,
                                  hintText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Color(0xff4c505b),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      if (_key.currentState!.validate()) {
                                        signInUser();
                                      }
                                    },
                                    icon: Icon(Icons.arrow_forward_ios)),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'register');
                                  },
                                  child: Text(
                                    'Do not have an account? Register Here',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 15,
                                      color: Color(0xff4c505b),
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInUser() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Authenticating, Please wait...");
        });

    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);

    if (authResult == null) {
      Navigator.pop(context);
      //print('Sign in error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter correct credentials"),
      ));
    } else {
      _emailController.clear();
      _passwordController.clear();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Login Successful"),
      ));

      Navigator.pushNamed(context, 'userRole');
    }
  }
}
