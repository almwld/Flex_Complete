import 'package:flutter/material.dart';

/// ويدجيت بطاقة البائع
class SellerCard extends StatelessWidget {
  final String id;
  final String name;
  final String? logo;
  final String? coverImage;
  final double rating;
  final int reviewCount;
  final int productCount;
  final bool isVerified;
  final String? location;
  final VoidCallback onTap;

  const SellerCard({
    super.key,
    required this.id,
    required this.name,
    this.logo,
    this.coverImage,
    required this.rating,
    required this.reviewCount,
    required this.productCount,
    this.isVerified = false,
    this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الغلاف
            Container(
              height: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                image: coverImage != null
                    ? DecorationImage(
                        image: NetworkImage(coverImage!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // الشعار والاسم
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Theme.of(context).primaryColor,
                        backgroundImage:
                            logo != null ? NetworkImage(logo!) : null,
                        child: logo == null
                            ? Text(
                                name[0],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (isVerified) ...[
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.verified,
                                    size: 16,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ],
                              ],
                            ),
                            if (location != null)
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: Colors.grey[500],
                                  ),
                                  const SizedBox(width: 2),
                                  Expanded(
                                    child: Text(
                                      location!,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // الإحصائيات
                  Row(
                    children: [
                      _StatItem(
                        icon: Icons.star,
                        value: rating.toStringAsFixed(1),
                        label: 'تقييم',
                        color: Colors.amber[700]!,
                      ),
                      const SizedBox(width: 16),
                      _StatItem(
                        icon: Icons.comment,
                        value: reviewCount.toString(),
                        label: 'تقييم',
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 16),
                      _StatItem(
                        icon: Icons.inventory_2,
                        value: productCount.toString(),
                        label: 'منتج',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

/// ويدجيت قائمة البائعين
class SellerList extends StatelessWidget {
  final List<Map<String, dynamic>> sellers;
  final Function(Map<String, dynamic>) onSellerTap;

  const SellerList({
    super.key,
    required this.sellers,
    required this.onSellerTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: sellers.length,
      itemBuilder: (context, index) {
        final seller = sellers[index];
        return SellerCard(
          id: seller['id'],
          name: seller['name'],
          logo: seller['logo'],
          rating: seller['rating'] ?? 0,
          reviewCount: seller['reviewCount'] ?? 0,
          productCount: seller['productCount'] ?? 0,
          isVerified: seller['isVerified'] ?? false,
          location: seller['location'],
          onTap: () => onSellerTap(seller),
        );
      },
    );
  }
}
