enum BillStatus { pending, paid }

class Bill {
  final String id;
  final String title;
  final String invoiceNumber;
  final double amount;
  final BillStatus status;
  final DateTime? dueDate;
  final DateTime? paidDate;
  final String? daysUntilDue;
  final String iconName;

  const Bill({
    required this.id,
    required this.title,
    required this.invoiceNumber,
    required this.amount,
    required this.status,
    this.dueDate,
    this.paidDate,
    this.daysUntilDue,
    required this.iconName,
  });
}

