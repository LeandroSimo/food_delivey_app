class ProductModel {
  String imageCard, imageDetail, name, description;
  double price, rate;
  Special special;
  ProductModel(
      {required this.imageCard,
      required this.imageDetail,
      required this.name,
      required this.price,
      required this.rate,
      required this.description,
      required this.special});
}

class Special {
  final String name, image;

  Special({required this.name, required this.image});
}

List<ProductModel> products = [
  ProductModel(
    imageCard: 'burger/beef_burger.png',
    imageDetail: 'burger/beef_burger2.png',
    name: 'Beef Burger',
    price: 6.59,
    rate: 4.8,
    special: Special(name: 'Cheesy Mozarella', image: 'cheese.png'),
    description: desc,
  ),
  ProductModel(
    imageCard: 'burger/double_burger.png',
    imageDetail: 'burger/double_burger2.png',
    name: 'Double Burger',
    price: 7.49,
    rate: 4.8,
    special: Special(name: 'Double Beef', image: 'beef.png'),
    description: desc,
  )
];
var desc =
    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ";
