import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'site_info_model.dart';

class SiteInfoRepository {
  final FirebaseFirestore fireStore;
  SiteInfoRepository(this.fireStore);
  Future<void> addProject(
    SiteInfoModel siteInfo,
    List<Uint8List> screenshots,
  ) async {
    List<String> images = screenshots
        .map((image) => base64Encode(image))
        .toList();
    await fireStore.collection("projects").add({
      ...siteInfo.toJson(),
      "screenshots": images,
    });
  }

  Future<List<SiteInfoModel>> getProjects() async {
    final snapshot = await fireStore.collection("projects").get();
    return snapshot.docs
        .map((doc) => SiteInfoModel.fromJson(doc.data()))
        .toList();
  }
}
