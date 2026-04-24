import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(children: [
          const SizedBox(height: 20),
          // Success icon
          Container(width: 80, height: 80, decoration: BoxDecoration(color: AppTheme.successGreen.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: const Icon(Icons.check_circle, color: AppTheme.successGreen, size: 48)),
          const SizedBox(height: 16),
          const Text('Booking Confirmed!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          const SizedBox(height: 4),
          const Text('Your car has been reserved', style: TextStyle(color: AppTheme.textSecondary)),
          const SizedBox(height: 32),

          // Car info
          Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(children: [
            Container(height: 120, width: double.infinity, decoration: BoxDecoration(gradient: AppTheme.cardGradient, borderRadius: BorderRadius.circular(12)),
              child: const Center(child: Icon(Icons.directions_car, size: 60, color: Colors.white24))),
            const SizedBox(height: 16),
            const Text('BMW 5 Series', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          ])),
          const SizedBox(height: 16),

          // Details
          Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(children: [
            _detailRow(Icons.location_on, 'Pick-up', 'Nygatan 11, 24231 Horby'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _detailRow(Icons.calendar_today, 'Date', 'July 30, 2027'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _detailRow(Icons.access_time, 'Time', '8:40 AM'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _detailRow(Icons.attach_money, 'Total', '\$155'),
          ])),
          const SizedBox(height: 16),

          // Order info
          Container(width: double.infinity, padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(children: [
            _detailRow(Icons.confirmation_number, 'Order #', 'CR-2027-0431'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _detailRow(Icons.phone, 'Contact', '+46 720 177 156'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _detailRow(Icons.info_outline, 'Status', 'Confirmed'),
          ])),
          const SizedBox(height: 32),

          SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 8),
            child: const Text('BACK TO HOME', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.white)))),
          const SizedBox(height: 20),
        ])),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value) {
    return Row(children: [
      Icon(icon, size: 18, color: AppTheme.primaryColor),
      const SizedBox(width: 12),
      Text(label, style: const TextStyle(color: AppTheme.textSecondary, fontSize: 13)),
      const Spacer(),
      Text(value, style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w500, fontSize: 13)),
    ]);
  }
}
