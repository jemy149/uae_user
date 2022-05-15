class Feature {
  Feature({
    this.id,
    this.image,
    this.name,
    this.price,
    this.value
  });

  int? id;
  String? name;
  String? price;
  String? image;
  bool? value;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    id: json['id'],
    image: json['image'],
    name: json['name'],
    price: json['price'],
    value: json['value'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'image': image,
    'value': value,
  };
}