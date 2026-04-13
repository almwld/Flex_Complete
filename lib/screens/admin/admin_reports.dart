import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/custom_app_bar.dart';

/// صفحة التقارير
class AdminReports extends StatelessWidget {
  const AdminReports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? AppColors.backgroundDark
          : AppColors.backgroundGrey,
      appBar: CustomAppBar(
        title: 'التقارير',
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // اختيار الفترة
            Row(
              children: [
                Expanded(child: _buildPeriodButton('اليوم', true)),
                const SizedBox(width: 8),
                Expanded(child: _buildPeriodButton('الأسبوع', false)),
                const SizedBox(width: 8),
                Expanded(child: _buildPeriodButton('الشهر', false)),
              ],
            ),
            const SizedBox(height: 24),

            // تقرير المبيعات
            const Text(
              'تقرير المبيعات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: BarChart(
                BarChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    _buildBarGroup(0, 300),
                    _buildBarGroup(1, 500),
                    _buildBarGroup(2, 400),
                    _buildBarGroup(3, 600),
                    _buildBarGroup(4, 550),
                    _buildBarGroup(5, 700),
                    _buildBarGroup(6, 650),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // توزيع المنتجات
            const Text(
              'توزيع المبيعات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: [
                          PieChartSectionData(
                            value: 40,
                            title: '40%',
                            color: AppColors.goldColor,
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 30,
                            title: '30%',
                            color: AppColors.info,
                            radius: 50,
                          ),
                          PieChartSectionData(
                            value: 30,
                            title: '30%',
                            color: AppColors.success,
                            radius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLegendItem('إلكترونيات', AppColors.goldColor),
                      const SizedBox(height: 8),
                      _buildLegendItem('ملابس', AppColors.info),
                      const SizedBox(height: 8),
                      _buildLegendItem('أخرى', AppColors.success),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // تقرير المستخدمين
            const Text(
              'تقرير المستخدمين',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildReportCard('مستخدمين جدد', '234', Icons.person_add, AppColors.info),
            _buildReportCard('مشتركين نشطين', '1,234', Icons.people, AppColors.success),
            _buildReportCard('مستخدمين غير نشطين', '567', Icons.person_off, AppColors.error),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodButton(String label, bool isSelected) {
    return Material(
      color: isSelected ? AppColors.goldColor : Colors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : AppColors.textSecondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData _buildBarGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: AppColors.goldColor,
          width: 20,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildReportCard(String title, String value, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
