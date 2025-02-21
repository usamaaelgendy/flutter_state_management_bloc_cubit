import 'dart:convert';

import 'package:flutter_state_management_bloc_cubit/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepo {
  getProductData() async {
    var url = Uri.https('fakestoreapi.com', 'products');
    var response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final List<dynamic> list = jsonDecode(response.body);
        return list.map((json) => ProductModel.fromMap(json)).toList();
      } else {
        throw Exception('Fail To Get Data');
      }
    } catch (e) {
      throw Exception('Fail To Get Data');
    }
  }
}
