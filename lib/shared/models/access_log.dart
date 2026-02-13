class AccessLog {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final String accessMethod;
  final String iconName;
  final int colorValue;

  const AccessLog({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    required this.accessMethod,
    required this.iconName,
    required this.colorValue,
  });
}

