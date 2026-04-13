/// نموذج مستند المستخدم
class UserDocument {
  final String id;
  final String userId;
  final DocumentType type;
  final String documentNumber;
  final String frontImageUrl;
  final String? backImageUrl;
  final DocumentStatus status;
  final String? rejectionReason;
  final DateTime submittedAt;
  final DateTime? reviewedAt;
  final String? reviewedBy;

  UserDocument({
    required this.id,
    required this.userId,
    required this.type,
    required this.documentNumber,
    required this.frontImageUrl,
    this.backImageUrl,
    required this.status,
    this.rejectionReason,
    required this.submittedAt,
    this.reviewedAt,
    this.reviewedBy,
  });

  factory UserDocument.fromJson(Map<String, dynamic> json) {
    return UserDocument(
      id: json['id'] ?? '',
      userId: json['user_id'] ?? '',
      type: DocumentType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => DocumentType.idCard,
      ),
      documentNumber: json['document_number'] ?? '',
      frontImageUrl: json['front_image_url'] ?? '',
      backImageUrl: json['back_image_url'],
      status: DocumentStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => DocumentStatus.pending,
      ),
      rejectionReason: json['rejection_reason'],
      submittedAt: DateTime.parse(json['submitted_at'] ?? DateTime.now().toIso8601String()),
      reviewedAt: json['reviewed_at'] != null ? DateTime.parse(json['reviewed_at']) : null,
      reviewedBy: json['reviewed_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'type': type.name,
      'document_number': documentNumber,
      'front_image_url': frontImageUrl,
      'back_image_url': backImageUrl,
      'status': status.name,
      'rejection_reason': rejectionReason,
      'submitted_at': submittedAt.toIso8601String(),
      'reviewed_at': reviewedAt?.toIso8601String(),
      'reviewed_by': reviewedBy,
    };
  }

  bool get isVerified => status == DocumentStatus.verified;
  bool get isPending => status == DocumentStatus.pending;
}

enum DocumentType {
  idCard,
  passport,
  driverLicense,
  residencePermit,
  companyRegistration,
}

enum DocumentStatus {
  pending,
  underReview,
  verified,
  rejected,
  expired,
}
