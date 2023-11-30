import 'dart:async';

class RunningData {
  bool isRunning;
  bool isPaused;
  String route;
  int time;
  int steps;
  double distance;
  int reward;
  Stopwatch _stopwatch = Stopwatch();
  late Timer _timer;

  RunningData({
    this.isRunning = false,
    this.isPaused = false,
    this.route = '기본 장소',
    this.time = 0,
    this.steps = 0,
    this.distance = 0,
    this.reward = 0,
  }) {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (isRunning && !isPaused) {
        updateTimer();
      }
    });
  }

  // Getter for isRunning
  bool get getIsRunning => isRunning;

  // Setter for isRunning
  void setIsRunning(bool value) {
    isRunning = value;
  }

  // Getter for isPaused
  bool get getIsPaused => isPaused;

  // Setter for isPaused
  void setIsPaused(bool value) {
    isPaused = value;
  }

  // Getter for route
  String get getRoute => route;

  // Setter for route
  void setRoute(String value) {
    route = value;
  }

  // Getter for time
  int get getTime => time;

  // Setter for time
  void setTime(int value) {
    time = value;
  }

  // Getter for steps
  int get getSteps => steps;

  // Setter for steps
  void setSteps(int value) {
    steps = value;
    distance = steps * 0.0007;
    if (steps % 10 == 0) {
      reward ++;
    }
  }

  // Getter for distance
  double get getDistance => distance;

  // Setter for distance
  void setDistance(double value) {
    distance = value;
  }

  // Getter for reward
  int get getReward => reward;

  // Setter for reward
  void setReward(int value) {
    reward = value;
  }

  void toggleIsRunning() {
    isRunning = !isRunning;
  }

  void toggleIsPaused() {
    isPaused = !isPaused;
  }

  void updateTimer() {
    time++;
  }

  void startTimer() {
    if (isRunning) {
      if (isPaused) {
        toggleIsPaused();
      }
    } else {
      toggleIsRunning();
    }
    _stopwatch.start();
  }

  void stopTimer() {
    _stopwatch.stop();
  }

  // 초기화 함수
  void initializeData() {
    isRunning = false;
    isPaused = false;
    route = '기본 장소';
    time = 0;
    steps = 0;
    distance = 0;
    reward = 0;
  }
}
