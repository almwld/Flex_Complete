enum CourseLevel {
  beginner,
  intermediate,
  advanced,
  expert,
}

enum CourseStatus {
  draft,
  published,
  archived,
}

class CourseModel {
  final String id;
  final String title;
  final String description;
  final String? excerpt;
  final String? imageUrl;
  final String? videoIntro;
  final String instructorId;
  final String instructorName;
  final String? instructorAvatar;
  final String category;
  final CourseLevel level;
  final double price;
  final double? originalPrice;
  final bool isFree;
  final int durationMinutes;
  final int lessonsCount;
  final int studentsCount;
  final double rating;
  final int reviewCount;
  final CourseStatus status;
  final List<String> requirements;
  final List<String> outcomes;
  final List<CourseLesson> lessons;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    this.excerpt,
    this.imageUrl,
    this.videoIntro,
    required this.instructorId,
    required this.instructorName,
    this.instructorAvatar,
    required this.category,
    this.level = CourseLevel.beginner,
    this.price = 0,
    this.originalPrice,
    this.isFree = false,
    this.durationMinutes = 0,
    this.lessonsCount = 0,
    this.studentsCount = 0,
    this.rating = 0,
    this.reviewCount = 0,
    this.status = CourseStatus.draft,
    this.requirements = const [],
    this.outcomes = const [],
    this.lessons = const [],
    required this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      excerpt: json['excerpt'],
      imageUrl: json['image_url'],
      videoIntro: json['video_intro'],
      instructorId: json['instructor_id'] ?? '',
      instructorName: json['instructor_name'] ?? '',
      instructorAvatar: json['instructor_avatar'],
      category: json['category'] ?? '',
      level: CourseLevel.values.firstWhere(
        (e) => e.name == json['level'],
        orElse: () => CourseLevel.beginner,
      ),
      price: (json['price'] ?? 0).toDouble(),
      originalPrice: json['original_price']?.toDouble(),
      isFree: json['is_free'] ?? false,
      durationMinutes: json['duration_minutes'] ?? 0,
      lessonsCount: json['lessons_count'] ?? 0,
      studentsCount: json['students_count'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      reviewCount: json['review_count'] ?? 0,
      status: CourseStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CourseStatus.draft,
      ),
      requirements: List<String>.from(json['requirements'] ?? []),
      outcomes: List<String>.from(json['outcomes'] ?? []),
      lessons: (json['lessons'] as List? ?? [])
          .map((e) => CourseLesson.fromJson(e))
          .toList(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      publishedAt: json['published_at'] != null
          ? DateTime.parse(json['published_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'excerpt': excerpt,
      'image_url': imageUrl,
      'video_intro': videoIntro,
      'instructor_id': instructorId,
      'instructor_name': instructorName,
      'instructor_avatar': instructorAvatar,
      'category': category,
      'level': level.name,
      'price': price,
      'original_price': originalPrice,
      'is_free': isFree,
      'duration_minutes': durationMinutes,
      'lessons_count': lessonsCount,
      'students_count': studentsCount,
      'rating': rating,
      'review_count': reviewCount,
      'status': status.name,
      'requirements': requirements,
      'outcomes': outcomes,
      'lessons': lessons.map((e) => e.toJson()).toList(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
    };
  }

  String get levelName {
    switch (level) {
      case CourseLevel.beginner:
        return 'مبتدئ';
      case CourseLevel.intermediate:
        return 'متوسط';
      case CourseLevel.advanced:
        return 'متقدم';
      case CourseLevel.expert:
        return 'خبير';
    }
  }

  String get formattedDuration {
    if (durationMinutes < 60) {
      return '$durationMinutes دقيقة';
    }
    final hours = durationMinutes ~/ 60;
    final minutes = durationMinutes % 60;
    if (minutes == 0) {
      return '$hours ساعة';
    }
    return '$hours ساعة و $minutes دقيقة';
  }
}

class CourseLesson {
  final String id;
  final String courseId;
  final String title;
  final String? description;
  final String? videoUrl;
  final int durationMinutes;
  final int order;
  final bool isFree;
  final bool isCompleted;

  CourseLesson({
    required this.id,
    required this.courseId,
    required this.title,
    this.description,
    this.videoUrl,
    this.durationMinutes = 0,
    this.order = 0,
    this.isFree = false,
    this.isCompleted = false,
  });

  factory CourseLesson.fromJson(Map<String, dynamic> json) {
    return CourseLesson(
      id: json['id'] ?? '',
      courseId: json['course_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'],
      videoUrl: json['video_url'],
      durationMinutes: json['duration_minutes'] ?? 0,
      order: json['order'] ?? 0,
      isFree: json['is_free'] ?? false,
      isCompleted: json['is_completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'course_id': courseId,
      'title': title,
      'description': description,
      'video_url': videoUrl,
      'duration_minutes': durationMinutes,
      'order': order,
      'is_free': isFree,
      'is_completed': isCompleted,
    };
  }
}
