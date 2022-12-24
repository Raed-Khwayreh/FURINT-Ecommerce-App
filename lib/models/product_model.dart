class ProductModel {
  String? id;
  String name;
  double? rate;
  int? reviews;
  int? orders;
  String oldPrice;
  String newPrice;
  String image;
  bool? fav;
  String? catId;
  String? category;
  ProductModel(
      {required this.name,
      this.rate,
      this.orders,
      this.reviews,
      required this.oldPrice,
      required this.newPrice,
      required this.image,
      this.fav,
      required this.category,
      this.catId});
}
