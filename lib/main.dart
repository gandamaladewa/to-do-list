import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_apk/app/config/router.dart';
import 'package:to_do_list_apk/app/config/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => debugPrint("Firebase Connected"))
      .catchError((e) => debugPrint(e.toString()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen.name,
      getPages: AppRouter.pages,
    );
  }
}
