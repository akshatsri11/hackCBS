import 'package:rakshak_sos/data/network/base_api_services.dart';
import 'package:rakshak_sos/data/network/network_api_services.dart';
import 'package:rakshak_sos/res/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      var response = await apiServices.postApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      var response =
          await apiServices.postApiResponse(AppUrl.registerUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
