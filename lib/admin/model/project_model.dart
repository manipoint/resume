// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProjectModel {
  final String name;
  final String description;
  final List<String> images;
  final String sourceCode;
  final String sourceUrl;

  ProjectModel(
      {required this.name,
      required this.description,
      required this.images,
      required this.sourceCode,
      required this.sourceUrl});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'images': images,
      'sourceCode': sourceCode,
      'sourceUrl': sourceUrl,
    };
  }

  factory ProjectModel.fromMap(Map<String, dynamic> map) {
    return ProjectModel(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      images: List<String>.from(map['images']),
      sourceCode: map['sourceCode'] ?? '',
      sourceUrl: map['sourceUrl'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProjectModel.fromJson(String source) =>
      ProjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  ProjectModel copyWith({
    String? name,
    String? description,
    List<String>? images,
    String? sourceCode,
    String? sourceUrl,
  }) {
    return ProjectModel(
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      sourceCode: sourceCode ?? this.sourceCode,
      sourceUrl: sourceUrl ?? this.sourceUrl,
    );
  }
}
