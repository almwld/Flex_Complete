import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/product_card.dart';
import '../../widgets/common/empty_state_widget.dart';
import '../../models/product/product_model.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<ProductModel> _favorites = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  void _loadFavorites() {
    setState(() {
      _favorites = [
        ProductModel(
          id: '1',
          name: 'برجر دجاج كبير مع بطاطس',
          price: 3500,
          oldPrice: 4500,
          marketName: 'مطعم الأصالة',
          marketId: '1',
          categoryId: '1',
          isFavorite: true,
          discount: 22,
        ),
        ProductModel(
          id: '2',
          name: 'بيتزا مارغريتا كبير',
          price: 5000,
          marketName: 'بيتزا هت',
          marketId: '2',
          categoryId: '1',
          isFavorite: true,
        ),
        ProductModel(
          id: '3',
          name: 'شاورما دجاج ملفوفة',
          price: 2000,
          marketName: 'شاورما هاوس',
          marketId: '3',
          categoryId: '1',
          isFavorite: true,
        ),
      ];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        title: const Text('المفضلة'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.cardColor,
        foregroundColor: AppColors.textPrimary,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _favorites.isEmpty
              ? EmptyStateWidget(
                  icon: Icons.favorite_border,
                  title: 'لا توجد منتجات مفضلة',
                  subtitle: 'أضف منتجاتك المفضلة من المتاجر',
                  buttonText: 'تصفح المتاجر',
                  onButtonPressed: () {},
                )
              : GridView.builder(
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: _favorites.length,
                  itemBuilder: (context, index) {
                    final product = _favorites[index];
                    return Stack(
                      children: [
                        ProductCard(
                          product: product,
                          onTap: () {},
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: GestureDetector(
                            onTap: () {
                              _removeFromFavorites(product.id);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.1),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }

  void _removeFromFavorites(String productId) {
    setState(() {
      _favorites.removeWhere((p) => p.id == productId);
    });
  }
}
