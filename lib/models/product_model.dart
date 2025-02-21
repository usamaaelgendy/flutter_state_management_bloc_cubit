import 'package:equatable/equatable.dart';
import 'package:flutter_state_management_bloc_cubit/models/rating_model.dart';

class ProductModel extends Equatable {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final RatingModel ratingModel;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingModel,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as int,
      title: map['title'] as String,
      price: map['price'] as num,
      description: map['description'] as String,
      category: map['category'] as String,
      image: map['image'] as String,
      ratingModel: RatingModel.fromMap(map['rating']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'ratingModel': ratingModel,
    };
  }

  @override
  List<Object?> get props => [id, title, price, description, category, image, ratingModel];
}
