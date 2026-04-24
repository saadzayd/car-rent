import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/booking_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/reservation_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Account'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: _tabIndex == 0 ? _buildProfile() : _buildReservations(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabIndex, onTap: (i) => setState(() => _tabIndex = i),
        backgroundColor: AppTheme.surfaceDark, selectedItemColor: AppTheme.primaryColor, unselectedItemColor: AppTheme.textSecondary,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.receipt_long), label: 'Reservations'),
        ],
      ),
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
      const SizedBox(height: 20),
      Container(width: 90, height: 90, decoration: BoxDecoration(gradient: AppTheme.primaryGradient, shape: BoxShape.circle, boxShadow: [BoxShadow(color: AppTheme.primaryColor.withValues(alpha: 0.3), blurRadius: 20)]),
        child: const Icon(Icons.person, color: Colors.white, size: 44)),
      const SizedBox(height: 24),
      Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(children: [
        _profileRow(Icons.person, 'Name', 'Demo User'),
        const Divider(color: AppTheme.dividerColor, height: 24),
        _profileRow(Icons.email, 'Email', 'demo@email.com'),
        const Divider(color: AppTheme.dividerColor, height: 24),
        _profileRow(Icons.phone, 'Phone', '+1234567890'),
        const Divider(color: AppTheme.dividerColor, height: 24),
        _profileRow(Icons.location_on, 'Address', 'Nygatan 11, 24231 Horby'),
      ])),
    ]));
  }

  Widget _buildReservations() {
    final bp = Provider.of<BookingProvider>(context);
    return DefaultTabController(length: 3, child: Column(children: [
      const TabBar(tabs: [Tab(text: 'Upcoming'), Tab(text: 'Complete'), Tab(text: 'Cancelled')],
        labelColor: AppTheme.primaryColor, unselectedLabelColor: AppTheme.textSecondary, indicatorColor: AppTheme.primaryColor),
      Expanded(child: TabBarView(children: [
        _reservationList(bp.getUpcomingReservations()),
        _reservationList(bp.getCompletedReservations()),
        _reservationList(bp.getCancelledReservations()),
      ])),
    ]));
  }

  Widget _reservationList(List items) {
    if (items.isEmpty) return const Center(child: Text('No reservations', style: TextStyle(color: AppTheme.textSecondary)));
    return ListView.builder(padding: const EdgeInsets.all(16), itemCount: items.length, itemBuilder: (ctx, i) {
      final r = items[i];
      return ReservationCard(carName: r.carName, pickUpLocation: r.pickUpLocation, pickUpDate: r.pickUpDate, pickUpTime: r.pickUpTime, price: r.price);
    });
  }

  Widget _profileRow(IconData icon, String label, String value) {
    return Row(children: [Icon(icon, size: 18, color: AppTheme.primaryColor), const SizedBox(width: 12), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
      const SizedBox(height: 2),
      Text(value, style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary, fontWeight: FontWeight.w500)),
    ])]);
  }
}
