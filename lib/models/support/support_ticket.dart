enum SupportTicketStatus {
  open,
  pending,
  resolved,
  closed,
}

enum SupportTicketPriority {
  low,
  medium,
  high,
  urgent,
}

enum SupportTicketCategory {
  general,
  technical,
  billing,
  account,
  order,
  wallet,
}

class SupportTicket {
  final String id;
  final String userId;
  final String subject;
  final String description;
  final SupportTicketCategory category;
  final SupportTicketPriority priority;
  final SupportTicketStatus status;
  final String? assignedTo;
  final List<SupportMessage> messages;
  final List<String>? attachments;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? resolvedAt;

  SupportTicket({
    required this.id,
    required this.userId,
    required this.subject,
    required this.description,
    this.category = SupportTicketCategory.general,
    this.priority = SupportTicketPriority.medium,
    this.status = SupportTicketStatus.open,
    this.assignedTo,
    this.messages = const [],
    this.attachments,
    required this.createdAt,
    this.updatedAt,
    this.resolvedAt,
  });

  factory SupportTicket.fromJson(Map<String, dynamic> json) {
    return SupportTicket(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      subject: json['subject'] ?? '',
      description: json['description'] ?? '',
      category: SupportTicketCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => SupportTicketCategory.general,
      ),
      priority: SupportTicketPriority.values.firstWhere(
        (e) => e.name == json['priority'],
        orElse: () => SupportTicketPriority.medium,
      ),
      status: SupportTicketStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => SupportTicketStatus.open,
      ),
      assignedTo: json['assigned_to'],
      messages: (json['messages'] as List? ?? [])
          .map((e) => SupportMessage.fromJson(e))
          .toList(),
      attachments: json['attachments'] != null
          ? List<String>.from(json['attachments'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      resolvedAt: json['resolved_at'] != null
          ? DateTime.parse(json['resolved_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'subject': subject,
      'description': description,
      'category': category.name,
      'priority': priority.name,
      'status': status.name,
      'assigned_to': assignedTo,
      'messages': messages.map((e) => e.toJson()).toList(),
      'attachments': attachments,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'resolved_at': resolvedAt?.toIso8601String(),
    };
  }
}

class SupportMessage {
  final String id;
  final String ticketId;
  final String senderId;
  final String senderName;
  final bool isFromStaff;
  final String message;
  final List<String>? attachments;
  final DateTime createdAt;

  SupportMessage({
    required this.id,
    required this.ticketId,
    required this.senderId,
    required this.senderName,
    this.isFromStaff = false,
    required this.message,
    this.attachments,
    required this.createdAt,
  });

  factory SupportMessage.fromJson(Map<String, dynamic> json) {
    return SupportMessage(
      id: json['id'] ?? '',
      ticketId: json['ticket_id'] ?? '',
      senderId: json['sender_id'] ?? '',
      senderName: json['sender_name'] ?? '',
      isFromStaff: json['is_from_staff'] ?? false,
      message: json['message'] ?? '',
      attachments: json['attachments'] != null
          ? List<String>.from(json['attachments'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ticket_id': ticketId,
      'sender_id': senderId,
      'sender_name': senderName,
      'is_from_staff': isFromStaff,
      'message': message,
      'attachments': attachments,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
