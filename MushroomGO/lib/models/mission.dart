class Mission {
  final String title;
  final String description;
  final int currentProgress;
  final int goal;
  final String badge;
  final bool isEarned;
  final DateTime? earnedDate;

  Mission({
    required this.title,
    required this.description,
    required this.currentProgress,
    required this.goal,
    required this.badge,
    required this.isEarned,
    this.earnedDate,
  });
}
