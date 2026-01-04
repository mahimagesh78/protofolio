import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class NavBar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onProjectsTap;
  final VoidCallback? onContactTap;

  const NavBar({
    super.key,
    this.onHomeTap,
    this.onAboutTap,
    this.onProjectsTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            // Desktop Layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amrithaa',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                Row(
                  children: [
                    _NavItem(title: 'Home', onTap: onHomeTap),
                    _NavItem(title: 'About', onTap: onAboutTap),
                    _NavItem(title: 'Projects', onTap: onProjectsTap),
                    _NavItem(title: 'Contact', onTap: onContactTap),
                  ],
                )
              ],
            );
          } else {
             // Mobile/Tablet Layout - simplified to vertical or wrap
             return Column(
               children: [
                 Text(
                  'Amrithaa',
                  style: GoogleFonts.poppins(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    _NavItem(title: 'Home', onTap: onHomeTap),
                    _NavItem(title: 'About', onTap: onAboutTap),
                    _NavItem(title: 'Projects', onTap: onProjectsTap),
                    _NavItem(title: 'Contact', onTap: onContactTap),
                  ],
                )
               ],
             );
          }
        },
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const _NavItem({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: AppColors.text,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
