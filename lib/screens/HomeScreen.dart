import 'package:flutter/material.dart';
class HomeScreen  {
  final APP_NAME = "MedAlarm";
  Widget bodyWidget;
  Map<String, WidgetBuilder> routes;
  String title;

  HomeScreen(title, bodyWidget, routes) {
    this.bodyWidget = bodyWidget;
    this.routes = routes;
    this.title = title;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        title: APP_NAME,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text(this.title),
            ),
            body: bodyWidget),
        routes: this.routes);
  }
}
