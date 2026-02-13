import 'package:flutter/material.dart';
import '../../shared/widgets/hero_header.dart';
import '../../shared/widgets/section_header.dart';
import '../../shared/widgets/icon_container.dart';
import '../../shared/widgets/status_badge.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';

class BillsScreen extends StatefulWidget {
  const BillsScreen({super.key});

  @override
  State<BillsScreen> createState() => _BillsScreenState();
}

class _BillsScreenState extends State<BillsScreen> {
  int _selectedTab = 0; // 0 for Pending, 1 for Paid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            HeroHeader(
              icon: Icons.receipt_long,
              title: 'Billing & Payments',
              subtitle: 'Manage your bills and payment history',
            ),
            _buildOutstandingBalanceCard(),
            _buildTabNavigation(),
            Expanded(
              child: _selectedTab == 0
                  ? _buildPendingBillsContent()
                  : _buildPaidBillsContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOutstandingBalanceCard() {
    return Container(
      margin: const EdgeInsets.all(AppConstants.paddingMedium),
      padding: const EdgeInsets.all(AppConstants.paddingLarge),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppTheme.primaryBlueSecondary, AppTheme.primaryBlue],
        ),
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Outstanding Balance',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            'AED 1,430.00',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: AppConstants.spacingSmall),
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppTheme.blue200,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                ),
                child: IconButton(
                  icon: const Icon(Icons.download, color: Colors.white),
                  onPressed: () {},
                ),
              ),
            ],
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
              label: 'Pending (3)',
              isSelected: _selectedTab == 0,
              onTap: () => setState(() => _selectedTab = 0),
            ),
          ),
          const SizedBox(width: AppConstants.spacingSmall),
          Expanded(
            child: _buildTabButton(
              label: 'Paid',
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

  Widget _buildPendingBillsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBillCard(
            icon: Icons.bolt,
            iconColor: Colors.amber[700]!,
            title: 'DEWA - Electricity',
            invoiceNumber: 'Invoice #DE-2024-001234',
            amount: 'AED 450.00',
            dueDate: 'Due: Jan 22, 2025',
            statusBadge: 'Due in 5 days',
            statusColor: Colors.red[100]!,
            statusTextColor: Colors.red[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildBillCard(
            icon: Icons.water_drop,
            iconColor: AppTheme.primaryBlue,
            title: 'Water Utilities',
            invoiceNumber: 'Invoice #WU-2024-005678',
            amount: 'AED 180.00',
            dueDate: 'Due: Jan 29, 2025',
            statusBadge: 'Due in 12 days',
            statusColor: Colors.orange[100]!,
            statusTextColor: Colors.orange[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildBillCard(
            icon: Icons.business,
            iconColor: Colors.grey[700]!,
            title: 'HOA Fees - Q1 2025',
            invoiceNumber: 'Invoice #HOA-2025-Q1',
            amount: 'AED 800.00',
            dueDate: 'Due: Feb 1, 2025',
            statusBadge: 'Due in 15 days',
            statusColor: Colors.orange[100]!,
            statusTextColor: Colors.orange[800]!,
          ),
        ],
      ),
    );
  }

  Widget _buildPaidBillsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBillCard(
            icon: Icons.wifi,
            iconColor: AppTheme.primaryBlue,
            title: 'Etisalat - Internet',
            invoiceNumber: 'Invoice #ET-2024-009876',
            amount: 'AED 299.00',
            paidDate: 'Paid: Jan 10, 2025',
            statusBadge: 'Paid',
            statusColor: Colors.green[100]!,
            statusTextColor: Colors.green[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildBillCard(
            icon: Icons.local_parking,
            iconColor: Colors.grey[700]!,
            title: 'Parking - December',
            invoiceNumber: 'Invoice #PK-2024-012',
            amount: 'AED 500.00',
            paidDate: 'Paid: Dec 28, 2024',
            statusBadge: 'Paid',
            statusColor: Colors.green[100]!,
            statusTextColor: Colors.green[800]!,
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          _buildBillCard(
            icon: Icons.bolt,
            iconColor: Colors.amber[700]!,
            title: 'DEWA - Electricity',
            invoiceNumber: 'Invoice #DE-2023-012345',
            amount: 'AED 420.00',
            paidDate: 'Paid: Dec 15, 2024',
            statusBadge: 'Paid',
            statusColor: Colors.green[100]!,
            statusTextColor: Colors.green[800]!,
          ),
        ],
      ),
    );
  }

  Widget _buildBillCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String invoiceNumber,
    required String amount,
    String? dueDate,
    String? paidDate,
    required String statusBadge,
    required Color statusColor,
    required Color statusTextColor,
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
                      invoiceNumber,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppConstants.spacingSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    dueDate != null ? Icons.calendar_today : Icons.check_circle,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 4),
                  Text(
                    dueDate ?? paidDate ?? '',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              StatusBadge(
                label: statusBadge,
                backgroundColor: statusColor,
                textColor: statusTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

