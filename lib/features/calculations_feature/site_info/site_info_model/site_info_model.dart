class SiteInfoModel {
  final String projectName;
  final String contractorName;
  final String clientName;
  final String consultantName;
  final String location;
  final List<String> screenshots;
  SiteInfoModel({
    required this.projectName,
    required this.contractorName,
    required this.clientName,
    required this.consultantName,
    required this.location,
    this.screenshots = const [],
  });
  Map<String, dynamic> toJson() {
    return {
      'project-name': projectName,
      'contractor-name': contractorName,
      "client-name": clientName,
      'consultant-name': consultantName,
      'location': location,
      'screenshots': screenshots,
    };
  }

  factory SiteInfoModel.fromJson(Map<String, dynamic> json) {
    return SiteInfoModel(
      projectName: json['project-name'],
      contractorName: json['contractor-name'],
      clientName: json['client-name'],
      consultantName: json['consultant-name'],
      location: json['location'],
      screenshots: List<String>.from(json['screenshots'] ?? []),
    );
  }
}
