class ProductModel {
  String name;
  double rate;
  int reviews;
  int orders;
  String oldPrice;
  String newPrice;
  String image;
  bool fav;
  String category;
  ProductModel(
      {required this.name,
      required this.rate,
      required this.orders,
      required this.reviews,
      required this.oldPrice,
      required this.newPrice,
      required this.image,
      required this.fav,
      required this.category});
}
