import 'package:dio/dio.dart';
import 'package:rumahkuehany/api/api.dart';
import 'package:rumahkuehany/config/apiconfig.dart';
import 'package:rumahkuehany/models/category.dart';

class CategoryService {
  static Future<List<Category>> getCategory() async {
    const url = ApiConfig.category;
    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        final responseJson = response.data;
        final List listData = responseJson['data'];
        final List<Category> categories = [];
        for (final element in listData) {
          categories.add(Category.fromJson(element));
        }
        return categories;
      }
      return [];
    } on DioError catch (e) {
      return [];
    } catch (e) {
      return [];
    }
  }
}
