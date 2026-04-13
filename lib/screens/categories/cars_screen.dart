import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة قسم السيارات
class CarsScreen extends StatelessWidget {
  const CarsScreen({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> _cars = [
    {
      'title': 'Toyota Camry 2023',
      'location': 'صنعاء',
      'price': '35,000,000',
      'year': 2023,
      'km': '0',
      'fuel': 'بنزين',
      'type': 'سيدان',
    },
    {
      'title': 'Hyundai Tucson 2022',
      'location': 'عدن',
      'price': '42,000,000',
      'year': 2022,
      'km': '15,000',
      'fuel': 'بنزين',
      'type': 'دفع رباعي',
    },
    {
      'title': 'Kia Sportage 2021',
      'location': 'تعز',
      'price': '38,000,000',
      'year': 2021,
      'km': '30,000',
      'fuel': 'ديزل',
      'type': 'دفع رباعي',
    },
    {
      'title': 'Ford Ranger 2023',
      'location': 'الحديدة',
      'price': '55,000,000',
      'year': 2023,
      'km': '5,000',
      'fuel': 'ديزل',
      'type': 'بيك أب',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'السيارات',
        showBackButton: true,
      ),
      body: Column(
        children: [
          // فلاتر
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildFilterChip('الكل', true),
                _buildFilterChip('سيدان', false),
                _buildFilterChip('دفع رباعي', false),
                _buildFilterChip('بيك أب', false),
                _buildFilterChip('هاتشباك', false),
              ],
            ),
          ),
          // السيارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cars.length,
              itemBuilder: (context, index) {
                final car = _cars[index];
                return _buildCarCard(car)
                    .animate()
                    .fadeIn(delay: Duration(milliseconds: 100 * index));
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String name, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Material(
        color: isSelected ? AppColors.goldColor : Colors.white,
        borderRadius: BorderRadius.circular(25),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              name,
              style: TextStyle(
                color: isSelected ? Colors.black : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarCard(Map<String, dynamic> car) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // صورة السيارة
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppColors.goldColor.withOpacity(0.2),
              borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
            ),
            child: Center(
              child: Icon(Icons.directions_car, size: 60, color: AppColors.goldColor),
            ),
          ),
          // معلومات السيارة
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: AppColors.textSecondary),
                      const SizedBox(width: 4),
                      Text(
                        car['location'],
                        style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildCarInfo(Icons.calendar_today, '${car['year']}'),
                      const SizedBox(width: 12),
                      _buildCarInfo(Icons.speed, '${car['km']} كم'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      _buildCarInfo(Icons.local_gas_station, car['fuel']),
                      const SizedBox(width: 12),
                      _buildCarInfo(Icons.category, car['type']),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${car['price']} ر.ي',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: AppColors.textSecondary),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: 12)),
      ],
    );
  }
}
