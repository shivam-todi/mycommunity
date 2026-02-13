# Refactoring Guide

## Completed
✅ Folder structure created
✅ Core constants and theme
✅ Shared widgets (custom_icons, status_badge, icon_container, section_header, hero_header)
✅ Models (support_ticket, bill, facility, access_log, device)
✅ Main navigation screen extracted
✅ Home screen extracted
✅ Clean main.dart

## Remaining Screens to Extract

The following screens need to be extracted from the original implementation:

1. **Security Screen** (`lib/features/security/security_screen.dart`)
   - Access Logs tab
   - My Devices tab
   - Access log cards
   - Device cards

2. **Booking Screen** (`lib/features/booking/booking_screen.dart`)
   - Upcoming bookings
   - Available facilities list
   - Facility cards

3. **Bills Screen** (`lib/features/bills/bills_screen.dart`)
   - Outstanding balance card
   - Pending/Paid tabs
   - Bill cards

4. **Support Screen** (`lib/features/support/support_screen.dart`)
   - Active requests
   - Resolved requests
   - Support ticket cards

## Pattern to Follow

Each screen should:
- Import shared widgets and models
- Use constants from `app_constants.dart`
- Follow the same structure as `home_screen.dart`
- Keep private helper methods for building UI components
- Use the shared widgets where possible

## Next Steps

1. Extract each remaining screen following the Home screen pattern
2. Update imports in `main_screen.dart` if needed
3. Run `flutter analyze` to check for issues
4. Test each screen to ensure functionality is preserved

