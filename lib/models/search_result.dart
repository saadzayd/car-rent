class SearchResult {
  final int? id;
  final String image;
  final String name;
  final String price;
  final String features;
  final String duration;

  SearchResult({
    this.id,
    this.image = '',
    required this.name,
    required this.price,
    required this.features,
    required this.duration,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      id: json['id'] as int?,
      image: json['carImage'] ?? '',
      name: json['carName'] ?? '',
      price: json['carPrice'] ?? '',
      features: json['carFeatures'] ?? '',
      duration: json['carDuration'] ?? '',
    );
  }
}
