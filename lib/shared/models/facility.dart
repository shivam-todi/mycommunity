class Facility {
  final String id;
  final String name;
  final String description;
  final String location;
  final String? hours;
  final String? capacity;
  final bool isUnderMaintenance;
  final DateTime? availableFrom;
  final String iconName;
  final int colorValue;

  const Facility({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    this.hours,
    this.capacity,
    this.isUnderMaintenance = false,
    this.availableFrom,
    required this.iconName,
    required this.colorValue,
  });
}

