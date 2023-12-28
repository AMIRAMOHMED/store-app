class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;

  final String category;
  final String image;

  final RatingModel? rating;
  ProductModel(
      {required this.rating,
      required this.description,
      required this.id,
      required this.image,
      required this.category,
      required this.title,
      required this.price});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
        id: jsonData['id'],
        description: jsonData['description'],
        image: jsonData['image'],
        category: jsonData['category'],
        title: jsonData['title'],
        price: jsonData['price'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final dynamic count;
  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}
