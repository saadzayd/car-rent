import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Policy & Terms'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: Padding(padding: const EdgeInsets.all(20), child: Column(children: [
          _infoButton(context, Icons.help_outline, 'FAQ', 'Frequently Asked Questions', 'faq'),
          const SizedBox(height: 12),
          _infoButton(context, Icons.description, 'Terms & Conditions', 'Read our terms of service', 'terms'),
          const SizedBox(height: 12),
          _infoButton(context, Icons.privacy_tip_outlined, 'Privacy Policy', 'How we handle your data', 'policy'),
          const SizedBox(height: 12),
          _infoButton(context, Icons.people_outline, 'Third Party Licenses', 'Open source acknowledgments', 'thirdparty'),
        ])),
      ),
    );
  }

  Widget _infoButton(BuildContext context, IconData icon, String title, String subtitle, String page) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/webview', arguments: page),
      child: Container(padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard,
        child: Row(children: [
          Container(width: 44, height: 44, decoration: BoxDecoration(color: AppTheme.primaryColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: AppTheme.primaryColor, size: 22)),
          const SizedBox(width: 16),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
            const SizedBox(height: 2),
            Text(subtitle, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
          ])),
          const Icon(Icons.chevron_right, color: AppTheme.textSecondary),
        ])),
    );
  }
}
