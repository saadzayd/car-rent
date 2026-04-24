import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WebViewScreen extends StatelessWidget {
  const WebViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final page = ModalRoute.of(context)?.settings.arguments as String? ?? 'faq';
    final titles = {'faq': 'FAQ', 'terms': 'Terms & Conditions', 'policy': 'Privacy Policy', 'thirdparty': 'Third Party Licenses'};
    final contents = {
      'faq': 'Q: How do I book a car?\nA: Browse our collection, select a car, choose your dates, and complete the booking.\n\nQ: Can I cancel my reservation?\nA: Yes, you can cancel up to 24 hours before pick-up for a full refund.\n\nQ: What payment methods do you accept?\nA: We accept PayPal, credit cards, and pay-on-arrival.\n\nQ: Is insurance included?\nA: Basic insurance is included. Additional coverage is available.',
      'terms': 'Terms of Service\n\n1. You must be at least 21 years old to rent a vehicle.\n2. A valid driver\'s license is required.\n3. The renter is responsible for all traffic violations.\n4. Vehicles must be returned with the same fuel level.\n5. Late returns may incur additional charges.',
      'policy': 'Privacy Policy\n\nWe collect personal information to provide and improve our services. Your data is stored securely and never shared with third parties without consent. You may request deletion of your data at any time.',
      'thirdparty': 'Third Party Licenses\n\n• Flutter - BSD License\n• Google Fonts - Apache 2.0\n• Provider - MIT License\n• SharedPreferences - BSD License\n• HTTP - BSD License',
    };

    return Scaffold(
      appBar: AppBar(title: Text(titles[page] ?? 'Info'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: AppTheme.glassCard,
            child: Text(contents[page] ?? '', style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14, height: 1.8)),
          ),
        ),
      ),
    );
  }
}
