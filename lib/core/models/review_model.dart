import '../entites/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final String reviewDescription;
  final String date;
  final num rating;

  ReviewModel({
    required this.name,
    required this.image,
    required this.reviewDescription,
    required this.date,
    required this.rating,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      reviewDescription: reviewEntity.reviewDescription,
      date: reviewEntity.date,
      rating: reviewEntity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      reviewDescription: json['reviewDescription'],
      date: json['date'],
      rating: json['rating'],
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      reviewDescription: reviewDescription,
      date: date,
      rating: rating,
    );
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'reviewDescription': reviewDescription,
      'date': date,
      'rating': rating,
    };
  }
}
