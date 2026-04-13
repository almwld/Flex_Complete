import 'package:flutter/material.dart';

/// شاشة إنشاء إيجار جديد
class CreateRentalPropertyScreen extends StatefulWidget {
  const CreateRentalPropertyScreen({super.key});

  @override
  State<CreateRentalPropertyScreen> createState() => _CreateRentalPropertyScreenState();
}

class _CreateRentalPropertyScreenState extends State<CreateRentalPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();

  String _propertyType = 'شقة';
  int _bedrooms = 2;
  int _bathrooms = 1;
  int _maxGuests = 4;
  final List<String> _selectedImages = [];
  final List<String> _selectedAmenities = [];

  final List<String> _amenities = [
    'واي فاي',
    'تكييف',
    'موقف سيارات',
    'مطبخ',
    'تلفزيون',
    'أمن',
    'مسبح',
    'صالة رياضية',
    'غسالة',
    'مكواة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة عقار للإيجار'),
        actions: [
          TextButton(
            onPressed: _submitProperty,
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
              // صور العقار
              const Text(
                'صور العقار',
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
                                onTap: () => setState(() => _selectedImages.remove(image)),
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
              // نوع العقار
              DropdownButtonFormField<String>(
                value: _propertyType,
                decoration: const InputDecoration(
                  labelText: 'نوع العقار',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(value: 'شقة', child: Text('شقة')),
                  DropdownMenuItem(value: 'فيلا', child: Text('فيلا')),
                  DropdownMenuItem(value: 'منزل', child: Text('منزل')),
                  DropdownMenuItem(value: 'استوديو', child: Text('استوديو')),
                  DropdownMenuItem(value: 'غرفة', child: Text('غرفة')),
                ],
                onChanged: (value) => setState(() => _propertyType = value!),
              ),
              const SizedBox(height: 16),
              // عنوان العقار
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'عنوان العقار *',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value?.isEmpty == true ? 'مطلوب' : null,
              ),
              const SizedBox(height: 16),
              // العنوان
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'العنوان التفصيلي *',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.location_on),
                ),
                validator: (value) => value?.isEmpty == true ? 'مطلوب' : null,
              ),
              const SizedBox(height: 16),
              // عدد الغرف
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('غرف النوم'),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _bedrooms > 1 ? () => setState(() => _bedrooms--) : null,
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('$_bedrooms', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              onPressed: () => setState(() => _bedrooms++),
                              icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('الحمامات'),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _bathrooms > 1 ? () => setState(() => _bathrooms--) : null,
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('$_bathrooms', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              onPressed: () => setState(() => _bathrooms++),
                              icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('الضيوف'),
                        Row(
                          children: [
                            IconButton(
                              onPressed: _maxGuests > 1 ? () => setState(() => _maxGuests--) : null,
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text('$_maxGuests', style: const TextStyle(fontSize: 18)),
                            IconButton(
                              onPressed: () => setState(() => _maxGuests++),
                              icon: const Icon(Icons.add_circle_outline, color: Color(0xFFD4AF37)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // السعر
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'السعر الشهري *',
                  border: OutlineInputBorder(),
                  prefixText: 'ر.ي ',
                ),
                validator: (value) => value?.isEmpty == true ? 'مطلوب' : null,
              ),
              const SizedBox(height: 16),
              // رقم الهاتف
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'رقم الهاتف للتواصل',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
              const SizedBox(height: 16),
              // الوصف
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(
                  labelText: 'وصف العقار *',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                validator: (value) => value?.isEmpty == true ? 'مطلوب' : null,
              ),
              const SizedBox(height: 24),
              // وسائل الراحة
              const Text(
                'وسائل الراحة',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _amenities.map((amenity) {
                  final isSelected = _selectedAmenities.contains(amenity);
                  return FilterChip(
                    label: Text(amenity),
                    selected: isSelected,
                    selectedColor: const Color(0xFFD4AF37).withOpacity(0.3),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedAmenities.add(amenity);
                        } else {
                          _selectedAmenities.remove(amenity);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 32),
              // زر الإنشاء
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitProperty,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD4AF37),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'نشر العقار',
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

  void _submitProperty() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('تم نشر العقار بنجاح!'),
          backgroundColor: Color(0xFFD4AF37),
        ),
      );
      Navigator.pop(context);
    }
  }
}
