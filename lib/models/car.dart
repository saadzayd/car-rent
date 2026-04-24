class Car {
  final int? id;
  final int catId;
  final String name;
  final String image;
  final String type;
  final String seatNumber;
  final String mileage;
  final String fuelType;
  final String status;
  final double price;

  Car({
    this.id,
    required this.catId,
    required this.name,
    this.image = '',
    this.type = '',
    this.seatNumber = '',
    this.mileage = '',
    this.fuelType = '',
    this.status = '',
    required this.price,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      id: json['id'] as int?,
      catId: json['catId'] ?? 0,
      name: json['carName'] ?? '',
      image: json['carImage'] ?? '',
      type: json['carType'] ?? '',
      seatNumber: json['seatNumber'] ?? '',
      mileage: json['mileage'] ?? '',
      fuelType: json['fuelType'] ?? '',
      status: json['status'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
    );
  }
}
