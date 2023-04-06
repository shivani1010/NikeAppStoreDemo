class BaseModel {
  final int id;
  final String imageUrl;
  final String name;
  final double old_price;
  final double new_price;
  final String category;


  BaseModel( {
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.old_price,
    required this.new_price,
    required this.category

  });
}