class SuperFunction {
  static String convertDuration(int duration) {
    final hours = duration ~/ 3600;
    final minutes = (duration % 3600) ~/ 60;
    final seconds = duration % 60;

    String result = '';

    if (hours > 0) {
      result += hours.toString().padLeft(2, '0') + ':';
    }

    result += minutes.toString().padLeft(2, '0') +
        ':' +
        seconds.toString().padLeft(2, '0');

    return result;
  }
}
