import 'package:filter_app/Model/Property.dart';

class Item {
  String name, addr, img;
  double price, rating, units, popularity, reviews;
  Property properties;
  bool availability;

  Item({
    this.name,
    this.addr,
    this.img,
    this.price,
    this.rating,
    this.units,
    this.popularity,
    this.availability,
    this.properties,
    this.reviews,
  });

  toJson() {
    return {
      'name': name,
    };
  }

  static List<Item> itemList = [
    Item(
      name: 'Funda Spaces',
      addr: 'HSR Layout, Bangalore',
      img: 'img/pic1.jpg',
      price: 30000,
      rating: 4,
      units: 5,
      popularity: 8,
      reviews: 100,
      properties: Property(
        wifi: true,
        projector: true,
        whiteboard: false,
        printer: true,
        tv: true,
        kitchen: true,
      ),
      availability: true,
    ),
    Item(
      name: 'Green Oasis',
      addr: 'MG Road, Bangalore',
      img: 'img/pic1.jpg',
      price: 20000,
      rating: 3.5,
      units: 6,
      popularity: 6,
      reviews: 33,
      properties: Property(
        wifi: true,
        projector: false,
        whiteboard: false,
        printer: false,
        tv: true,
        kitchen: true,
      ),
      availability: true,
    ),
    Item(
      name: 'Emerald Heights',
      addr: 'Koramangala, Bangalore',
      img: 'img/pic1.jpg',
      price: 50000,
      rating: 4.5,
      units: 5,
      popularity: 9,
      reviews: 90,
      properties: Property(
        wifi: true,
        projector: true,
        whiteboard: true,
        printer: false,
        tv: true,
        kitchen: true,
      ),
      availability: true,
    ),
    Item(
      name: 'Memphis Spaces',
      addr: 'Indira Nagar, Bangalore',
      img: 'img/pic1.jpg',
      price: 25000,
      rating: 3,
      units: 5,
      popularity: 7,
      reviews: 25,
      properties: Property(
        wifi: true,
        projector: false,
        whiteboard: false,
        printer: false,
        tv: true,
        kitchen: true,
      ),
      availability: false,
    ),
  ];
}
