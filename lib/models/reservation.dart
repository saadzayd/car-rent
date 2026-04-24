class Reservation {
  final int? id;
  final String carName;
  final String pickUpLocation;
  final String pickUpDate;
  final String pickUpTime;
  final String price;
  final String imagePath;

  Reservation({
    this.id,
    required this.carName,
    required this.pickUpLocation,
    required this.pickUpDate,
    required this.pickUpTime,
    required this.price,
    this.imagePath = '',
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int?,
      carName: json['carName'] ?? '',
      pickUpLocation: json['pickUpLocation'] ?? '',
      pickUpDate: json['pickUpDate'] ?? '',
      pickUpTime: json['pickUpTime'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['imagePath'] ?? '',
    );
  }
}
