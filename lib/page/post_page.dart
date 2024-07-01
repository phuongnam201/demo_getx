import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learning_paginate/controller/post_controller.dart';
import 'package:learning_paginate/utils/app_constant.dart';
import 'package:learning_paginate/utils/dimension.dart';
import 'package:learning_paginate/widget/big_text.dart';
import 'package:learning_paginate/widget/icon_and_text.dart';
import 'package:learning_paginate/widget/small_text.dart';
import 'package:number_pagination/number_pagination.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    var selectedPageNumber = 1;
    return GetBuilder<PostController>(builder: (postController) {
      print(
          "length of post list: " + postController.postList.length.toString());
      return Scaffold(
        appBar: AppBar(
          title: Text("Post"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: Dimensions.height20),
          height: Dimensions.screenHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: Dimensions.width20),
                padding: EdgeInsets.only(bottom: Dimensions.font20),
                child: BigText(
                  text: "Các bài post",
                  color: Colors.blue[800],
                ),
              ),
              !postController.isLoaded
                  ? Container(
                      width: Dimensions.screenWidth,
                      color: Colors.grey[300],
                      child: Container(
                        margin: EdgeInsets.all(Dimensions.height20),
                        child: GridView.builder(
                          physics:
                              NeverScrollableScrollPhysics(), // Disable GridView's scrolling
                          shrinkWrap:
                              true, // Wrap the GridView inside SingleChildScrollView
                          itemCount: 2,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 250,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              //height: 200, // Độ cao của container
                              width:
                                  double.infinity, // Chiều rộng mở rộng toàn bộ
                              // Padding cho container
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 211, 201, 201),
                                    offset: const Offset(
                                      1.5,
                                      1.5,
                                    ),
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 150,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      //borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              "/storage/" +
                                              postController
                                                  .postList[index].image!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: Dimensions.width10,
                                        right: Dimensions.width10),
                                    width: Dimensions.screenWidth * 0.4,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: postController
                                              .postList[index].title!,
                                          color: Colors.blue[800],
                                          size: Dimensions.font16,
                                        ),
                                        IconAndTextWidget(
                                            icon: Icons.location_on,
                                            text: "Lorem",
                                            textSize: Dimensions.font16 - 6,
                                            iconSize: Dimensions.font16 - 6,
                                            textColor: Colors.grey,
                                            iconColor: Colors.grey),
                                        SmallText(
                                          text: postController
                                              .postList[index].metaDescription!,
                                          maxLines: 3,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : CircularProgressIndicator(),
              NumberPagination(
                onPageChanged: (int pageNumber) {
                  setState(() {
                    // Gọi phương thức để chuyển đến trang mới
                    //selectedPageNumber = pageNumber;
                    postController.getAllPostList(null, null, 2, pageNumber);
                  });
                },
                threshold: 2,
                pageTotal: postController.postList.length,
                pageInit:
                    postController.currentPage, // picked number when init page
                colorPrimary: Colors.blue,
                colorSub: Colors.white,
                buttonRadius: 50,
                buttonElevation: 10,
                groupSpacing: 5,
              ),
            ],
          ),
        ),
      );
    });
  }
}
