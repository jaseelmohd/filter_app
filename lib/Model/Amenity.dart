class Amenity {
  String text;
  bool isSelected;

  Amenity({this.text, this.isSelected = false});
  toJson() {
    return {
      'text': text,
      'isSelected': isSelected.toString(),
    };
  }

  static List<Amenity> list = [
    Amenity(text: 'WiFi'),
    Amenity(text: 'Projector'),
    Amenity(text: 'Whiteboard'),
    Amenity(text: 'Printer/Scanner'),
    Amenity(text: 'TV/Monitor'),
    Amenity(text: 'Kitchen'),
  ];
}
