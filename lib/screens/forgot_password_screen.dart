import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _sent = false;

  @override
  void dispose() { _emailCtrl.dispose(); super.dispose(); }

  void _reset() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _sent = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, height: double.infinity,
        decoration: const BoxDecoration(gradient: AppTheme.darkGradient),
        child: SafeArea(child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(key: _formKey, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 40),
            GestureDetector(onTap: () => Navigator.pop(context), child: Container(width: 44, height: 44, decoration: BoxDecoration(color: AppTheme.cardDark, borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.arrow_back, color: AppTheme.textPrimary))),
            const SizedBox(height: 40),
            const Text('Reset Password', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
            const SizedBox(height: 8),
            const Text('Enter your email to receive reset instructions.', style: TextStyle(fontSize: 14, color: AppTheme.textSecondary)),
            const SizedBox(height: 48),
            if (_sent) ...[
              Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: AppTheme.successGreen.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(16), border: Border.all(color: AppTheme.successGreen.withValues(alpha: 0.3))),
                child: const Row(children: [Icon(Icons.check_circle, color: AppTheme.successGreen), SizedBox(width: 12), Expanded(child: Text('Password recovery instructions sent!', style: TextStyle(color: AppTheme.successGreen, fontWeight: FontWeight.w500)))])),
              const SizedBox(height: 24),
            ],
            TextFormField(controller: _emailCtrl, keyboardType: TextInputType.emailAddress, style: const TextStyle(color: AppTheme.textPrimary),
              decoration: InputDecoration(labelText: 'Email', hintText: 'Enter your email', prefixIcon: const Icon(Icons.email_outlined, color: AppTheme.textSecondary), filled: true, fillColor: AppTheme.cardDark.withValues(alpha: 0.5)),
              validator: (v) { if (v?.isEmpty ?? true) return 'Email is required'; if (!v!.contains('@')) return 'Invalid email'; return null; }),
            const SizedBox(height: 32),
            SizedBox(width: double.infinity, height: 56, child: ElevatedButton(onPressed: _reset,
              style: ElevatedButton.styleFrom(backgroundColor: AppTheme.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)), elevation: 8),
              child: const Text('RESET PASSWORD', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.5, color: Colors.white)))),
          ])))),
      ),
    );
  }
}
