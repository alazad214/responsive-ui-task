import 'package:dio/dio.dart';
import 'package:m360_ict_task/core/networks/endpoinds.dart';
import 'package:m360_ict_task/features/home/model/product_model.dart';

class ProductService {
  final Dio _dio = Dio();

  Future<ProductModel> fetchProducts(int skip, int limit) async {
    final response = await _dio.get(
      '$baseUrl${Endpoints.products()}',
      queryParameters: {'skip': skip, 'limit': limit},
    );
    return ProductModel.fromJson(response.data);
  }
}
