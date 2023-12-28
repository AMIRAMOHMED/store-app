import 'package:store/helper/api.dart';

import '../models/product_model.dart';

class AllproductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    List<dynamic> data =
        await Api().get(url: "https://fakestoreapi.com/products");

    List<ProductModel> productsList = [];

    for (int i = 0; i < data.length; i++) {
      productsList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    print(productsList[1]);
    return productsList;
  }
}
