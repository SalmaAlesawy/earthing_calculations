part of 'site_info_cubit.dart';

@immutable
sealed class SiteInfoState {}

final class SiteInfoInitial extends SiteInfoState {}

final class SiteInfoLoadingState extends SiteInfoState {}

final class SiteInfoSuccessState extends SiteInfoState {}

final class SiteInfoErrorState extends SiteInfoState {
  final String errorMessage;
  SiteInfoErrorState({required this.errorMessage});
}
