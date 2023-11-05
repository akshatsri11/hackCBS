import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:rakshak_sos/data/app_exceptions.dart';
import 'package:rakshak_sos/data/network/base_api_services.dart';

Dio dio = Dio();

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      var response = await dio.get(url).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Internet connection Error");
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      var response = await dio
          .post(
            url,
            data: data,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Internet connection Error");
    }

    return responseJson;
  }
}

dynamic returnResponse(response) {
  switch (response.statusCode) {
    case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 400:
      throw BadRequestException(message: response.body.toString());
    case 404:
      throw UnauthorizedException(message: response.body.toString());
  }
}
