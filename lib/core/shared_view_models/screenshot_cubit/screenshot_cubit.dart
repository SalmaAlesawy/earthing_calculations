import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'screenshot_state.dart';

class ScreenshotCubit extends Cubit<List<Uint8List>> {
  ScreenshotCubit() : super([]);
  void addScreenshot(Uint8List? screenshot) {
    if (screenshot != null) {
      emit([...state, screenshot]);
      debugPrint("Added file. Total: ${state.length}");
      debugPrint("Cubit instance: ${identityHashCode(this)}");
    }
  }

  void clearScreenshots() {
    emit([]);
  }
}
