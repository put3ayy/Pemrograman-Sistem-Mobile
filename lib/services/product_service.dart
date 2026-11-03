import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ProductService {
    static const String _baseUrl = 'https://fakestoreapi.com/products';

    static Future<List<Product>> fetchProducts() async {
        try {
            final response = await http
            .get(Uri.parse(_baseUrl))
            .timeout(const Duration(seconds: 10));

            print('fetchProducts status: ${response.statusCode}');

            if (response.statusCode == 200) {
                final List<dynamic> data = jsonDecode(response.body);
                return data
                    .map((item) => Product.fromJson(item as Map<String, dynamic>))
                    .toList();
            }
            else {
                throw Exception('Server error: ${response.statusCode}');
            }
        }
        catch (e, stackTrace) {
                print('fetchProduct error: $e');
                print('Stack trace: $stackTrace');
                rethrow;
    }
}

    static Future<Product> fetchProductDetail(int id) async {
        try {
            final response = await http
            .get(Uri.parse('$_baseUrl/$id'))
            .timeout(const Duration(seconds: 10));

            if (response.statusCode == 200) {
                return Product.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
            }
            else {
                throw Exception('Server error: ${response.statusCode}');
            }
               
        } 
        catch (e, stackTrace) {
        print('fetchProductDetail error: $e');
        print('Stack trace: $stackTrace');
        rethrow;
        }
    }
}
