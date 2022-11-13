class Sound {
	final double min;
	final double max;
	final String file;
	final double volume;
	Sound({required this.min, required this.max, required this.file, required this.volume});
}

Sound compute(int timezone_delta, int time_to_wake_up, double prev_meanness) {
List<Sound> tones=[ 
	Sound(min: 0.0, max: 0.7, file: "gadget.mp3", volume: 0.5),
	Sound(min: 0.0, max: 0.3, file: "bb.mp3", volume: 0.5),
];

List<Sound> voices= [
	Sound(min: 0.0, max: 0.2, file: "and_dun.wav", volume: 0.8),
	Sound(min: 0.2, max: 0.4, file: "landon.wav", volume: 0.8),
];
  double ttw = time_to_wake_up / 100 + 0.2;
  double tz_d = timezone_delta / 5;
  double score = ttw;
  score -= tz_d;
	score += prev_meanness;
	score /= 2;
	print("Score:");
	print(score);
  var l = (tones + voices)
      .where(
          (item) => (score > item.min && score < item.max))
      .toList();
  l.shuffle();
  return l[0];
}
