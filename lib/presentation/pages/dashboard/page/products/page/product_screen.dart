import 'package:cms_audit/domain/local_data_base/data_base_repository.dart';
import 'package:cms_audit/presentation/pages/dashboard/page/products/model/product_response.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/utils/custom_color.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> list = [];

  @override
  void initState() {
    super.initState();
    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return (list.length == 0)
        ? const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "No Products available right now.\n Go to Update Details screen and update.",
                textAlign: TextAlign.center,
                style: TextStyle(color: CustomColor.black, fontSize: 14),
              ),
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              Product item = list[index];
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.name ?? "",
                      style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sku Weight:   ${item.skuWeight ?? "n/a"}",
                      style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sku Piece Weight:   ${item.skuPieceWeight ?? "n/a"}",
                      style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Best Before:   ${item.bestBefore ?? "n/a"}",
                      style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Category:   ${item.productTypeName ?? "n/a"}",
                      style: TextStyle(
                          color: CustomColor.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),

                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: CustomColor.textGrey,
                    )
                  ],
                ),
              );
            },
            itemCount: list.length,
          );
  }

  void updateList() async {
    list.clear();
    ProductResponse? productResponse =
        await DatabaseRepository().getProductData();
    list.addAll(productResponse?.productList ?? []);
    setState(() {});
  }
}
