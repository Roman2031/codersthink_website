import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/gradient_button.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});
  @override State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();
  bool _loading = false;
  bool _submitted = false;
  String _service = 'Smart Attendance';

  @override
  void dispose() {
    _name.dispose(); _email.dispose(); _subject.dispose(); _message.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    await Future.delayed(const Duration(seconds: 1));
    setState(() { _loading = false; _submitted = true; });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (_submitted) {
      return Container(
        padding: const EdgeInsets.all(48),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(
            width: 80, height: 80,
            decoration: const BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
            child: const Icon(Icons.check_rounded, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 24),
          Text('Message Sent!', style: AppTextStyles.headlineLarge(context)),
          const SizedBox(height: 12),
          Text(
            'Thank you! We\'ll get back to you within 24 hours.',
            style: AppTextStyles.bodyLarge(context).copyWith(
                color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 28),
          GradientButton(
            label: 'Send Another Message',
            variant: GradientButtonVariant.outline,
            onPressed: () => setState(() => _submitted = false),
          ),
        ]),
      );
    }

    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightCard,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(isDark ? 0.3 : 0.06), blurRadius: 32, offset: const Offset(0, 8))],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Send us a Message', style: AppTextStyles.headlineLarge(context)),
            const SizedBox(height: 8),
            Text('Fill out the form and we\'ll be in touch shortly.',
                style: AppTextStyles.bodyMedium(context).copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
            const SizedBox(height: 32),
            Row(children: [
              Expanded(child: _Field(label: 'Full Name', ctrl: _name, hint: 'John Doe')),
              const SizedBox(width: 16),
              Expanded(child: _Field(label: 'Email Address', ctrl: _email, hint: 'john@example.com', isEmail: true)),
            ]),
            const SizedBox(height: 20),
            _ServiceDropdown(
              value: _service,
              isDark: isDark,
              onChanged: (v) => setState(() => _service = v!),
            ),
            const SizedBox(height: 20),
            _Field(label: 'Subject', ctrl: _subject, hint: 'How can we help you?'),
            const SizedBox(height: 20),
            _Field(label: 'Message', ctrl: _message, hint: 'Tell us about your project, requirements, or questions...', maxLines: 5),
            const SizedBox(height: 32),
            GradientButton(
              label: 'Send Message',
              onPressed: _submit,
              loading: _loading,
              icon: Icons.send_rounded,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class _Field extends StatelessWidget {
  final String label, hint;
  final TextEditingController ctrl;
  final int maxLines;
  final bool isEmail;
  const _Field({required this.label, required this.ctrl, required this.hint, this.maxLines = 1, this.isEmail = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
        const SizedBox(height: 8),
        TextFormField(
          controller: ctrl,
          maxLines: maxLines,
          keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
          style: GoogleFonts.inter(fontSize: 14, color: isDark ? AppColors.darkText : AppColors.lightText),
          decoration: InputDecoration(hintText: hint),
          validator: (v) {
            if (v == null || v.trim().isEmpty) return 'This field is required';
            if (isEmail && !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}\$').hasMatch(v)) return 'Enter a valid email';
            return null;
          },
        ),
      ],
    );
  }
}

class _ServiceDropdown extends StatelessWidget {
  final String value;
  final bool isDark;
  final ValueChanged<String?> onChanged;
  static const _services = [
    'Smart Attendance', 'Co-Operative Management', 'School Management',
    'Madrasa Management', 'Doctor Prescription', 'Other / General Inquiry',
  ];
  const _ServiceDropdown({required this.value, required this.isDark, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interested In', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600,
            color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          onChanged: onChanged,
          style: GoogleFonts.inter(fontSize: 14, color: isDark ? AppColors.darkText : AppColors.lightText),
          decoration: const InputDecoration(),
          dropdownColor: isDark ? AppColors.darkCard : Colors.white,
          items: _services.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
        ),
      ],
    );
  }
}
