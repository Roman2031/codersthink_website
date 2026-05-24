class PortfolioModel {
  final String id;
  final String title;
  final String description;
  final String category;
  final List<String> tags;
  final String? imageUrl;
  final String? liveUrl;

  const PortfolioModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.tags,
    this.imageUrl,
    this.liveUrl,
  });
}
