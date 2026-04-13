import 'package:flutter/material.dart';

/// شاشة إعدادات إمكانية الوصول
class AccessibilityScreen extends StatefulWidget {
  const AccessibilityScreen({super.key});
  @override
  State<AccessibilityScreen> createState() => _AccessibilityScreenState();
}

class _AccessibilityScreenState extends State<AccessibilityScreen> {
  bool _largeText = false;
  bool _highContrast = false;
  bool _screenReader = false;
  bool _reduceMotion = false;
  double _textSize = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إمكانية الوصول')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFD4AF37), Color(0xFFF4D03F)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              children: [
                Icon(Icons.accessibility_new, color: Colors.white, size: 32),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('إعدادات إمكانية الوصول', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text('خصص التطبيق حسب احتياجاتك', style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text('حجم النص', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text('أ', style: TextStyle(fontSize: 12)),
              Expanded(
                child: Slider(value: _textSize, min: 0.8, max: 1.4, divisions: 6, activeColor: const Color(0xFFD4AF37), onChanged: (value) => setState(() => _textSize = value)),
              ),
              const Text('أ', style: TextStyle(fontSize: 24)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
            child: Text('هذا نص معاينة لحجم النص المختار', style: TextStyle(fontSize: 14 * _textSize), textAlign: TextAlign.center),
          ),
          const SizedBox(height: 24),
          const Text('خيارات إضافية', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SwitchListTile(title: const Text('نص كبير'), subtitle: const Text('عرض النصوص بخط أكبر'), value: _largeText, activeColor: const Color(0xFFD4AF37), onChanged: (value) => setState(() => _largeText = value)),
          SwitchListTile(title: const Text('تباين عالي'), subtitle: const Text('تحسين وضوح الألوان'), value: _highContrast, activeColor: const Color(0xFFD4AF37), onChanged: (value) => setState(() => _highContrast = value)),
          SwitchListTile(title: const Text('قارئ الشاشة'), subtitle: const Text('تفعيل وصف صوتي للعناصر'), value: _screenReader, activeColor: const Color(0xFFD4AF37), onChanged: (value) => setState(() => _screenReader = value)),
          SwitchListTile(title: const Text('تقليل الحركة'), subtitle: const Text('تقليل الرسوم المتحركة'), value: _reduceMotion, activeColor: const Color(0xFFD4AF37), onChanged: (value) => setState(() => _reduceMotion = value)),
          const SizedBox(height: 24),
          OutlinedButton(
            onPressed: _resetSettings,
            style: OutlinedButton.styleFrom(side: const BorderSide(color: Color(0xFFD4AF37)), minimumSize: const Size(double.infinity, 48)),
            child: const Text('إعادة تعيين للإعدادات الافتراضية'),
          ),
        ],
      ),
    );
  }

  void _resetSettings() {
    setState(() {
      _largeText = false;
      _highContrast = false;
      _screenReader = false;
      _reduceMotion = false;
      _textSize = 1.0;
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('تمت إعادة تعيين الإعدادات')));
  }
}
