import 'package:flutter/material.dart';

/// ويدجيت فلتر المنتجات
class ProductFilter extends StatefulWidget {
  final List<String> categories;
  final List<Map<String, dynamic>> brands;
  final double minPrice;
  final double maxPrice;
  final List<String> selectedCategories;
  final List<String> selectedBrands;
  final double priceRangeMin;
  final double priceRangeMax;
  final bool inStockOnly;
  final bool onSaleOnly;
  final Function(Map<String, dynamic>) onApply;
  final VoidCallback onReset;

  const ProductFilter({
    super.key,
    required this.categories,
    required this.brands,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedCategories,
    required this.selectedBrands,
    required this.priceRangeMin,
    required this.priceRangeMax,
    required this.inStockOnly,
    required this.onSaleOnly,
    required this.onApply,
    required this.onReset,
  });

  @override
  State<ProductFilter> createState() => _ProductFilterState();
}

class _ProductFilterState extends State<ProductFilter> {
  late RangeValues _priceRange;
  late List<String> _selectedCategories;
  late List<String> _selectedBrands;
  late bool _inStockOnly;
  late bool _onSaleOnly;

  @override
  void initState() {
    super.initState();
    _priceRange = RangeValues(widget.priceRangeMin, widget.priceRangeMax);
    _selectedCategories = List.from(widget.selectedCategories);
    _selectedBrands = List.from(widget.selectedBrands);
    _inStockOnly = widget.inStockOnly;
    _onSaleOnly = widget.onSaleOnly;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) => StatefulBuilder(
        builder: (context, setModalState) => SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'فلتر المنتجات',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // الفئات
              const Text(
                'الفئات',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.categories.map((category) {
                  final isSelected = _selectedCategories.contains(category);
                  return FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setModalState(() {
                        if (selected) {
                          _selectedCategories.add(category);
                        } else {
                          _selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // الماركات
              const Text(
                'الماركات',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: widget.brands.map((brand) {
                  final isSelected = _selectedBrands.contains(brand['name']);
                  return FilterChip(
                    avatar: brand['logo'] != null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(brand['logo']),
                            radius: 10,
                          )
                        : null,
                    label: Text(brand['name']),
                    selected: isSelected,
                    onSelected: (selected) {
                      setModalState(() {
                        if (selected) {
                          _selectedBrands.add(brand['name']);
                        } else {
                          _selectedBrands.remove(brand['name']);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // نطاق السعر
              const Text(
                'نطاق السعر',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${_priceRange.start.toInt()} ر.ي'),
                  Text('${_priceRange.end.toInt()} ر.ي'),
                ],
              ),
              RangeSlider(
                values: _priceRange,
                min: widget.minPrice,
                max: widget.maxPrice,
                divisions: 100,
                onChanged: (values) {
                  setModalState(() {
                    _priceRange = values;
                  });
                },
              ),
              const SizedBox(height: 24),

              // خيارات إضافية
              const Text(
                'خيارات إضافية',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text('متوفر فقط'),
                value: _inStockOnly,
                onChanged: (value) {
                  setModalState(() {
                    _inStockOnly = value;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
              SwitchListTile(
                title: const Text('عروض فقط'),
                value: _onSaleOnly,
                onChanged: (value) {
                  setModalState(() {
                    _onSaleOnly = value;
                  });
                },
                contentPadding: EdgeInsets.zero,
              ),
              const SizedBox(height: 40),

              // أزرار
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        widget.onReset();
                        Navigator.pop(context);
                      },
                      child: const Text('إعادة تعيين'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        widget.onApply({
                          'categories': _selectedCategories,
                          'brands': _selectedBrands,
                          'priceMin': _priceRange.start,
                          'priceMax': _priceRange.end,
                          'inStockOnly': _inStockOnly,
                          'onSaleOnly': _onSaleOnly,
                        });
                        Navigator.pop(context);
                      },
                      child: const Text('تطبيق'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
