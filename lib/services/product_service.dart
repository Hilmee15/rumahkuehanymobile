import 'package:dio/dio.dart';
import 'package:rumahkuehany/api/api.dart';
import 'package:rumahkuehany/config/apiconfig.dart';
import 'package:rumahkuehany/models/cake.dart';

class CakeService {
  static Future<List<Cake>> getCakes(int id) async {
    final url = ApiConfig.cake + id.toString();
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseJson = response.data;
        final List listData = responseJson['data'];
        final List<Cake> cakes = [];
        for (final element in listData) {
          cakes.add(Cake.fromJson(element));
        }
        return cakes;
      }
      return [];
    } on DioError catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
