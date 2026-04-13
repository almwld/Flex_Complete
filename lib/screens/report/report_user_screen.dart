import 'package:flutter/material.dart';

/// شاشة الإبلاغ عن مستخدم
class ReportUserScreen extends StatefulWidget {
  final String? userId;
  final String? userName;

  const ReportUserScreen({super.key, this.userId, this.userName});

  @override
  State<ReportUserScreen> createState() => _ReportUserScreenState();
}

class _ReportUserScreenState extends State<ReportUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _descriptionController = TextEditingController();
  String? _selectedReason;

  final List<String> _userReasons = [
    'سلوك غير لائق', 'تحرش أو إزعاج', 'احتيال أو نصب',
    'انتهاك شروط الاستخدام', 'ملف شخصي مزيف', 'أخرى',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإبلاغ عن مستخدم')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.userName != null) ...[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFD4AF37),
                        child: Text(widget.userName![0], style: const TextStyle(color: Colors.white, fontSize: 24)),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('المستخدم المبلغ عنه', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            Text(widget.userName!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
              const Text('سبب الإبلاغ *', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              ..._userReasons.map((reason) => RadioListTile<String>(
                title: Text(reason),
                value: reason,
                groupValue: _selectedReason,
                activeColor: const Color(0xFFD4AF37),
                onChanged: (value) => setState(() => _selectedReason = value),
              )),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(labelText: 'وصف المشكلة *', border: OutlineInputBorder(), alignLabelWithHint: true),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'يرجى إدخال وصف المشكلة';
                  if (value.length < 20) return 'الوصف قصير جداً';
                  return null;
                },
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFD4AF37), padding: const EdgeInsets.symmetric(vertical: 16)),
                  child: const Text('إرسال الإبلاغ', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitReport() {
    if (_selectedReason == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('يرجى اختيار سبب الإبلاغ')));
      return;
    }
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('تم إرسال الإبلاغ بنجاح!'), backgroundColor: Color(0xFFD4AF37)),
      );
      Navigator.pop(context);
    }
  }
}
