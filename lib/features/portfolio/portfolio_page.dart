import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../shared/widgets/gradient_text.dart';
import 'widgets/portfolio_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});
  @override State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  String _filter = 'All';
  static const _filters = ['All', 'Cooperative', 'School', 'Madrasa', 'Healthcare', 'Attendance', 'Education'];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    final items = _filter == 'All'
        ? AppConstants.portfolioItems
        : AppConstants.portfolioItems.where((i) => i['category'] == _filter).toList();

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          decoration: BoxDecoration(
            gradient: isDark ? AppColors.heroGradient : const LinearGradient(
              colors: [Color(0xFFEEEEFF), Color(0xFFF8F9FF)],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
          child: FadeInWidget(child: Column(children: [
            GradientText('Our Portfolio', style: AppTextStyles.displayLarge(context), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text(
              'A showcase of impactful digital solutions we\'ve built across Bangladesh.',
              style: AppTextStyles.bodyXL(context).copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
              textAlign: TextAlign.center,
            ),
          ])),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _filters.map((f) {
                    final active = _filter == f;
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () => setState(() => _filter = f),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              gradient: active ? AppColors.primaryGradient : null,
                              color: active ? null : (isDark ? AppColors.darkCard : AppColors.lightCard),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: active ? Colors.transparent : (isDark ? AppColors.darkBorder : AppColors.lightBorder)),
                            ),
                            child: Text(f, style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: active ? FontWeight.w600 : FontWeight.w500,
                              color: active ? Colors.white : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                            )),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 40),
              LayoutBuilder(builder: (context, constraints) {
                final count = isMobile ? 1 : (constraints.maxWidth < 900 ? 2 : 3);
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 1.1,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, i) => FadeInWidget(
                    key: Key('portfolio-$_filter-$i'),
                    delay: Duration(milliseconds: 60 * i),
                    child: PortfolioCard(item: items[i]),
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
