import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/animated_background.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const AnimatedBackground(),
          SingleChildScrollView(
            child: Column(
              children: [
                NavBar(
                  onHomeTap: () => _scrollToSection(_heroKey),
                  onAboutTap: () => _scrollToSection(_aboutKey),
                  onProjectsTap: () => _scrollToSection(_projectsKey),
                  onContactTap: () => _scrollToSection(_contactKey),
                ).animate().fadeIn(duration: 500.ms).slideY(begin: -0.2, end: 0),
                _HeroSection(key: _heroKey),
                _AboutSection(key: _aboutKey),
                _ProjectsSection(key: _projectsKey),
                _ContactSection(key: _contactKey),
                const _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        children: [
          Text(
            "Hi, I’m Mageshwaran 👋",
            style: GoogleFonts.poppins(
              fontSize: 28,
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0),
          const SizedBox(height: 10),
          DefaultTextStyle(
            style: GoogleFonts.poppins(
              fontSize: 48,
              color: AppColors.text,
              fontWeight: FontWeight.bold,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Flutter Developer', speed: const Duration(milliseconds: 100)),
                TypewriterAnimatedText('Mobile App Engineer', speed: const Duration(milliseconds: 100)),
                TypewriterAnimatedText('Tech Enthusiast', speed: const Duration(milliseconds: 100)),
              ],
              repeatForever: true,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              "I specialize in building scalable, high-performance mobile applications using Flutter. "
              "I have hands-on experience developing real-world apps with clean UI, robust state management, and real-time data handling.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ).animate().fadeIn(delay: 600.ms),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      color: AppColors.secondary,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "About Me",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 20),
          Container(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Text(
              "I’m Mageshwaran, a Flutter Developer currently working at Amrithaa Company. "
              "I have successfully developed and contributed to 5 production-level mobile applications, "
              "handling complete app flows from UI to backend integration.\n\n"
              "My expertise includes:\n"
              "• Building responsive and user-friendly UI\n"
              "• Integrating REST APIs and real-time data\n"
              "• Implementing efficient state management\n"
              "• Working with authentication, pagination, and complex business logic\n\n"
              "I enjoy solving real-world problems through clean, maintainable code and continuously improving my technical skills.",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.textSecondary,
                height: 1.6,
              ),
            ),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 40),
          const _SkillsGrid(),
        ],
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    // Categorized skills
    final skills = [
      {'category': 'Flutter & Dart', 'items': ['State Management', 'Provider', 'GetX', 'Riverpod']},
      {'category': 'API Integration', 'items': ['REST APIs', 'Pagination & Filtering', 'Authentication flows', 'Real-Time (WebSocket)']},
      {'category': 'Mobile Features', 'items': ['OTP Verification', 'Image & File Upload', 'Secure Storage', 'Location Services']},
      {'category': 'Tools', 'items': ['Git & GitHub', 'Postman', 'Firebase']},
    ];

    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.center,
      children: skills.map((skillSet) {
        return Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primary.withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skillSet['category'] as String,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 10),
              ...(skillSet['items'] as List<String>).map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      "• $item",
                      style: GoogleFonts.poppins(
                          color: AppColors.textSecondary, fontSize: 14),
                    ),
                  )),
            ],
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1, end: 0);
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'TaakShift',
        'desc': 'A service-based mobile application built with Flutter, focusing on smooth user experience and scalable architecture.',
        'contributions': [
          'Implemented clean UI with responsive layouts',
          'Integrated REST APIs',
          'Used Provider for state management'
        ]
      },
      {
        'title': 'MyMediator',
        'desc': 'A mediator service application designed to manage bookings, history, and user interactions.',
        'contributions': [
          'API integration with complex data models',
          'Pagination and filtering',
          'State management using GetX'
        ]
      },
      {
        'title': 'SRS',
        'desc': 'A feature-rich application with service listings, booking flow, and user management.',
        'contributions': [
          'Complete authentication flow',
          'Advanced API handling',
          'Implemented Provider & Riverpod',
          'Optimized UI for performance'
        ]
      },
      {
        'title': 'TaxGlide',
        'desc': 'A real-time tax-related application built using Flutter WebSocket communication.',
        'contributions': [
          'Implemented WebSocket for live data updates',
          'Real-time UI updates',
          'Efficient state handling using Riverpod',
          'Focused on performance and reliability'
        ]
      },
      {
        'title': 'BookMyWage',
        'desc': 'A service booking application with multiple modules and dynamic content.',
        'contributions': [
          'State management using Riverpod',
          'API-driven UI',
          'Pagination and category-based filtering',
          'SharedPreferences & secure data handling'
        ]
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Text(
            "Featured Projects",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 40),
          Wrap(
            alignment: WrapAlignment.center,
            children: projects.map((project) {
              return ProjectCard(
                title: project['title'] as String,
                description: project['desc'] as String,
                keyContributions: project['contributions'] as List<String>,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key});

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(60),
      color: AppColors.secondary,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Get In Touch",
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ).animate().shake(delay: 500.ms),
          const SizedBox(height: 20),
          Text(
            "Let’s build something amazing together.",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ContactItem(
                icon: FontAwesomeIcons.envelope,
                label: 'mahimagesh78@gmail.com',
                onTap: () => _launchUrl('mailto:mahimagesh78@gmail.com'),
              ),
              const SizedBox(width: 30),
              _ContactItem(
                icon: FontAwesomeIcons.linkedin,
                label: 'LinkedIn',
                onTap: () => _launchUrl('https://www.linkedin.com/in/mageshwaran-selvam-1a8026244/'),
              ),
              const SizedBox(width: 30),
              _ContactItem(
                icon: FontAwesomeIcons.phone,
                label: '9488283532',
                onTap: () => _launchUrl('tel:9488283532'),
              ),
            ],
          ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ContactItem({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary, size: 30),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        "© 2026 Mageshwaran. All rights reserved.",
        style: GoogleFonts.poppins(color: Colors.white54),
      ),
    );
  }
}
