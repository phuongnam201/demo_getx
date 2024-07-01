import 'package:get/get.dart';
import 'package:learning_paginate/page/home_page.dart';
import 'package:learning_paginate/page/post_page.dart';

class RouteHelper {
  static const String home = "/";
  static const String post = "/post";

  static String getHomePage() => '$home';
  static String getPostPage() => '$post';

  static List<GetPage> routes = [
    GetPage(
      name: home,
      page: () => HomePage(),
      transition: Transition.leftToRight,
    ),
    GetPage(name: post, page: () => PostPage()),
    // GetPage(
    //   name: postDetail,
    //   page: () {
    //     var pageId = Get.parameters['pageId'];
    //     var page = Get.parameters["page"];
    //     return PostDetail(pageId: int.parse(pageId!), page: page!);
    //   },
    //   transition: Transition.fadeIn,
    // ),
  ];
}
