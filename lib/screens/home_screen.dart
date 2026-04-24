import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/car_category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _brandIcons = [
    {'name': 'BMW', 'icon': Icons.directions_car},
    {'name': 'TOYOTA', 'icon': Icons.directions_car_filled},
    {'name': 'FORD', 'icon': Icons.local_taxi},
    {'name': 'NISSAN', 'icon': Icons.car_rental},
    {'name': 'SAAB', 'icon': Icons.electric_car},
    {'name': 'VOLVO', 'icon': Icons.airport_shuttle},
    {'name': 'AUDI', 'icon': Icons.directions_car},
    {'name': 'MERCEDES', 'icon': Icons.directions_car_filled},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Find Car'), backgroundColor: AppTheme.surfaceDark, elevation: 0),
      drawer: _buildDrawer(context),
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: Column(children: [
          // Search bar
          Padding(padding: const EdgeInsets.all(16), child: Container(
            decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.dividerColor)),
            child: const TextField(style: TextStyle(color: AppTheme.textPrimary), decoration: InputDecoration(hintText: 'Search for cars...', prefixIcon: Icon(Icons.search, color: AppTheme.textSecondary), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 16))))),
          // Section title
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: Row(children: [
            const Text('SELECT CAR BY CATEGORY', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppTheme.textSecondary, letterSpacing: 1)),
            const Spacer(),
            Text('${_brandIcons.length} Brands', style: const TextStyle(fontSize: 12, color: AppTheme.primaryColor, fontWeight: FontWeight.w500)),
          ])),
          const SizedBox(height: 12),
          // Grid
          Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 16), child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 14, mainAxisSpacing: 14, childAspectRatio: 1.1),
            itemCount: _brandIcons.length,
            itemBuilder: (ctx, i) => CarCategoryCard(
              name: _brandIcons[i]['name'], imagePath: '', icon: _brandIcons[i]['icon'],
              onTap: () => Navigator.pushNamed(context, '/car-category', arguments: _brandIcons[i]['name']),
            ),
          ))),
        ]),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.surfaceDark,
      child: ListView(padding: EdgeInsets.zero, children: [
        DrawerHeader(decoration: const BoxDecoration(gradient: AppTheme.primaryGradient), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(width: 56, height: 56, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(16)), child: const Icon(Icons.person, color: Colors.white, size: 28)),
          const SizedBox(height: 12),
          const Text('Car Rental', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('Welcome back!', style: TextStyle(color: Colors.white70, fontSize: 13)),
        ])),
        _drawerItem(Icons.directions_car, 'View Cars', () { Navigator.pop(context); }),
        _drawerItem(Icons.search, 'Search Cars', () { Navigator.pop(context); Navigator.pushNamed(context, '/search'); }),
        _drawerItem(Icons.share, 'Share', () { Navigator.pop(context); _shareApp(); }),
        _drawerItem(Icons.person, 'My Profile', () { Navigator.pop(context); Navigator.pushNamed(context, '/account'); }),
        _drawerItem(Icons.business, 'About Us', () { Navigator.pop(context); Navigator.pushNamed(context, '/about'); }),
        _drawerItem(Icons.info_outline, 'Policy & Terms', () { Navigator.pop(context); Navigator.pushNamed(context, '/info'); }),
        const Divider(color: AppTheme.dividerColor),
        _drawerItem(Icons.logout, 'Logout', () { Provider.of<AuthProvider>(context, listen: false).logout(); Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (_) => false); }, color: AppTheme.accentColor),
      ]),
    );
  }

  Widget _drawerItem(IconData icon, String title, VoidCallback onTap, {Color? color}) {
    return ListTile(leading: Icon(icon, color: color ?? AppTheme.textSecondary), title: Text(title, style: TextStyle(color: color ?? AppTheme.textPrimary, fontWeight: FontWeight.w500)), onTap: onTap);
  }

  void _shareApp() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Share: Download and share this app - Car Rental')));
  }
}
