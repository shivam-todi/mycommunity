import 'package:flutter/material.dart';
import '../../shared/widgets/hero_header.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/icon_container.dart';
import '../../shared/widgets/status_badge.dart';
import '../../shared/widgets/custom_icons.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            HeroHeader(
              icon: Icons.calendar_today,
              title: 'Facilities',
              subtitle: 'Book community amenities',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppConstants.paddingMedium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildUpcomingBookings(),
                    const SizedBox(height: AppConstants.spacingMedium),
                    _buildAvailableFacilities(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingBookings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'My Upcoming Bookings'),
        Container(
          padding: const EdgeInsets.all(AppConstants.paddingMedium),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border(
              left: BorderSide(color: AppTheme.primaryBlue, width: 4),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              IconContainer(
                color: AppTheme.primaryBlue,
                isSwimmingPoolIcon: true,
              ),
              const SizedBox(width: AppConstants.paddingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Swimming Pool - Lane 3',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today,
                            size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          'Tomorrow, Jan 18',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 14, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          '7:00 AM - 8:00 AM',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    StatusBadge(
                      label: 'Confirmed',
                      backgroundColor: AppTheme.blue100,
                      textColor: AppTheme.blue800,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableFacilities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Available Facilities'),
        _buildFacilityCard(
          icon: Icons.pool,
          iconColor: Colors.blue[300]!,
          title: 'Swimming Pool',
          description: 'Olympic-size heated pool with 6 lanes',
          location: 'Central Amenities',
          hours: '6 AM - 10 PM',
          isSwimmingPool: true,
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildFacilityCard(
          icon: Icons.fitness_center,
          iconColor: Colors.purple[300]!,
          title: 'Fitness Center',
          description: 'State-of-the-art gym equipment & trainers',
          location: 'Building A',
          hours: '5 AM - 11 PM',
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildFacilityCard(
          icon: Icons.people,
          iconColor: Colors.purple[300]!,
          title: 'Party Hall',
          description: 'Spacious hall for events & celebrations',
          location: 'Clubhouse Level 2',
          capacity: '50 person capacity',
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildFacilityCard(
          icon: Icons.sports_tennis,
          iconColor: Colors.green[300]!,
          title: 'Tennis Court',
          description: 'Professional tennis court with night lights',
          location: 'Available from Jan 25',
          isUnderMaintenance: true,
        ),
      ],
    );
  }

  Widget _buildFacilityCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    String? location,
    String? hours,
    String? capacity,
    bool isUnderMaintenance = false,
    bool isSwimmingPool = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconContainer(
            icon: isSwimmingPool ? null : icon,
            color: iconColor,
            isSwimmingPoolIcon: isSwimmingPool,
          ),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (isUnderMaintenance)
                      StatusBadge(
                        label: 'Under Maintenance',
                        backgroundColor: Colors.red[100]!,
                        textColor: Colors.red[800]!,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(height: 8),
                if (location != null && hours != null)
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.access_time,
                          size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        hours,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  )
                else if (location != null && capacity != null)
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.people, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        capacity,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  )
                else if (location != null)
                  Row(
                    children: [
                      Icon(Icons.location_on,
                          size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

