class CarCategory {
  final int? id;
  final String imagePath;
  final String name;

  CarCategory({
    this.id,
    required this.imagePath,
    required this.name,
  });

  factory CarCategory.fromJson(Map<String, dynamic> json) {
    return CarCategory(
      id: json['id'] as int?,
      imagePath: json['imagePath'] ?? '',
      name: json['imageName'] ?? json['name'] ?? '',
    );
  }
}
