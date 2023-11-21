class Property {
  final int id;
  final String name;
  final String address;
  final String price;
  final String squareFeet;
  final int bedrooms;
  final int bathrooms;
  final bool garage;
  final bool patio;
  final bool elevator;
  final int typeOfProperty;
  final int? furnitureInventory;

  Property({
    required this.id,
    required this.name,
    required this.address,
    required this.price,
    required this.squareFeet,
    required this.bedrooms,
    required this.bathrooms,
    required this.garage,
    required this.patio,
    required this.elevator,
    required this.typeOfProperty,
    this.furnitureInventory,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      price: json['price'],
      squareFeet: json['squareFeet'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      garage: json['garage'],
      patio: json['patio'],
      elevator: json['elevator'],
      typeOfProperty: json['typeOfProperty'],
      furnitureInventory: json['furnitureInventory'],
    );
  }
}
