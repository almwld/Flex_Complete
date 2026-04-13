class BlogPost {
  final String id;
  final String title;
  final String content;
  final String? excerpt;
  final String? imageUrl;
  final List<String> tags;
  final String authorId;
  final String authorName;
  final String? authorAvatar;
  final String category;
  final int views;
  final int likes;
  final int comments;
  final bool isFeatured;
  final bool isPublished;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  BlogPost({
    required this.id,
    required this.title,
    required this.content,
    this.excerpt,
    this.imageUrl,
    this.tags = const [],
    required this.authorId,
    required this.authorName,
    this.authorAvatar,
    required this.category,
    this.views = 0,
    this.likes = 0,
    this.comments = 0,
    this.isFeatured = false,
    this.isPublished = true,
    required this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      excerpt: json['excerpt'],
      imageUrl: json['image_url'],
      tags: List<String>.from(json['tags'] ?? []),
      authorId: json['author_id'] ?? '',
      authorName: json['author_name'] ?? '',
      authorAvatar: json['author_avatar'],
      category: json['category'] ?? '',
      views: json['views'] ?? 0,
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      isFeatured: json['is_featured'] ?? false,
      isPublished: json['is_published'] ?? true,
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
      'content': content,
      'excerpt': excerpt,
      'image_url': imageUrl,
      'tags': tags,
      'author_id': authorId,
      'author_name': authorName,
      'author_avatar': authorAvatar,
      'category': category,
      'views': views,
      'likes': likes,
      'comments': comments,
      'is_featured': isFeatured,
      'is_published': isPublished,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'published_at': publishedAt?.toIso8601String(),
    };
  }
}
