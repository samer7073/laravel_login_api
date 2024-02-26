import 'package:flutter/material.dart';

class MyAcount extends StatefulWidget {
  final String token;
  final String name;
  const MyAcount({required this.token, required this.name});

  @override
  State<MyAcount> createState() => _MyAcountState();
}

class _MyAcountState extends State<MyAcount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mon Compte')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            widget.token,
            style: TextStyle(fontWeight: FontWeight.w200, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
