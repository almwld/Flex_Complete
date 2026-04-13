import 'package:flutter/material.dart';

/// شاشة الطلبات
class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _filterStatus = 'all';

  final List<String> _statuses = [
    'الكل',
    'قيد الانتظار',
    'قيد التجهيز',
    'تم الشحن',
    'تم التوصيل',
    'ملغي',
  ];

  final List<Map<String, dynamic>> _orders = [
    {
      'id': 'ORD-123456',
      'status': 'delivered',
      'statusText': 'تم التوصيل',
      'statusColor': Colors.green,
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'total': 345000,
      'items': 3,
      'products': [
        {'name': 'سماعة بلوتوث', 'qty': 2},
        {'name': 'كابل USB', 'qty': 1},
      ],
    },
    {
      'id': 'ORD-123455',
      'status': 'shipped',
      'statusText': 'تم الشحن',
      'statusColor': Colors.blue,
      'date': DateTime.now().subtract(const Duration(days: 2)),
      'total': 180000,
      'items': 1,
      'products': [
        {'name': 'شاحن سريع', 'qty': 1},
      ],
    },
    {
      'id': 'ORD-123454',
      'status': 'processing',
      'statusText': 'قيد التجهيز',
      'statusColor': Colors.orange,
      'date': DateTime.now().subtract(const Duration(days: 1)),
      'total': 520000,
      'items': 4,
      'products': [
        {'name': 'لابتوب', 'qty': 1},
        {'name': 'ماوس', 'qty': 1},
        {'name': 'كيبورد', 'qty': 1},
        {'name': 'حقيبة', 'qty': 1},
      ],
    },
    {
      'id': 'ORD-123453',
      'status': 'pending',
      'statusText': 'قيد الانتظار',
      'statusColor': Colors.amber,
      'date': DateTime.now(),
      'total': 75000,
      'items': 2,
      'products': [
        {'name': 'سماعة أذن', 'qty': 2},
      ],
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _statuses.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Map<String, dynamic>> get _filteredOrders {
    if (_filterStatus == 'all') return _orders;
    return _orders
        .where((order) => order['status'] == _filterStatus)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('طلباتي'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _statuses.map((status) {
                final isSelected = (_filterStatus == 'all' && status == 'الكل') ||
                    _filterStatus == status;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: FilterChip(
                    label: Text(status),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        _filterStatus = status == 'الكل'
                            ? 'all'
                            : status == 'قيد الانتظار'
                                ? 'pending'
                                : status == 'قيد التجهيز'
                                    ? 'processing'
                                    : status == 'تم الشحن'
                                        ? 'shipped'
                                        : status == 'تم التوصيل'
                                            ? 'delivered'
                                            : 'cancelled';
                      });
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
      body: _filteredOrders.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _filteredOrders.length,
              itemBuilder: (context, index) {
                final order = _filteredOrders[index];
                return _OrderCard(
                  order: order,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/order-details',
                      arguments: order['id'],
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 100,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            'لا توجد طلبات',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'لم تقم بأي طلبات بعد',
            style: TextStyle(color: Colors.grey[500]),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ابدأ التسوق'),
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onTap;

  const _OrderCard({
    required this.order,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    order['id'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: (order['statusColor'] as Color).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      order['statusText'],
                      style: TextStyle(
                        color: order['statusColor'],
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    _formatDate(order['date']),
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                  const SizedBox(width: 16),
                  Icon(Icons.shopping_bag, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    '${order['items']} منتجات',
                    style: TextStyle(color: Colors.grey[500], fontSize: 13),
                  ),
                ],
              ),
              const Divider(height: 24),
              ...List.generate(
                (order['products'] as List).length > 2
                    ? 2
                    : (order['products'] as List).length,
                (index) {
                  final product = order['products'][index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      '${product['name']} x${product['qty']}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  );
                },
              ),
              if ((order['products'] as List).length > 2)
                Text(
                  '+${(order['products'] as List).length - 2} منتجات أخرى',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 13,
                  ),
                ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${order['total']} ر.ي',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      if (order['status'] == 'delivered')
                        TextButton(
                          onPressed: () {},
                          child: const Text('إعادة الطلب'),
                        ),
                      if (order['status'] == 'pending' ||
                          order['status'] == 'processing')
                        TextButton(
                          onPressed: () => _showCancelDialog(context),
                          style: TextButton.styleFrom(foregroundColor: Colors.red),
                          child: const Text('إلغاء'),
                        ),
                      const Icon(Icons.arrow_forward_ios, size: 14),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إلغاء الطلب'),
        content: const Text('هل أنت متأكد من إلغاء هذا الطلب؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('لا'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('تم إلغاء الطلب')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('نعم، إلغاء'),
          ),
        ],
      ),
    );
  }
}
