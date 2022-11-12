class AlarmTone {
	final int niceness;
	final String audio_file; // The asset path
	final List<VolCurve> vol;
	AlarmTone({this.niceness, this.audio_file, this.vol});
}

class VolCurve {
	final int volume;
	final DateTime at;
	VolCurve({this.volume, this.at});
}
