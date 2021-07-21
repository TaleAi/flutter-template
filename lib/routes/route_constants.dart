import 'package:flutter/material.dart';

const String home = '/';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) {
        return Home();
      });
  }
}
