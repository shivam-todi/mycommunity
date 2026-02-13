enum DeviceStatus { active, inactive }

class Device {
  final String id;
  final String name;
  final String accessType;
  final DeviceStatus status;
  final DateTime lastUsed;
  final String iconName;
  final int colorValue;

  const Device({
    required this.id,
    required this.name,
    required this.accessType,
    required this.status,
    required this.lastUsed,
    required this.iconName,
    required this.colorValue,
  });
}

