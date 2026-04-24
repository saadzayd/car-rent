import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../theme/app_theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  void dispose() {
    _nameCtrl.dispose(); _emailCtrl.dispose();
    _passCtrl.dispose(); _phoneCtrl.dispose();
    super.dispose();
  }

  void _register() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final auth = Provider.of<AuthProvider>(context, listen: false);
    final ok = await auth.register(_nameCtrl.text.trim(), _emailCtrl.text.trim(), _passCtrl.text.trim(), _phoneCtrl.text.trim());
    if (ok && mounted) {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Registration failed.')));
    }
  }

  InputDecoration _dec(String label, String hint, IconData icon, {Widget? suffix}) => InputDecoration(
    labelText: label, hintText: hint,
    prefixIcon: Icon(icon, color: AppTheme.textSecondary),
    suffixIcon: suffix, filled: true, fillColor: AppTheme.cardDark.withValues(alpha: 0.5),
  );

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        width: double.infinity, height: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Form(key: _formKey, child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                GestureDetector(onTap: () => Navigator.pop(context),
                  child: Container(width: 44, height: 44, decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12)),
                    child: const Icon(Icons.arrow_back, color: AppTheme.textPrimary))),
                const SizedBox(height: 32),
                const Text('Create Account', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
                const SizedBox(height: 8),
                const Text('Fill in the details to get started.', style: TextStyle(fontSize: 14, color: AppTheme.textSecondary)),
                const SizedBox(height: 36),
                TextFormField(controller: _nameCtrl, style: const TextStyle(color: AppTheme.textPrimary), decoration: _dec('Full Name', 'Enter your name', Icons.person_outline), validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null),
                const SizedBox(height: 16),
                TextFormField(controller: _emailCtrl, keyboardType: TextInputType.emailAddress, style: const TextStyle(color: AppTheme.textPrimary), decoration: _dec('Email', 'Enter your email', Icons.email_outlined), validator: (v) { if (v?.isEmpty ?? true) return 'Required'; if (!v!.contains('@')) return 'Invalid email'; return null; }),
                const SizedBox(height: 16),
                TextFormField(controller: _passCtrl, obscureText: _obscure, style: const TextStyle(color: AppTheme.textPrimary),
                  decoration: _dec('Password', 'Create a password', Icons.lock_outline, suffix: IconButton(icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: AppTheme.textSecondary), onPressed: () => setState(() => _obscure = !_obscure))),
                  validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null),
                const SizedBox(height: 16),
                TextFormField(controller: _phoneCtrl, keyboardType: TextInputType.phone, style: const TextStyle(color: AppTheme.textPrimary), decoration: _dec('Phone', 'Enter phone number', Icons.phone_outlined), validator: (v) => (v?.isEmpty ?? true) ? 'Required' : null),
                const SizedBox(height: 32),
                SizedBox(width: double.infinity, height: 56, child: ElevatedButton(
                  onPressed: auth.isLoading ? null : _register,
                  style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 8),
                  child: auth.isLoading ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2)) : const Text('REGISTER', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.5, color: Colors.white)))),
                const SizedBox(height: 24),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text('Already have an account? ', style: TextStyle(color: AppTheme.textSecondary)),
                  GestureDetector(onTap: () => Navigator.pushReplacementNamed(context, '/sign-in'), child: const Text('Login', style: TextStyle(color: AppTheme.primaryColor, fontWeight: FontWeight.w600))),
                ]),
                const SizedBox(height: 32),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
