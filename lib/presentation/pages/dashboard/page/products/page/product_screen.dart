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
  final TextEditingController _searchController = TextEditingController();

  List<Product> list = [];
  List<Product> filteredList = [];

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
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 8, right: 8),
                child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      setState(() {
                        filterMainList();
                      });
                    },
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle:
                          TextStyle(color: CustomColor.grey, fontSize: 16),
                      prefixIcon: IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/image/searchlight.png"),
                            color: CustomColor.lightgrey,
                            size: 16,
                          ),
                          onPressed: () {}),
                      filled: true,
                      fillColor: Color(0xffdadde0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                        borderSide: BorderSide.none,
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              (filteredList.length == 0)
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "No Products available",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: CustomColor.black, fontSize: 14),
                      ),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    Product item = filteredList[index];
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
                            "SKU Weight:   ${item.skuWeight ?? "n/a"}",
                            style: TextStyle(
                                color: CustomColor.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "NoOf SKU In Case:   ${item.noOfSKUInCase ?? "n/a"}",
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
                          Container(
                            width: double.infinity,
                            height: 0.5,
                            color: CustomColor.textGrey,
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: filteredList.length,
                ),
              ),
            ],
          );
  }

  void updateList() async {
    list.clear();
    ProductResponse? productResponse =
        await DatabaseRepository().getProductData();
    list.addAll(productResponse?.productList ?? []);
    filterMainList();
    setState(() {});
  }

  void filterMainList() {
    String? searchQuery = _searchController.text;
    filteredList.clear();
    filteredList.addAll(list.where((e) {
      if (searchQuery.length > 0) {
        bool isItemMatched =
            e.name?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false;
        return isItemMatched;
      } else {
        return true;
      }
    }));
  }
}
