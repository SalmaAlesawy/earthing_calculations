import 'package:bloc/bloc.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_model/site_info_model.dart';
import 'package:earthing_calc/features/tests_features/site_info/site_info_model/site_info_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'site_info_state.dart';

class SiteInfoCubit extends Cubit<SiteInfoState> {
  final SiteInfoRepository repository;
  SiteInfoCubit({required this.repository}) : super(SiteInfoInitial());
 final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  TextEditingController projectNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController testDateController = TextEditingController();
  TextEditingController testByController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  Future<void> addProject(SiteInfoModel project) async {
    emit(SiteInfoLoadingState());
    try {
      await repository.addProject(project);
      emit(SiteInfoSuccessState());
    } catch (e) {
      emit(SiteInfoErrorState(errorMessage: e.toString()));
    }
  }
}
