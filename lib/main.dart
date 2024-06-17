
import 'package:flutter/material.dart';
import 'package:test_app_sql/core/internal/di/sl.dart';
import 'package:test_app_sql/feature/app/main_route_app.dart';

void main() {
  configureDependencies();

  runApp(const MainRouteApp());
}


