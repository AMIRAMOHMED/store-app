import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_product.dart';

import '../widgets/customcard.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  static String id = "home page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text("New Trend"),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.cartPlus,
                  color: Colors.black,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: FutureBuilder<List<ProductModel>>(
            future: AllproductsServices().getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products=snapshot.data!;
                return GridView.builder(
                  itemCount:products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 100,
                            crossAxisSpacing: 25,
                            childAspectRatio: 1.5),
                    itemBuilder: (context, index) {
                      return CustomCard(product: products[index]);
                    });
              } else {
                return SizedBox();
              }
            },
          ),
        ));
  }
}
