import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'screenshot_state.dart';

class ScreenshotCubit extends Cubit<ScreenshotState> {
  ScreenshotCubit() : super(ScreenshotInitial());
}
