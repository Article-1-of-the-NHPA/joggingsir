import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:joggigsir/data_provider/running_data.dart';


class ShakeDetectorProvider with ChangeNotifier {
  ShakeDetector? _shaker;

  ShakeDetector get shaker => _shaker!;

  ShakeDetectorProvider(RunningData runningData) {
    _shaker = ShakeDetector.autoStart(
      shakeSlopTimeMS: 500,
      shakeThresholdGravity: 1.5,
      onPhoneShake: () {
        if (runningData.getIsRunning && !runningData.getIsPaused) {
          runningData.setSteps(runningData.getSteps + 1);
        }
        notifyListeners();
      },
    );
  }
}
