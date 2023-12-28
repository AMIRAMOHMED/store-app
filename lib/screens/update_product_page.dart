import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store/models/product_model.dart';
import 'package:store/widgets/custom_text.dart';

import '../services/update_product_service.dart';
import '../widgets/custome_buton.dart';

class UpdateProductPage extends StatefulWidget {
  static String id = "update product page";

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image, price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            "Update Product",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (data) {
                    productName = data;
                  },
                  hintText: "Product Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (data) {
                    image = data;
                  },
                  hintText: "image",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  inputType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                  hintText: "Price",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (data) {
                    desc = data;
                  },
                  hintText: "Description",
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButon(
                  text: "Update",
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    try {
                      await updateProduct(product);
                      print("secess");
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id!,
      title: productName == null ? product.title : productName!,
      image: image == null ? product.image : image!,
      price: price == null ? product.price.toString() : price!,
      desc: desc == null ? product.description : desc!,
      category: product.category!,
    );
  }
}
