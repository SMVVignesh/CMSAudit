
class ProductResponse {
  List<Product> productList = [];
  ProductResponse.fromJson(List<dynamic> response) {
    productList = response.map((item) => Product.fromJson(item)).toList();
  }

  List<dynamic> toJson() {
    return productList.map((item) =>item.toJson()).toList();
  }
}
class Product {
  String? id;
  String? name;
  String? description;
  String? imagePath;
  String? barCode;
  num? skuWeight;
  String? skuWeightType;
  num? noOfSKUInCase;
  num? noOfPiecesInSKU;
  num? skuPieceWeight;
  num? bestBefore;
  num? taxInPercent;
  String? fryingTypeTemp;
  String? fryingTime;
  String? productTypeId;
  String? productTypeName;
  String? productCategoryId;
  String? productCategoryName;
  String? brandId;
  String? brandName;

  Product(
      {this.id,
        this.name,
        this.description,
        this.imagePath,
        this.barCode,
        this.skuWeight,
        this.skuWeightType,
        this.noOfSKUInCase,
        this.noOfPiecesInSKU,
        this.skuPieceWeight,
        this.bestBefore,
        this.taxInPercent,
        this.fryingTypeTemp,
        this.fryingTime,
        this.productTypeId,
        this.productTypeName,
        this.productCategoryId,
        this.productCategoryName,
        this.brandId,
        this.brandName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imagePath = json['imagePath'];
    barCode = json['barCode'];
    skuWeight = json['skuWeight'];
    skuWeightType = json['skuWeightType'];
    noOfSKUInCase = json['noOfSKUInCase'];
    noOfPiecesInSKU = json['noOfPiecesInSKU'];
    skuPieceWeight = json['skuPieceWeight'];
    bestBefore = json['bestBefore'];
    taxInPercent = json['taxInPercent'];
    fryingTypeTemp = json['fryingTypeTemp'];
    fryingTime = json['fryingTime'];
    productTypeId = json['productTypeId'];
    productTypeName = json['productTypeName'];
    productCategoryId = json['productCategoryId'];
    productCategoryName = json['productCategoryName'];
    brandId = json['brandId'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imagePath'] = this.imagePath;
    data['barCode'] = this.barCode;
    data['skuWeight'] = this.skuWeight;
    data['skuWeightType'] = this.skuWeightType;
    data['noOfSKUInCase'] = this.noOfSKUInCase;
    data['noOfPiecesInSKU'] = this.noOfPiecesInSKU;
    data['skuPieceWeight'] = this.skuPieceWeight;
    data['bestBefore'] = this.bestBefore;
    data['taxInPercent'] = this.taxInPercent;
    data['fryingTypeTemp'] = this.fryingTypeTemp;
    data['fryingTime'] = this.fryingTime;
    data['productTypeId'] = this.productTypeId;
    data['productTypeName'] = this.productTypeName;
    data['productCategoryId'] = this.productCategoryId;
    data['productCategoryName'] = this.productCategoryName;
    data['brandId'] = this.brandId;
    data['brandName'] = this.brandName;
    return data;
  }
}
