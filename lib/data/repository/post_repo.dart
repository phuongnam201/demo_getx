import 'package:get/get.dart';
import 'package:learning_paginate/data/api/api_client.dart';
import 'package:learning_paginate/utils/app_constant.dart';

class PostRepo {
  final ApiClient apiClient;

  PostRepo({
    required this.apiClient,
  });

  Future<Response> getAllPostInfor({
    String? filter,
    String? locale,
    int? paginate,
    int? page,
  }) async {
    // Xây dựng danh sách tham số truy vấn từ các đối số được truyền vào
    Map<String, dynamic> parameters = {};

    if (filter != null) parameters['filter'] = filter;
    if (locale != null) parameters['language'] = locale;
    if (paginate != null) parameters['paginate'] = paginate.toString();
    if (page != null) parameters['page'] = page.toString();

    // Xây dựng URL từ danh sách tham số truy vấn
    String url = AppConstants.POST_URL;

    // Kiểm tra xem URL đã có tham số truy vấn nào chưa
    bool isFirstParam = true;

    parameters.forEach((key, value) {
      // Nếu là tham số đầu tiên, thêm dấu ? vào URL, ngược lại thêm dấu &
      if (isFirstParam) {
        url += '?';
        isFirstParam = false;
      } else {
        url += '&';
      }

      // Thêm tham số vào URL
      url += '$key=$value';
    });

    // Lấy dữ liệu từ API bằng cách gọi hàm từ ApiClient
    return await apiClient.getData(url);
  }
}
