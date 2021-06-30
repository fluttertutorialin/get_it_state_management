import 'dart:async';
import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/env.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/country_controller.dart';
import 'di/injection/injection.dart';

/// EndPoint default
void main() => Main();

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    return MyApp();
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _countryController = getIt.get<CountryController>();

  void _incrementCounter() {
    _countryController.getCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('GetX with get_it')),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Text('You have pushed the button calling the api')
            ])),
        floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add)));
  }
}
