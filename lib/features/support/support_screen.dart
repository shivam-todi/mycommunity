import 'package:flutter/material.dart';
import '../../shared/widgets/hero_header.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/icon_container.dart';
import '../../shared/widgets/status_badge.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class SupportRequest {
  final String ticketNumber;
  final String title;
  final String category;
  final String description;
  final String status;
  final IconData icon;
  final Color iconColor;
  final Color borderColor;
  final Color statusColor;
  final Color statusTextColor;
  final String createdTime;
  final String assignedTo;
  final bool hasUpdate;
  final String? updateText;
  final String? updateQuote;

  SupportRequest({
    required this.ticketNumber,
    required this.title,
    required this.category,
    required this.description,
    required this.status,
    required this.icon,
    required this.iconColor,
    required this.borderColor,
    required this.statusColor,
    required this.statusTextColor,
    required this.createdTime,
    required this.assignedTo,
    this.hasUpdate = false,
    this.updateText,
    this.updateQuote,
  });
}

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  int _ticketCounter = 149; // Starting from 149 to continue sequence
  final List<SupportRequest> _activeRequests = [
    SupportRequest(
      ticketNumber: 'SR-2024-00145',
      title: 'Bathroom Leak',
      category: 'Plumbing',
      description: 'Water leaking from master bathroom sink. Plumber has been assigned.',
      status: 'In Progress',
      icon: Icons.water_drop,
      iconColor: Colors.orange[700]!,
      borderColor: Colors.orange[300]!,
      statusColor: Colors.yellow[100]!,
      statusTextColor: Colors.yellow[800]!,
      createdTime: 'Created: 2 days ago',
      assignedTo: 'Assigned to: Ali Khan',
      hasUpdate: true,
      updateText: 'Latest Update (1 hour ago):',
      updateQuote: '"Plumber will arrive tomorrow at 10 AM to fix the issue."',
    ),
    SupportRequest(
      ticketNumber: 'SR-2024-00148',
      title: 'AC Not Cooling',
      category: 'AC',
      description: 'Living room AC not cooling properly. Needs inspection.',
      status: 'Pending',
      icon: Icons.ac_unit,
      iconColor: AppTheme.blue600,
      borderColor: AppTheme.primaryBlue,
      statusColor: AppTheme.blue100,
      statusTextColor: AppTheme.blue800,
      createdTime: 'Created: 5 hours ago',
      assignedTo: 'Awaiting assignment',
    ),
  ];

  String _generateTicketNumber() {
    final year = DateTime.now().year;
    final number = _ticketCounter.toString().padLeft(5, '0');
    _ticketCounter++;
    return 'SR-$year-$number';
  }

  IconData _getIconForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'plumbing':
        return Icons.plumbing;
      case 'electrical':
        return Icons.electrical_services;
      case 'ac':
        return Icons.ac_unit;
      case 'general':
        return Icons.build;
      case 'cleaning':
        return Icons.cleaning_services;
      default:
        return Icons.info;
    }
  }

  Color _getColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'plumbing':
        return Colors.orange[700]!;
      case 'electrical':
        return Colors.amber[700]!;
      case 'ac':
        return AppTheme.blue600;
      case 'general':
        return Colors.grey[700]!;
      case 'cleaning':
        return Colors.blue[400]!;
      default:
        return AppTheme.primaryBlue;
    }
  }

  Color _getBorderColorForCategory(String category) {
    switch (category.toLowerCase()) {
      case 'plumbing':
        return Colors.orange[300]!;
      case 'electrical':
        return Colors.amber[300]!;
      case 'ac':
        return AppTheme.primaryBlue;
      case 'general':
        return Colors.grey[300]!;
      case 'cleaning':
        return Colors.blue[200]!;
      default:
        return AppTheme.blue200;
    }
  }

  void _showNewRequestForm() {
    final formKey = GlobalKey<FormState>();
    String selectedCategory = 'General';
    String selectedStatus = 'Pending';
    final descriptionController = TextEditingController();
    final ticketNumber = _generateTicketNumber();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) => Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Service Request',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ticket Number (Auto-generated, Read-only)
                          Text(
                            'Service Request Ticket #',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.confirmation_number,
                                    color: AppTheme.primaryBlue, size: 20),
                                const SizedBox(width: 12),
                                Text(
                                  ticketNumber,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 20),
                        // Category Dropdown
                        Text(
                          'Category *',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedCategory,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              border: InputBorder.none,
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'General', child: Text('General')),
                              DropdownMenuItem(
                                  value: 'Plumbing', child: Text('Plumbing')),
                              DropdownMenuItem(
                                  value: 'Electrical',
                                  child: Text('Electrical')),
                              DropdownMenuItem(
                                  value: 'AC', child: Text('AC')),
                              DropdownMenuItem(
                                  value: 'Cleaning',
                                  child: Text('Cleaning')),
                            ],
                            onChanged: (value) {
                              setModalState(() {
                                selectedCategory = value ?? 'General';
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Status Dropdown
                        Text(
                          'Status *',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonFormField<String>(
                            value: selectedStatus,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              border: InputBorder.none,
                            ),
                            items: const [
                              DropdownMenuItem(
                                  value: 'Pending', child: Text('Pending')),
                              DropdownMenuItem(
                                  value: 'In Progress',
                                  child: Text('In Progress')),
                            ],
                            onChanged: (value) {
                              setModalState(() {
                                selectedStatus = value ?? 'Pending';
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Description
                        Text(
                          'Description *',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: descriptionController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            hintText: 'Describe your service request...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                  color: AppTheme.primaryBlue, width: 2),
                            ),
                            contentPadding: const EdgeInsets.all(16),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        final newRequest = SupportRequest(
                          ticketNumber: ticketNumber,
                          title: selectedCategory,
                          category: selectedCategory,
                          description: descriptionController.text.trim(),
                          status: selectedStatus,
                          icon: _getIconForCategory(selectedCategory),
                          iconColor: _getColorForCategory(selectedCategory),
                          borderColor:
                              _getBorderColorForCategory(selectedCategory),
                          statusColor: selectedStatus == 'In Progress'
                              ? Colors.yellow[100]!
                              : AppTheme.blue100,
                          statusTextColor: selectedStatus == 'In Progress'
                              ? Colors.yellow[800]!
                              : AppTheme.blue800,
                          createdTime: 'Created: Just now',
                          assignedTo: 'Awaiting assignment',
                        );

                        setState(() {
                          _activeRequests.insert(0, newRequest);
                        });

                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Service request $ticketNumber created successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Create Request',
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
          ),
        ),
      ),
    ),
    );
  }

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
              actionButton: InkWell(
                onTap: _showNewRequestForm,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppTheme.blue200, width: 1),
                    borderRadius:
                        BorderRadius.circular(AppConstants.radiusMedium),
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
        SectionHeader(
            title: 'Active Requests (${_activeRequests.length})'),
        ..._activeRequests.map((request) => Padding(
              padding: const EdgeInsets.only(bottom: AppConstants.spacingSmall),
              child: _buildActiveRequestCard(
                icon: request.icon,
                iconColor: request.iconColor,
                borderColor: request.borderColor,
                title: request.title,
                ticketNumber: request.ticketNumber,
                description: request.description,
                createdTime: request.createdTime,
                assignedTo: request.assignedTo,
                status: request.status,
                statusColor: request.statusColor,
                statusTextColor: request.statusTextColor,
                hasUpdate: request.hasUpdate,
                updateText: request.updateText,
                updateQuote: request.updateQuote,
              ),
            )),
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
