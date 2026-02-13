import 'package:flutter/material.dart';
import '../../shared/widgets/hero_header.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/icon_container.dart';
import '../../shared/widgets/custom_icons.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  int _selectedTab = 0; // 0 for Access Logs, 1 for My Devices

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HeroHeader(
            icon: Icons.security,
            title: 'Security & Access',
            subtitle: 'Manage your community access and security',
          ),
          _buildTabNavigation(),
          Expanded(
            child: _selectedTab == 0
                ? _buildAccessLogsContent()
                : _buildMyDevicesContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabNavigation() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingMedium,
        vertical: AppConstants.spacingSmall,
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTabButton(
              label: 'Access Logs',
              isSelected: _selectedTab == 0,
              onTap: () => setState(() => _selectedTab = 0),
            ),
          ),
          const SizedBox(width: AppConstants.spacingSmall),
          Expanded(
            child: _buildTabButton(
              label: 'My Devices',
              isSelected: _selectedTab == 1,
              onTap: () => setState(() => _selectedTab = 1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppConstants.spacingSmall),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _buildAccessLogsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: "Today's Activity"),
          _buildAccessLogCard(
            icon: Icons.check_circle,
            iconColor: Colors.green[300]!,
            title: 'Main Gate Entry',
            description: 'Vehicle: ABC 1234 - White Tesla Model 3',
            time: '2:45 PM',
            tagLabel: 'Face Recognition',
            tagColor: Colors.green[100]!,
            tagTextColor: Colors.green[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildAccessLogCard(
            icon: Icons.vpn_key,
            iconColor: AppTheme.primaryBlue,
            title: 'Villa Main Door',
            description: 'Smart lock unlocked',
            time: '8:30 AM',
            tagLabel: 'Mobile App',
            tagColor: AppTheme.blue100,
            tagTextColor: AppTheme.blue800,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildAccessLogCard(
            icon: Icons.camera_alt,
            iconColor: Colors.purple[300]!,
            title: 'Visitor Approved',
            description: 'Delivery person - Amazon',
            time: '7:15 AM',
            tagLabel: 'QR Code',
            tagColor: Colors.purple[100]!,
            tagTextColor: Colors.purple[800]!,
          ),
          const SizedBox(height: AppConstants.spacingMedium),
          const SectionHeader(title: 'Yesterday'),
          _buildAccessLogCard(
            icon: Icons.check_circle,
            iconColor: Colors.green[300]!,
            title: 'Main Gate Exit',
            description: 'Vehicle: ABC 1234',
            time: '6:20 PM',
            tagLabel: 'RFID Tag',
            tagColor: Colors.green[100]!,
            tagTextColor: Colors.green[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildAccessLogCard(
            icon: Icons.warning,
            iconColor: Colors.orange[300]!,
            title: 'Guest Entry Attempted',
            description: 'Unauthorized - Security notified',
            time: '2:30 PM',
            tagLabel: 'Manual Override Required',
            tagColor: Colors.orange[100]!,
            tagTextColor: Colors.orange[800]!,
          ),
        ],
      ),
    );
  }

  Widget _buildAccessLogCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String time,
    String? tagLabel,
    required Color tagColor,
    required Color tagTextColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: Colors.grey[200]!),
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
          IconContainer(icon: icon, color: iconColor),
          const SizedBox(width: AppConstants.paddingMedium),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                if (tagLabel != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tagLabel,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: tagTextColor,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyDevicesContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Registered Devices'),
          _buildDeviceCard(
            icon: Icons.vpn_key,
            iconColor: AppTheme.primaryBlue,
            title: 'iPhone 14 Pro',
            subtitle: 'Mobile App Access',
            status: 'Active',
            lastUsed: 'Last used: Today at 2:45 PM',
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildDeviceCard(
            icon: Icons.camera_alt,
            iconColor: Colors.purple[300]!,
            title: 'RFID Card #1234',
            subtitle: 'Main Gate Access',
            status: 'Active',
            lastUsed: 'Last used: Yesterday at 6:20 PM',
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildDeviceCard(
            icon: Icons.security,
            iconColor: AppTheme.primaryBlue,
            title: 'Face ID',
            subtitle: 'Biometric Access',
            status: 'Active',
            lastUsed: 'Last used: Today at 2:45 PM',
          ),
          const SizedBox(height: AppConstants.spacingMedium),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryBlue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Add New Device',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeviceCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String status,
    required String lastUsed,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconContainer(icon: icon, color: iconColor),
              const SizedBox(width: AppConstants.paddingMedium),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green[800],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Row(
            children: [
              Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                lastUsed,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

