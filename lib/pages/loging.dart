// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_api_larvel/pages/myAcount.dart';
import 'package:flutter_application_api_larvel/services/loginApi.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  final LoginApi loginapi = LoginApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "email",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              TextFormField(
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic result =
                          await loginapi.loginUser(email, password);
                      if (result.success == true) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyAcount(
                              token: result.data.token,
                              name: result.data.name,
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ],
          )),
    );
  }
}
