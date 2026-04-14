import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../widgets/common/search_bar_widget.dart';
import '../../models/product/product_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<ProductModel> _searchResults = [];
  bool _isLoading = false;

  void _performSearch() {
    final query = _searchController.text.trim();
    if (query.isEmpty) return;
    
    setState(() {
      _isLoading = true;
    });
    
    // محاكاة البحث
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _searchResults = [
          ProductModel(
            id: '1',
            title: 'منتج 1',
            price: 10000,
            images: [],
            category: 'category',
          ),
          ProductModel(
            id: '2',
            title: 'منتج 2',
            price: 20000,
            images: [],
            category: 'category',
          ),
        ];
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.getBackgroundColor(context),
      appBar: AppBar(
        title: const Text('بحث'),
        backgroundColor: AppColors.getSurfaceColor(context),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SearchBarWidget(
              controller: _searchController,
              onSearch: _performSearch,
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                    ? const Center(child: Text('لا توجد نتائج'))
                    : ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final product = _searchResults[index];
                          return ListTile(
                            title: Text(product.title),
                            subtitle: Text('${product.price} ر.ي'),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
