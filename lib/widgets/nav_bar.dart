import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../main.dart';
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
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.92),
        border: Border(
          bottom: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: AppConstants.maxContentWidth,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 700;

              final logo = Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'M',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Mageshwaran',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              );

              final navLinks = Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _NavItem(title: 'Home', onTap: onHomeTap),
                  _NavItem(title: 'About', onTap: onAboutTap),
                  _NavItem(title: 'Projects', onTap: onProjectsTap),
                  const SizedBox(width: 8),
                  const _ThemeToggleButton(),
                  const SizedBox(width: 8),
                  _ContactButton(onTap: onContactTap),
                ],
              );

              if (isMobile) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        logo,
                        const _ThemeToggleButton(),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        _NavItem(title: 'Home', onTap: onHomeTap),
                        _NavItem(title: 'About', onTap: onAboutTap),
                        _NavItem(title: 'Projects', onTap: onProjectsTap),
                        _ContactButton(onTap: onContactTap),
                      ],
                    ),
                  ],
                );
              }

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [logo, navLinks],
              );
            },
          ),
        ),
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
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        ),
        child: Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final VoidCallback? onTap;
  const _ContactButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          'Contact',
          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class _ThemeToggleButton extends StatelessWidget {
  const _ThemeToggleButton();

  @override
  Widget build(BuildContext context) {
    // Need to use a builder or similar if MyApp is not in scope,
    // but since we provided MyApp.of(context), we can use it.
    // However, to avoid tight coupling with main.dart, we can just use 
    // a common pattern or require the user to import main.dart
    
    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark 
            ? Icons.light_mode 
            : Icons.dark_mode,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onPressed: () {
        MyApp.of(context).toggleTheme();
      },
    );
  }
}
