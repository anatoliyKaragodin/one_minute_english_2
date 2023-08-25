class Settings {
  final bool listeningOn;
  final bool pronunciationOn;
  final bool answerSoundOn;
  final int rating;

//<editor-fold desc="Data Methods">
  const Settings({
    required this.listeningOn,
    required this.pronunciationOn,
    required this.answerSoundOn,
    required this.rating,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Settings &&
          runtimeType == other.runtimeType &&
          listeningOn == other.listeningOn &&
          pronunciationOn == other.pronunciationOn &&
          answerSoundOn == other.answerSoundOn &&
          rating == other.rating);

  @override
  int get hashCode =>
      listeningOn.hashCode ^
      pronunciationOn.hashCode ^
      answerSoundOn.hashCode ^
      rating.hashCode;

  @override
  String toString() {
    return 'Settings{' +
        ' listeningOn: $listeningOn,' +
        ' pronunciationOn: $pronunciationOn,' +
        ' answerSoundOn: $answerSoundOn,' +
        ' rating: $rating,' +
        '}';
  }

  Settings copyWith({
    bool? listeningOn,
    bool? pronunciationOn,
    bool? answerSoundOn,
    int? rating,
  }) {
    return Settings(
      listeningOn: listeningOn ?? this.listeningOn,
      pronunciationOn: pronunciationOn ?? this.pronunciationOn,
      answerSoundOn: answerSoundOn ?? this.answerSoundOn,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'listeningOn': this.listeningOn,
      'pronunciationOn': this.pronunciationOn,
      'answerSoundOn': this.answerSoundOn,
      'rating': this.rating,
    };
  }

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      listeningOn: map['listeningOn'] as bool,
      pronunciationOn: map['pronunciationOn'] as bool,
      answerSoundOn: map['answerSoundOn'] as bool,
      rating: map['rating'] as int,
    );
  }

//</editor-fold>
}
