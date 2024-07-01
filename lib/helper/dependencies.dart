import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_paginate/controller/post_controller.dart';
import 'package:learning_paginate/data/api/api_client.dart';
import 'package:learning_paginate/data/repository/post_repo.dart';
import 'package:learning_paginate/utils/app_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  //khoi tao local storage
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  //repo
  Get.lazyPut(() => PostRepo(apiClient: Get.find()));

  //controller
  Get.lazyPut(() => PostController(postRepo: Get.find()));
}
