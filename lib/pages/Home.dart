// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_api_larvel/models/register.dart';
import 'package:flutter_application_api_larvel/pages/loging.dart';
import 'package:flutter_application_api_larvel/services/Registerapi.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  String name = "";
  String email = "";
  String password = "";

  String c_password = "";
  final RegisterApi registerApi = RegisterApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register test"),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter name' : null,
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Email",
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
            Text(
              "confirme password",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Enter name' : null,
              onChanged: (value) {
                setState(() {
                  c_password = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final register = Register(
                        name: name,
                        email: email,
                        password: password,
                        c_password: c_password);
                    print(register);
                    dynamic result = await registerApi.createUser(register);
                    if (result.success == true) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    }
                  }
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )),
          ]),
        ));
  }
}
