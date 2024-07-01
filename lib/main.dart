import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:learning_paginate/controller/post_controller.dart';
import 'package:learning_paginate/route/route_helper.dart';
import 'package:learning_paginate/utils/colors.dart';

import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(
    Duration(seconds: 3),
  );
  FlutterNativeSplash.remove();
  await dep.init();
  /**if app has trouble store memory */
  await Get.find<PostController>().getAllPostList(null, null, null, null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColors.mainColor,
        fontFamily: "Lato",
      ),
      //home: MainFoodPage(),
      initialRoute: RouteHelper.getHomePage(),
      getPages: RouteHelper.routes,
    );
  }
}
