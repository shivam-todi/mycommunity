# My Community App - Architecture

## Folder Structure

```
lib/
├── main.dart                          # App entry point
├── core/
│   ├── constants/
│   │   └── app_constants.dart        # App-wide constants
│   └── theme/
│       └── app_theme.dart            # Theme configuration
├── features/
│   ├── navigation/
│   │   └── main_screen.dart          # Main navigation screen
│   ├── home/
│   │   └── home_screen.dart          # Home screen
│   ├── security/
│   │   └── security_screen.dart       # Security & Access screen
│   ├── booking/
│   │   └── booking_screen.dart       # Facilities booking screen
│   ├── bills/
│   │   └── bills_screen.dart         # Bills & Payments screen
│   └── support/
│       └── support_screen.dart       # Service Requests screen
└── shared/
    ├── models/                        # Data models
    │   ├── support_ticket.dart
    │   ├── bill.dart
    │   ├── facility.dart
    │   ├── access_log.dart
    │   └── device.dart
    └── widgets/                       # Reusable widgets
        ├── custom_icons.dart
        ├── status_badge.dart
        ├── icon_container.dart
        ├── section_header.dart
        └── hero_header.dart
```

## Design Principles Applied

### SOLID Principles
- **Single Responsibility**: Each screen, widget, and model has a single, well-defined purpose
- **Open/Closed**: Widgets are extensible through composition
- **Liskov Substitution**: Models can be extended without breaking functionality
- **Interface Segregation**: Small, focused interfaces
- **Dependency Inversion**: Dependencies on abstractions (models) not concretions

### KISS (Keep It Simple, Stupid)
- Simple, readable code
- No over-engineering
- Clear naming conventions
- Minimal nesting

### Clean Code
- Meaningful names
- Small functions
- DRY (Don't Repeat Yourself)
- Consistent formatting
- Proper separation of concerns

