import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/search_result_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  double _priceFilter = 500;

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Explore Cars'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: Column(children: [
          // Filter/Sort bar
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), child: Row(children: [
            Expanded(child: GestureDetector(onTap: () => _showFilterDialog(context),
              child: Container(padding: const EdgeInsets.symmetric(vertical: 14), decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.dividerColor)),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.filter_list, color: AppTheme.primaryColor, size: 18), SizedBox(width: 8), Text('Filter', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w500))])))),
            const SizedBox(width: 12),
            Expanded(child: GestureDetector(onTap: () => _showSortDialog(context),
              child: Container(padding: const EdgeInsets.symmetric(vertical: 14), decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.dividerColor)),
                child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.sort, color: AppTheme.primaryColor, size: 18), SizedBox(width: 8), Text('Sort', style: TextStyle(color: AppTheme.textPrimary, fontWeight: FontWeight.w500))])))),
          ])),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: carProvider.searchResults.length,
            itemBuilder: (ctx, i) {
              final r = carProvider.searchResults[i];
              return SearchResultCard(name: r.name, price: r.price, features: r.features, duration: r.duration, onTap: () => Navigator.pushNamed(context, '/product'));
            },
          )),
        ]),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(context: context, backgroundColor: AppTheme.surfaceDark, shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (ctx) => Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('Filter Cars', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
        const SizedBox(height: 20),
        const Text('Car Size', style: TextStyle(color: AppTheme.textSecondary, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        Wrap(spacing: 8, children: ['Mini', 'Economy', 'SUV', '7 Seater', 'Convertible'].map((s) => ChoiceChip(label: Text(s), selected: false, onSelected: (_) {}, backgroundColor: AppTheme.cardDark, labelStyle: const TextStyle(color: AppTheme.textPrimary))).toList()),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, height: 50, child: ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('APPLY FILTERS', style: TextStyle(color: Colors.white)))),
        const SizedBox(height: 12),
      ])));
  }

  void _showSortDialog(BuildContext context) {
    showDialog(context: context, builder: (ctx) => AlertDialog(
      backgroundColor: AppTheme.surfaceDark,
      title: const Text('SORT BY DAILY PRICE', style: TextStyle(color: AppTheme.textPrimary, fontSize: 16, fontWeight: FontWeight.w600)),
      content: StatefulBuilder(builder: (ctx, setS) => Column(mainAxisSize: MainAxisSize.min, children: [
        Text('\$${_priceFilter.toInt()}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
        Slider(value: _priceFilter, min: 0, max: 1000, activeColor: AppTheme.primaryColor, inactiveColor: AppTheme.dividerColor, onChanged: (v) => setS(() => _priceFilter = v)),
      ])),
      actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')), ElevatedButton(onPressed: () => Navigator.pop(ctx), child: const Text('DONE', style: TextStyle(color: Colors.white)))],
    ));
  }
}
