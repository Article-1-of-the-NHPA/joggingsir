import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:joggigsir/data_provider/shaker_provider.dart';
import 'package:joggigsir/data_provider/running_data.dart';
import 'package:joggigsir/views/home/initpage.dart';

void main() {
  RunningData runningData = RunningData();
  runApp(
      ChangeNotifierProvider(
        create: (context) => ShakeDetectorProvider(runningData),
        child: MyApp(runningData: runningData),
      )
  );
}