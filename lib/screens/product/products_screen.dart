import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/empty_state_widget.dart';
import '../../widgets/common/product_card.dart';
import '../../models/product/product_model.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> _products = [];
  bool _isLoading = true;
  String _sortBy = 'popular';

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() {
    setState(() {
      _products = List.generate(
        12,
        (index) => ProductModel(
          id: '$index',
          name: 'منتج ${index + 1}',
          price: 1000 * (index + 1),
          marketName: 'متجر النموذج',
          marketId: '1',
          categoryId: widget.categoryId,
          isFavorite: index % 3 == 0,
        ),
      );
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: Text(widget.categoryName),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.cardColor,
        foregroundColor: AppColors.textPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterSheet();
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.sort),
            onSelected: (value) {
              setState(() {
                _sortBy = value;
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'popular', child: Text('الأكثر شعبية')),
              const PopupMenuItem(value: 'price_low', child: Text('السعر: منخفض أولاً')),
              const PopupMenuItem(value: 'price_high', child: Text('السعر: مرتفع أولاً')),
              const PopupMenuItem(value: 'rating', child: Text('الأعلى تقييم')),
            ],
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _products.isEmpty
              ? EmptyStateWidget(
                  icon: Icons.shopping_bag_outlined,
                  title: 'لا توجد منتجات',
                  subtitle: 'لم يتم العثور على منتجات في هذه الفئة',
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final product = _products[index];
                    return ProductCard(
                      product: product,
                      onTap: () {
                        // Navigate to product details
                      },
                    );
                  },
                ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.borderColor),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('إعادة تعيين'),
                  ),
                  const Text(
                    'تصفية',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildFilterSection('السعر', [
                    'أقل من 1000',
                    '1000 - 5000',
                    '5000 - 10000',
                    'أكثر من 10000',
                  ]),
                  const SizedBox(height: 20),
                  _buildFilterSection('التقييم', [
                    '4 نجوم وأكثر',
                    '3 نجوم وأكثر',
                    '2 نجوم وأكثر',
                  ]),
                  const SizedBox(height: 20),
                  _buildFilterSection('خدمات التوصيل', [
                    'توصيل مجاني',
                    'توصيل سريع',
                    'استلام من المتجر',
                  ]),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.goldColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text('عرض النتائج'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            return FilterChip(
              label: Text(option),
              selected: false,
              onSelected: (selected) {},
              selectedColor: AppColors.goldColor.withValues(alpha: 0.2),
              checkmarkColor: AppColors.goldColor,
            );
          }).toList(),
        ),
      ],
    );
  }
}
