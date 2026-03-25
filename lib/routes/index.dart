
import 'package:flutter/material.dart';
import 'package:shop/pages/index.dart';
import 'package:shop/pages/login.dart';


Widget getApp() {
  return MaterialApp(
    initialRoute: "/index",
    routes: getRoutes(),
  );
}

Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    "/index": (ctx){return IndexPage();},
    "/login": (ctx){return LoginPage();},
  };
}