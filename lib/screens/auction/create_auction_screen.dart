import 'package:flutter/material.dart';

/// شاشة إنشاء مزاد جديد
class CreateAuctionFormScreen extends StatefulWidget {
  const CreateAuctionFormScreen({super.key});

  @override
  State<CreateAuctionFormScreen> createState() => _CreateAuctionFormScreenState();
}

class _CreateAuctionFormScreenState extends State<CreateAuctionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _startingPriceController = TextEditingController();
  final _minBidIncrementController = TextEditingController();
  int _durationDays = 3;
  String _category = 'إلكترونيات';
  final List<String> _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إنشاء مزاد جديد'),
        actions: [
          TextButton(
            onPressed: _submitAuction,
            child: const Text(
              'نشر',
              style: TextStyle(
                color: Color(0xFFD4AF37),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // صور المنتج
              const Text(
                'صور المنتج',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: _addImage,
                      child: Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 32, color: Colors.grey[600]),
                            const SizedBox(height: 4),
                            Text('إضافة', style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                    ),
                    ..._selectedImages.map((image) {
                      return Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Stack(
                          children: [
                            const Center(child: Icon(Icons.image, size: 40)),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() => _selectedImages.remove(image));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.close, size: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // عنوان المنتج
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'عنوان المنتج *',
                  hintText: 'مثال: آيفون 14 برو ماكس',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال عنوان المنتج';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // الفئة
              DropdownButtonFormField<String>(
                value: _category,
                decoration: const InputDecoration(
                  labelText: 'الفئة *',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'إلكترونيات', child: Text('إلكترونيات')),
                  DropdownMenuItem(value: 'سيارات', child: Text('سيارات')),
                  DropdownMenuItem(value: 'عقارات', child: Text('عقارات')),
                  DropdownMenuItem(value: 'أثاث', child: Text('أثاث')),
                  DropdownMenuItem(value: 'ملابس', child: Text('ملابس')),
                  DropdownMenuItem(value: 'أخرى', child: Text('أخرى')),
                ],
                onChanged: (value) {
                  setState(() => _category = value!);
                },
              ),
              const SizedBox(height: 16),
              // وصف المنتج
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'وصف المنتج *',
                  hintText: 'اكتب وصفاً تفصيلياً للمنتج...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال وصف المنتج';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // السعر الابتدائي
              TextFormField(
                controller: _startingPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'السعر الابتدائي *',
                  hintText: 'أدخل السعر الابتدائي',
                  border: OutlineInputBorder(),
                  suffixText: 'ر.ي',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'يرجى إدخال السعر الابتدائي';
                  }
                  if (double.tryParse(value) == null) {
                    return 'يرجى إدخال مبلغ صحيح';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              // الحد الأدنى للزيادة
              TextFormField(
                controller: _minBidIncrementController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'الحد الأدنى للزيادة',
                  hintText: 'أدخل الحد الأدنى للزيادة',
                  border: OutlineInputBorder(),
                  suffixText: 'ر.ي',
                ),
              ),
              const SizedBox(height: 16),
              // مدة المزاد
              const Text(
                'مدة المزاد',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [1, 3, 5, 7].map((days) {
                  return ChoiceChip(
                    label: Text('$days ${days == 1 ? 'يوم' : 'أيام'}'),
                    selected: _durationDays == days,
                    selectedColor: const Color(0xFFD4AF37),
                    onSelected: (selected) {
                      if (selected) setState(() => _durationDays = days);
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              // زر الإنشاء
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitAuction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'إنشاء المزاد',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addImage() {
    setState(() {
      _selectedImages.add('image_${_selectedImages.length + 1}');
    });
  }

  void _submitAuction() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم إنشاء المزاد بنجاح!'),
          backgroundColor: Color(0xFFD4AF37),
        ),
      );
      Navigator.pop(context);
    }
  }
}
