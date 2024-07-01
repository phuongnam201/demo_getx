import 'package:get/get.dart';
import 'package:learning_paginate/data/repository/post_repo.dart';
import 'package:learning_paginate/model/post_model.dart';

class PostController extends GetxController implements GetxService {
  final PostRepo postRepo;
  PostController({required this.postRepo});

  List<Post> _postList = [];
  List<Post> get postList => _postList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _currentPage = 1;
  int get currentPage => _currentPage;

  int _totalPages = 1;
  int get totalPages => _totalPages;

  Future<void> getAllPostList(
      String? filter, String? language, int? paginate, int? page) async {
    print("paginate: " + paginate.toString());
    print("page: " + page.toString());
    try {
      // Kiểm tra nếu paginate hoặc page là null, thì gán giá trị mặc định là 10 và 1
      paginate ??= 2;
      page ??= 2;
      Response response = await postRepo.getAllPostInfor(
          filter: filter, locale: language, page: page, paginate: paginate);
      if (response.statusCode == 200) {
        _isLoaded = true;
        _postList.clear();
        List<dynamic> dataList = response.body["results"];
        dataList.forEach((postData) {
          Post post = Post.fromJson(postData);
          _postList.add(post);
        });
        //_totalPages = response.body["total_pages"];
        _isLoaded = false;
        _currentPage = page;
        update();
      } else {
        // Handle the case when the response status code is not 200
      }
    } catch (e) {
      // Handle exceptions or errors
      print("Error in getAllPostList: $e");
    }
  }

  void nextPage() {
    if (_currentPage < _totalPages) {
      _currentPage++;
      getAllPostList(null, null, null, _currentPage);
    }
  }

  void previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      getAllPostList(null, null, null, _currentPage);
    }
  }

  Post getPostByPostID(int postID) {
    for (Post post in _postList) {
      if (post.id == postID) {
        return post;
      }
    }
    return Post();
  }
}
