import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Us'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Header
          Container(width: double.infinity, padding: const EdgeInsets.all(24), decoration: AppTheme.gradientCard, child: Column(children: [
            Container(width: 70, height: 70, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.directions_car, color: Colors.white, size: 36)),
            const SizedBox(height: 16),
            const Text('Car Rental Co.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 4),
            Text('Nygatan 11, 24231 Horby, Sweden', style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 13)),
          ])),
          const SizedBox(height: 20),

          // About info
          Container(padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _infoRow(Icons.person, 'Manager', 'John Doe'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _infoRow(Icons.description, 'About', 'Premium car rental service with a wide selection of vehicles.'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _infoRow(Icons.email, 'Email', 'info@carrental.com'),
            const Divider(color: AppTheme.dividerColor, height: 24),
            _infoRow(Icons.phone, 'Phone', '+46 720 177 156'),
          ])),
          const SizedBox(height: 20),

          // Action buttons
          Row(children: [
            Expanded(child: SizedBox(height: 50, child: ElevatedButton.icon(
              onPressed: () => _showContactDialog(context), icon: const Icon(Icons.email, color: Colors.white), label: const Text('Contact Us', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))))),
            const SizedBox(width: 12),
            Expanded(child: SizedBox(height: 50, child: OutlinedButton.icon(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Calling +46 720 177 156...'))),
              icon: const Icon(Icons.phone), label: const Text('Call Us'),
              style: OutlinedButton.styleFrom(foregroundColor: AppTheme.primaryColor, side: const BorderSide(color: AppTheme.primaryColor), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))))),
          ]),
        ])),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Icon(icon, size: 18, color: AppTheme.primaryColor),
      const SizedBox(width: 12),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary)),
        const SizedBox(height: 2),
        Text(value, style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary)),
      ])),
    ]);
  }

  void _showContactDialog(BuildContext context) {
    final subjectCtrl = TextEditingController();
    final messageCtrl = TextEditingController();
    showDialog(context: context, builder: (ctx) => AlertDialog(
      backgroundColor: AppTheme.surfaceDark, title: const Text('Contact Us', style: TextStyle(color: AppTheme.textPrimary)),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: subjectCtrl, style: const TextStyle(color: AppTheme.textPrimary), decoration: const InputDecoration(hintText: 'Subject')),
        const SizedBox(height: 12),
        TextField(controller: messageCtrl, style: const TextStyle(color: AppTheme.textPrimary), maxLines: 3, decoration: const InputDecoration(hintText: 'Message')),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
        ElevatedButton(onPressed: () { Navigator.pop(ctx); ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message sent!'))); }, child: const Text('Send', style: TextStyle(color: Colors.white))),
      ],
    ));
  }
}
