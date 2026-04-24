import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/car_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/car_list_tile.dart';

class CarCategoryScreen extends StatefulWidget {
  const CarCategoryScreen({super.key});
  @override
  State<CarCategoryScreen> createState() => _CarCategoryScreenState();
}

class _CarCategoryScreenState extends State<CarCategoryScreen> {
  String _selectedOption = 'All';
  final List<String> _options = ['All', '7 Seater', '4 Seater', '2 Seater'];

  @override
  Widget build(BuildContext context) {
    final categoryName = ModalRoute.of(context)?.settings.arguments as String? ?? 'Cars';
    final carProvider = Provider.of<CarProvider>(context);
    carProvider.loadCarsForCategory(categoryName);

    return Scaffold(
      appBar: AppBar(title: Text('$categoryName Cars'), backgroundColor: AppTheme.surfaceDark),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: Column(children: [
          Padding(padding: const EdgeInsets.all(16), child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12), border: Border.all(color: AppTheme.dividerColor)),
            child: DropdownButtonHideUnderline(child: DropdownButton<String>(
              value: _selectedOption, isExpanded: true, dropdownColor: AppTheme.cardDark,
              style: const TextStyle(color: AppTheme.textPrimary),
              icon: const Icon(Icons.keyboard_arrow_down, color: AppTheme.primaryColor),
              items: _options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
              onChanged: (v) => setState(() => _selectedOption = v!),
            )),
          )),
          Expanded(child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: carProvider.carsInCategory.length,
            itemBuilder: (ctx, i) {
              final car = carProvider.carsInCategory[i];
              return CarListTile(name: car.name, price: car.price, onTap: () => Navigator.pushNamed(context, '/product'));
            },
          )),
        ]),
      ),
    );
  }
}
