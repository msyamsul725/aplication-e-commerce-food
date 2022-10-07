// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hyper_ui/core.dart';
import 'package:flutter_hyper_ui/shared/util/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  return runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: FloatMainNavigationView()));
}
