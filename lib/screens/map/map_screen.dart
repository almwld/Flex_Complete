import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final MapController _mapController = MapController();
  LatLng? _selectedLocation;
  final TextEditingController _searchController = TextEditingController();

  // Yemen locations
  static const LatLng sanaaCenter = LatLng(15.3694, 44.1910);
  static const LatLng adenCenter = LatLng(12.7858, 45.0187);
  static const LatLng taizCenter = LatLng(13.5788, 44.0213);

  final List<MapLocation> _locations = [
    MapLocation(
      name: 'صنعاء - الفرع الرئيسي',
      address: 'شارع الزبيري، صنعاء',
      latLng: sanaaCenter,
      type: LocationType.branch,
      phone: '+967-1-2345678',
    ),
    MapLocation(
      name: 'صنعاء - فرع工业企业',
      address: 'شارع الستين، صنعاء',
      latLng: const LatLng(15.3550, 44.2050),
      type: LocationType.branch,
      phone: '+967-1-4567890',
    ),
    MapLocation(
      name: 'عدن - الفرع الرئيسي',
      address: 'خور مكسر، عدن',
      latLng: adenCenter,
      type: LocationType.branch,
      phone: '+967-2-2345678',
    ),
    MapLocation(
      name: 'تعز - الفرع',
      address: 'شارع الخمسين، تعز',
      latLng: const LatLng(13.5940, 43.9670),
      type: LocationType.branch,
      phone: '+967-4-2345678',
    ),
    MapLocation(
      name: 'الحديدة - الفرع',
      address: 'شارع الكورنيش، الحديدة',
      latLng: const LatLng(14.7978, 42.9513),
      type: LocationType.branch,
      phone: '+967-3-2345678',
    ),
    MapLocation(
      name: 'متجر الإلكتروني - صنعاء',
      address: 'شارع ز Boulevard، صنعاء',
      latLng: const LatLng(15.3800, 44.1800),
      type: LocationType.store,
      phone: '+967-1-9876543',
    ),
    MapLocation(
      name: 'مطعم الفلكس - عدن',
      address: 'خور مكسر، عدن',
      latLng: const LatLng(12.7900, 45.0200),
      type: LocationType.restaurant,
      phone: '+967-2-3456789',
    ),
  ];

  MapLocationType _selectedType = MapLocationType.all;
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<MapLocation> get filteredLocations {
    return _locations.where((location) {
      final matchesType = _selectedType == MapLocationType.all ||
          location.type.name.contains(_selectedType.name);
      final matchesSearch = _searchQuery.isEmpty ||
          location.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          location.address.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesType && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الخريطة'),
        backgroundColor: AppColors.goldColor,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _goToCurrentLocation,
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildTypeFilter(),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: _buildMap(),
                ),
                Expanded(
                  flex: 2,
                  child: _buildLocationsList(),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'ابحث عن موقع...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() => _searchQuery = '');
                  },
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[300]!),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
        onChanged: (value) => setState(() => _searchQuery = value),
      ),
    );
  }

  Widget _buildTypeFilter() {
    return Container(
      height: 50,
      color: Colors.white,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: MapLocationType.values.map((type) {
          final isSelected = _selectedType == type;
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: FilterChip(
              label: Text(_getTypeLabel(type)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() => _selectedType = type);
              },
              selectedColor: AppColors.goldColor.withOpacity(0.2),
              checkmarkColor: AppColors.goldColor,
              labelStyle: TextStyle(
                color: isSelected ? AppColors.goldColor : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _getTypeLabel(MapLocationType type) {
    switch (type) {
      case MapLocationType.all:
        return 'الكل';
      case MapLocationType.branch:
        return 'فروع';
      case MapLocationType.store:
        return 'متاجر';
      case MapLocationType.restaurant:
        return 'مطاعم';
      case MapLocationType.atm:
        return 'صرافين';
      case MapLocationType.agent:
        return 'وكلاء';
    }
  }

  Widget _buildMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        initialCenter: sanaaCenter,
        initialZoom: 12.0,
        onTap: (tapPosition, point) {
          setState(() => _selectedLocation = point);
        },
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.flexyemen.app',
        ),
        MarkerLayer(
          markers: filteredLocations.map((location) {
            return Marker(
              point: location.latLng,
              width: 40,
              height: 50,
              child: GestureDetector(
                onTap: () => _showLocationDetails(location),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _getMarkerColor(location.type),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        _getTypeIcon(location.type),
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 10,
                      color: _getMarkerColor(location.type),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Color _getMarkerColor(LocationType type) {
    switch (type) {
      case LocationType.branch:
        return AppColors.goldColor;
      case LocationType.store:
        return Colors.blue;
      case LocationType.restaurant:
        return Colors.red;
      case LocationType.atm:
        return Colors.green;
      case LocationType.agent:
        return Colors.purple;
    }
  }

  IconData _getTypeIcon(LocationType type) {
    switch (type) {
      case LocationType.branch:
        return Icons.business;
      case LocationType.store:
        return Icons.store;
      case LocationType.restaurant:
        return Icons.restaurant;
      case LocationType.atm:
        return Icons.atm;
      case LocationType.agent:
        return Icons.person;
    }
  }

  Widget _buildLocationsList() {
    final locations = filteredLocations;
    return Container(
      color: Colors.white,
      child: locations.isEmpty
          ? const Center(
              child: Text(
                'لا توجد نتائج',
                style: TextStyle(color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return _LocationListItem(
                  location: location,
                  onTap: () => _focusOnLocation(location),
                );
              },
            ),
    );
  }

  Widget _buildFab() {
    return FloatingActionButton(
      onPressed: () => _showFilterSheet(),
      backgroundColor: AppColors.goldColor,
      child: const Icon(Icons.filter_list, color: Colors.white),
    );
  }

  void _goToCurrentLocation() {
    _mapController.move(sanaaCenter, 14.0);
  }

  void _focusOnLocation(MapLocation location) {
    _mapController.move(location.latLng, 16.0);
  }

  void _showLocationDetails(MapLocation location) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildLocationDetailsSheet(location),
    );
  }

  Widget _buildLocationDetailsSheet(MapLocation location) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _getMarkerColor(location.type).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getTypeIcon(location.type),
                  color: _getMarkerColor(location.type),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      location.address,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              if (location.phone.isNotEmpty)
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Call phone
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('اتصال'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.goldColor,
                      side: const BorderSide(color: AppColors.goldColor),
                    ),
                  ),
                ),
              if (location.phone.isNotEmpty) const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _focusOnLocation(location),
                  icon: const Icon(Icons.directions),
                  label: const Text('احصل على الاتجاهات'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.goldColor,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () {
                // Share location
              },
              icon: const Icon(Icons.share),
              label: const Text('مشاركة الموقع'),
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'تصفية المواقع',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilterChip(
                  label: const Text('الفروع'),
                  selected: false,
                  onSelected: (v) {},
                ),
                FilterChip(
                  label: const Text('المتاجر'),
                  selected: false,
                  onSelected: (v) {},
                ),
                FilterChip(
                  label: const Text('المطاعم'),
                  selected: false,
                  onSelected: (v) {},
                ),
                FilterChip(
                  label: const Text('الصرافين'),
                  selected: false,
                  onSelected: (v) {},
                ),
                FilterChip(
                  label: const Text('الوكلاء'),
                  selected: false,
                  onSelected: (v) {},
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.goldColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'تطبيق',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationListItem extends StatelessWidget {
  final MapLocation location;
  final VoidCallback onTap;

  const _LocationListItem({
    required this.location,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                color: AppColors.goldColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    location.address,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_left, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// Models
enum MapLocationType { all, branch, store, restaurant, atm, agent }

enum LocationType { branch, store, restaurant, atm, agent }

class MapLocation {
  final String name;
  final String address;
  final LatLng latLng;
  final LocationType type;
  final String phone;
  final String? imageUrl;
  final List<String>? services;
  final String? workingHours;

  MapLocation({
    required this.name,
    required this.address,
    required this.latLng,
    required this.type,
    required this.phone,
    this.imageUrl,
    this.services,
    this.workingHours,
  });
}