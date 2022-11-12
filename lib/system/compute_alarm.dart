class AlarmTone {
  final double niceness;
  final String audio_file; // The asset path
  final List<VolCurve> vol;
  AlarmTone(
      {required this.niceness, required this.audio_file, required this.vol});
}

class VolCurve {
  final int volume;
  final DateTime at;
  VolCurve({required this.volume, required this.at});
}

AlarmTone compute(
    List<AlarmTone> tones, int timezone_delta, int time_to_wake_up) {
  double ttw = time_to_wake_up / 100 + 0.2;
  double tz_d = timezone_delta / 5;
  double score = ttw;
  score -= tz_d;
  var l = tones
      .where(
          (item) => item.niceness > score - 0.2 && item.niceness < score + 0.2)
      .toList();
  l.shuffle();
  return l[0];
}
