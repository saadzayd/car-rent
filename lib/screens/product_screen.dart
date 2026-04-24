import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/feature_row.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: CustomScrollView(slivers: [
          SliverAppBar(expandedHeight: 260, pinned: true, backgroundColor: AppTheme.surfaceDark,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.primaryColor.withValues(alpha: 0.3), AppTheme.backgroundDark], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                child: const Center(child: Icon(Icons.directions_car, size: 100, color: Colors.white24)),
              ),
            ),
            actions: [
              IconButton(icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: _isFavorite ? AppTheme.accentColor : Colors.white), onPressed: () => setState(() => _isFavorite = !_isFavorite)),
            ],
          ),
          SliverToBoxAdapter(child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text('BMW 5 Series', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
              Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                const Text('\$120', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                Text('/day', style: TextStyle(fontSize: 12, color: AppTheme.textSecondary)),
              ]),
            ]),
            const SizedBox(height: 8),
            Row(children: List.generate(5, (i) => Icon(Icons.star, size: 18, color: i < 4 ? AppTheme.goldAccent : AppTheme.dividerColor))),
            const SizedBox(height: 24),
            // Specifications
            Container(padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Specifications', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              const SizedBox(height: 12),
              const FeatureRow(title: 'Mileage', value: '23 km/L', icon: Icons.speed),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Fuel Type', value: 'Petrol', icon: Icons.local_gas_station),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Engine', value: 'Automatic', icon: Icons.settings),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Seats', value: '5 seaters', icon: Icons.event_seat),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Fuel Economy', value: 'Yes', icon: Icons.eco),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Air Condition', value: 'Yes', icon: Icons.ac_unit),
            ])),
            const SizedBox(height: 16),
            // Pricing
            Container(padding: const EdgeInsets.all(20), decoration: AppTheme.glassCard, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Pricing', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppTheme.textPrimary)),
              const SizedBox(height: 12),
              const FeatureRow(title: 'Hourly Price', value: '\$25', icon: Icons.access_time),
              const Divider(color: AppTheme.dividerColor, height: 1),
              const FeatureRow(title: 'Daily Price', value: '\$120', icon: Icons.calendar_today),
            ])),
            const SizedBox(height: 24),
            SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/booking'),
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 8),
              child: const Text('CONTINUE BOOKING', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1, color: Colors.white)),
            )),
            const SizedBox(height: 20),
          ]))),
        ]),
      ),
    );
  }
}
