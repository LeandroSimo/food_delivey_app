class CategoriesModel {
  String image, name;

  CategoriesModel({required this.image, required this.name});
}

List<CategoriesModel> categories = [
  CategoriesModel(image: 'burger.png', name: 'Burguer'),
  CategoriesModel(image: 'pizza.png', name: 'Pizza'),
  CategoriesModel(image: 'cup_cake.png', name: 'Cup Cake'),
];
