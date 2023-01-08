import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:second/one.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _value = '';

  @override
  void initState() {
    super.initState();
    _loadValue();
  }

  // Load the value from SharedPreferences
  _loadValue() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _value = preferences.getString("value") ?? '';
    });
  }

  // Save the value to SharedPreferences
  _saveValue(String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("value", value);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shared Preferences Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Saved value:',
              ),
              Text(
                '$_value',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _saveValue('Hamid Faramarz ');
                },
                child: Text('Save Value'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _loadValue();
                },
                child: Text('Load Value'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
