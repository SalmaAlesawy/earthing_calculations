import 'package:cloud_firestore/cloud_firestore.dart';

class SiteInfoModel {
  final String projectName;
  final String location;
  final DateTime? testDate;
  final String testBy;
  final String? notes;

  SiteInfoModel({
    required this.projectName,
    required this.location,
    required this.testDate,
    required this.testBy,
    required this.notes,
  });
  Map<String, dynamic> toJson() {
    return {
      'project-name': projectName,
      'location': location,
      "test-date": testDate != null ? Timestamp.fromDate(testDate!) : null,
      'test-by': testBy,
      'notes': notes,
    };
  }

  factory SiteInfoModel.fromJson(Map<String, dynamic> json) {
    return SiteInfoModel(
      projectName: json['name'],
      location: json['location'],
      testDate: (json['test-date'] as Timestamp?)?.toDate(),
      testBy: json['test-by'],
      notes: json['notes'],
    );
  }
}
