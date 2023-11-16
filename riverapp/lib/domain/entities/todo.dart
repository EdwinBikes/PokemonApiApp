class Todo {
  final String id;
  final String description;
  final DateTime? completedAd;

  Todo({
    required this.id,
    required this.description,
    this.completedAd,
  });

  bool get done {
    return completedAd != null;
  }

  Todo copiWith({
    String? description,
    DateTime? completedAd,
  }) =>
      Todo(
        id: id,
        description: description ?? this.description,
        completedAd: completedAd ?? this.completedAd,
      );
}
