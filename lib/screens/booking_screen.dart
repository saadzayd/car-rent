// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/booking_provider.dart';
import '../theme/app_theme.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bp = Provider.of<BookingProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Book a Car'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Car preview
          Container(height: 160, width: double.infinity, decoration: BoxDecoration(gradient: AppTheme.cardGradient, borderRadius: BorderRadius.circular(16)),
            child: const Center(child: Icon(Icons.directions_car, size: 80, color: Colors.white24))),
          const SizedBox(height: 20),

          // Pick-up location
          _sectionTitle('Pick-up Location'),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(16), decoration: AppTheme.glassCard,
            child: Row(children: [const Icon(Icons.location_on, color: AppTheme.primaryColor), const SizedBox(width: 12), Expanded(child: Text(bp.pickUpLocation, style: const TextStyle(color: AppTheme.textPrimary)))])),
          const SizedBox(height: 20),

          // Date pickers
          Row(children: [
            Expanded(child: _dateCard(context, 'Pick-up Date', bp.startDate, () async {
              final d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
              if (d != null) bp.setStartDate(d);
            })),
            const SizedBox(width: 12),
            Expanded(child: _dateCard(context, 'Return Date', bp.endDate, () async {
              final d = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
              if (d != null) bp.setEndDate(d);
            })),
          ]),
          const SizedBox(height: 20),

          // Extras
          _sectionTitle('Extras'),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(8), decoration: AppTheme.glassCard, child: Column(children: [
            CheckboxListTile(title: const Text('Ski Rack', style: TextStyle(color: AppTheme.textPrimary)), value: bp.skiRack, activeColor: AppTheme.primaryColor, onChanged: (_) => bp.toggleSkiRack()),
            CheckboxListTile(title: const Text('Child Car Seat', style: TextStyle(color: AppTheme.textPrimary)), value: bp.carSeat, activeColor: AppTheme.primaryColor, onChanged: (_) => bp.toggleCarSeat()),
            CheckboxListTile(title: const Text('Navigation System', style: TextStyle(color: AppTheme.textPrimary)), value: bp.navigation, activeColor: AppTheme.primaryColor, onChanged: (_) => bp.toggleNavigation()),
          ])),
          const SizedBox(height: 20),

          // Pricing
          _sectionTitle('Pricing Summary'),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(children: [
            _priceRow('Daily Price', '\$${bp.dailyPrice.toStringAsFixed(0)}'),
            _priceRow('Extra Hour', '\$${bp.extraHour.toStringAsFixed(0)}'),
            _priceRow('Tax', '\$${bp.tax.toStringAsFixed(0)}'),
            const Divider(color: AppTheme.dividerColor),
            _priceRow('Total', '\$${bp.totalAmount.toStringAsFixed(0)}', bold: true, color: AppTheme.primaryColor),
          ])),
          const SizedBox(height: 20),

          // Payment method
          _sectionTitle('Payment Method'),
          const SizedBox(height: 8),
          Container(padding: const EdgeInsets.all(8), decoration: AppTheme.glassCard, child: Column(children: [
            RadioListTile<String>(title: const Text('PayPal', style: TextStyle(color: AppTheme.textPrimary)), value: 'paypal', groupValue: bp.paymentMethod, activeColor: AppTheme.primaryColor, onChanged: (v) => bp.setPaymentMethod(v!)),
            RadioListTile<String>(title: const Text('Credit Card', style: TextStyle(color: AppTheme.textPrimary)), value: 'credit', groupValue: bp.paymentMethod, activeColor: AppTheme.primaryColor, onChanged: (v) => bp.setPaymentMethod(v!)),
            RadioListTile<String>(title: const Text('Pay Later', style: TextStyle(color: AppTheme.textPrimary)), value: 'later', groupValue: bp.paymentMethod, activeColor: AppTheme.primaryColor, onChanged: (v) => bp.setPaymentMethod(v!)),
          ])),
          const SizedBox(height: 24),

          SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/checkout'),
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 8),
            child: const Text('PAY NOW', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.white)))),
          const SizedBox(height: 20),
        ])),
      ),
    );
  }

  Widget _sectionTitle(String t) => Text(t, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary));

  Widget _dateCard(BuildContext ctx, String label, DateTime? date, VoidCallback onTap) {
    return GestureDetector(onTap: onTap, child: Container(padding: const EdgeInsets.all(16), decoration: AppTheme.glassCard,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        const SizedBox(height: 8),
        Row(children: [const Icon(Icons.calendar_today, size: 16, color: AppTheme.primaryColor), const SizedBox(width: 8),
          Text(date != null ? DateFormat('MMM dd, yyyy').format(date) : 'Select', style: const TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w500))]),
      ])));
  }

  Widget _priceRow(String label, String value, {bool bold = false, Color? color}) {
    return Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
      Text(value, style: TextStyle(color: color ?? AppTheme.textPrimary, fontSize: bold ? 18 : 14, fontWeight: bold ? FontWeight.bold : FontWeight.w500)),
    ]));
  }
}
