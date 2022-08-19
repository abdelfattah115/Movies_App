import '../../domain/entity/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
      backdropPath: json['backdrop_path'] ?? '/rLo9T9jEg67UZPq3midjLnTUYYi.jpg',
      id: json['id'],
    );
  }
}
