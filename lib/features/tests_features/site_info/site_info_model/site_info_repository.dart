import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_model/site_info_model.dart';

class SiteInfoRepository {
  final FirebaseFirestore firestore;
  SiteInfoRepository(this.firestore);
  Future<void> addProject(SiteInfoModel siteInfo) async {
    await firestore.collection("projects").add(siteInfo.toJson());
  }
}
