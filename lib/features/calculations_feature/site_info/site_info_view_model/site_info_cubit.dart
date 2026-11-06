import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_model/site_info_model.dart';
import 'package:earthing_calc/features/calculations_feature/site_info/site_info_model/site_info_repository.dart';
import 'package:flutter/cupertino.dart';

part 'site_info_state.dart';

class SiteInfoCubit extends Cubit<SiteInfoState> {
  final SiteInfoRepository repository;
  SiteInfoCubit({required this.repository}) : super(SiteInfoInitial());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController clientNameController = TextEditingController();
  TextEditingController contractorNameController = TextEditingController();
  TextEditingController consultantNameController = TextEditingController();
  SiteInfoModel? currentProject;
  void saveProjectTemporarily(SiteInfoModel project) {
    currentProject = project;
    emit(SiteTempInfoState());
  }

  Future<void> addProject(
    SiteInfoModel project,
    List<Uint8List> screenshots,
  ) async {
    emit(SiteInfoLoadingState());
    try {
      await repository.addProject(project, screenshots);
      emit(SiteInfoSuccessState());
    } catch (e) {
      emit(SiteInfoErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> getProjects() async {
    print("getProjects called ");
    emit(SiteInfoLoadingState());
    try {
      final projects = await repository.getProjects();
      print("Projects Found: ${projects.length}");
      emit(SiteInfoLoadedState(projects: projects));
    } catch (error) {
      print("FireStore error: $error");
      emit(SiteInfoErrorState(errorMessage: error.toString()));
    }
  }
}
