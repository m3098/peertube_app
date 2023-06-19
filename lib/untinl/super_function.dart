class SuperFunction {
  static String convertDurationToText(int duration) {
    int hours = (duration / 3600).floor();
    int minutes = ((duration % 3600) / 60).floor();
    int remainingSeconds = duration % 60;
    return '$hours:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}
