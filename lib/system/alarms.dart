class Alarm {
	final DateTime at;
	final bool repeat_weekly;
	final int time_to_wake;
	final int last_timezone;

	Alarm({required this.at, this.repeat_weekly, this.time_to_wake, this.last_timezone});
}

