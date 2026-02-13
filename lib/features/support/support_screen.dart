import 'package:flutter/material.dart';
import '../../shared/widgets/hero_header.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/icon_container.dart';
import '../../shared/widgets/status_badge.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            HeroHeader(
              icon: Icons.chat_bubble_outline,
              title: 'Service Requests',
              subtitle: 'Track your maintenance requests',
              actionButton: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppTheme.blue200, width: 1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add, color: AppTheme.primaryBlue, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      'New',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.primaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActiveRequestsSection(),
                    const SizedBox(height: 24),
                    _buildResolvedSection(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActiveRequestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionHeader(title: 'Active Requests (2)'),
        _buildActiveRequestCard(
          icon: Icons.water_drop,
          iconColor: Colors.orange[700]!,
          borderColor: Colors.orange[300]!,
          title: 'Bathroom Leak',
          ticketNumber: 'SR-2024-00145',
          description:
              'Water leaking from master bathroom sink. Plumber has been assigned.',
          createdTime: 'Created: 2 days ago',
          assignedTo: 'Assigned to: Ali Khan',
          status: 'In Progress',
          statusColor: Colors.yellow[100]!,
          statusTextColor: Colors.yellow[800]!,
          hasUpdate: true,
          updateText: 'Latest Update (1 hour ago):',
          updateQuote:
              '"Plumber will arrive tomorrow at 10 AM to fix the issue."',
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildActiveRequestCard(
          icon: Icons.ac_unit,
          iconColor: AppTheme.blue600,
          borderColor: AppTheme.primaryBlue,
          title: 'AC Not Cooling',
          ticketNumber: 'SR-2024-00148',
          description:
              'Living room AC not cooling properly. Needs inspection.',
          createdTime: 'Created: 5 hours ago',
          assignedTo: 'Awaiting assignment',
          status: 'Pending',
          statusColor: AppTheme.blue100,
          statusTextColor: AppTheme.blue800,
          hasUpdate: false,
        ),
      ],
    );
  }

  Widget _buildActiveRequestCard({
    required IconData icon,
    required Color iconColor,
    required Color borderColor,
    required String title,
    required String ticketNumber,
    required String description,
    required String createdTime,
    required String assignedTo,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    bool hasUpdate = false,
    String? updateText,
    String? updateQuote,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title row: icon + title/ticket + status badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconContainer(
                icon: icon == Icons.ac_unit ? null : icon,
                color: iconColor,
                isACIcon: icon == Icons.ac_unit,
              ),
              const SizedBox(width: AppConstants.spacingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Ticket #$ticketNumber',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              StatusBadge(
                label: status,
                backgroundColor: statusColor,
                textColor: statusTextColor,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          // Timestamps row
          Wrap(
            spacing: 16,
            runSpacing: 4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time, size: 14, color: Colors.grey[600]),
                  const SizedBox(width: 4),
                  Text(
                    createdTime,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    assignedTo.contains('Assigned')
                        ? Icons.build
                        : Icons.info_outline,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    assignedTo,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
          if (hasUpdate) ...[
            const SizedBox(height: AppConstants.paddingMedium),
            Divider(color: Colors.grey[200], height: 1),
            const SizedBox(height: AppConstants.paddingMedium),
            Text(
              updateText ?? '',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              updateQuote ?? '',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildResolvedSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionHeader(title: 'Resolved (3)'),
        _buildResolvedTicket(
          icon: Icons.lightbulb,
          title: 'Hallway Light Replacement',
          ticketNumber: 'SR-2024-00140',
          description: 'Hallway light bulb replaced successfully.',
          resolvedTime: 'Yesterday',
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildResolvedTicket(
          icon: Icons.build,
          title: 'Door Lock Repair',
          ticketNumber: 'SR-2024-00135',
          description: 'Main door lock mechanism repaired.',
          resolvedTime: '3 days ago',
        ),
        const SizedBox(height: AppConstants.spacingSmall),
        _buildResolvedTicket(
          icon: Icons.ac_unit,
          title: 'AC Filter Cleaning',
          ticketNumber: 'SR-2024-00128',
          description: 'All AC filters cleaned and serviced.',
          resolvedTime: '1 week ago',
        ),
      ],
    );
  }

  Widget _buildResolvedTicket({
    required IconData icon,
    required String title,
    required String ticketNumber,
    required String description,
    required String resolvedTime,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border(
          left: BorderSide(color: Colors.green, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Title row: icon + title/ticket + status badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconContainer(
                icon: icon == Icons.ac_unit ? null : icon,
                color: Colors.green[700]!,
                isACIcon: icon == Icons.ac_unit,
              ),
              const SizedBox(width: AppConstants.spacingSmall),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ticket #$ticketNumber',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              StatusBadge(
                label: 'Resolved',
                backgroundColor: Colors.green[100]!,
                textColor: Colors.green[800]!,
                icon: Icons.check_circle,
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Text(
            description,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Text(
            'Resolved: $resolvedTime',
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
