class TvShowModel {
  final int id;
  final String name;
  final String image;

  TvShowModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] != null ? json['image']['medium'] : '',
    );
  }
}