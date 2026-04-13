/// نموذج التقرير
class ReportModel {
  final String id;
  final ReportType type;
  final String title;
  final String description;
  final DateTime generatedAt;
  final String generatedBy;
  final Map<String, dynamic> data;
  final String? fileUrl;

  ReportModel({
    required this.id,
    required this.type,
    required this.title,
    required this.description,
    required this.generatedAt,
    required this.generatedBy,
    required this.data,
    this.fileUrl,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'] ?? '',
      type: ReportType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => ReportType.sales,
      ),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      generatedAt: DateTime.parse(json['generated_at'] ?? DateTime.now().toIso8601String()),
      generatedBy: json['generated_by'] ?? '',
      data: json['data'] ?? {},
      fileUrl: json['file_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type.name,
      'title': title,
      'description': description,
      'generated_at': generatedAt.toIso8601String(),
      'generated_by': generatedBy,
      'data': data,
      'file_url': fileUrl,
    };
  }
}

enum ReportType {
  sales,
  revenue,
  orders,
  products,
  customers,
  inventory,
  performance,
  custom,
}
