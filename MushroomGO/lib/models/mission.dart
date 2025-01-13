class Mission {
  final String? id;
  final String title;
  final String description;
  final String condition;
  final String frequency;
  final String type;
  final String badgeFile;
  final int? currentProgress;
  final int goal;
  final bool? isEarned;
  final DateTime? earnedDate;

  Mission({
    required this.title,
    required this.description,
    required this.condition,
    required this.frequency,
    required this.type,
    this.currentProgress,
    required this.goal,
    required this.badgeFile,
    this.isEarned,
    this.id,
    this.earnedDate,
  });

  factory Mission.fromMap(Map<String, Object?> data, {String? id}) {
    return Mission(
      id: id,
      title: data['title'].toString(),
      description: data['description'].toString(),
      condition: data['condition'].toString(),
      frequency: data['frequency'].toString(),
      type: data['type'].toString(),
      badgeFile: data['badge_file'].toString(),
      goal: data['goal'] as int,
    );
  }

  Mission copyWith({
    String? id,
    String? title,
    String? description,
    String? condition,
    String? frequency,
    String? type,
    String? badgeFile,
    int? currentProgress,
    int? goal,
    bool? isEarned,
    DateTime? earnedDate,
  }) {
    return Mission(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      condition: condition ?? this.condition,
      frequency: frequency ?? this.frequency,
      type: type ?? this.type,
      badgeFile: badgeFile ?? this.badgeFile,
      currentProgress: currentProgress ?? this.currentProgress,
      goal: goal ?? this.goal,
      isEarned: isEarned ?? this.isEarned,
      earnedDate: earnedDate ?? this.earnedDate?.toUtc(),
    );
  }
}
