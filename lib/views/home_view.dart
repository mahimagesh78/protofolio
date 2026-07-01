import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:protfolio/views/profile_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../constants.dart';
import '../widgets/nav_bar.dart';
import '../widgets/project_card.dart';
import '../widgets/animated_background.dart';

/// Wraps section content to a max width and centers it — keeps the
/// layout readable and professional on large desktop screens.
class _Bounded extends StatelessWidget {
  final Widget child;
  const _Bounded({required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppConstants.maxContentWidth,
        ),
        child: child,
      ),
    );
  }
}

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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          const AnimatedBackground(),
          Column(
            children: [
              NavBar(
                onHomeTap: () => _scrollToSection(_heroKey),
                onAboutTap: () => _scrollToSection(_aboutKey),
                onProjectsTap: () => _scrollToSection(_projectsKey),
                onContactTap: () => _scrollToSection(_contactKey),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _HeroSection(key: _heroKey),
                      _AboutSection(key: _aboutKey),
                      _ProjectsSection(key: _projectsKey),
                      _ContactSection(key: _contactKey),
                      const _Footer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ---------------- HERO ----------------

class _HeroSection extends StatelessWidget {
  const _HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      child: _Bounded(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 900;

            final textColumn = Column(
              crossAxisAlignment: isWide
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                // Availability badge
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Available for new opportunities',
                        style: GoogleFonts.inter(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 400.ms),
                const SizedBox(height: 24),

                Text(
                  "Mageshwaran Selvam",
                  textAlign: isWide ? TextAlign.left : TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: isWide ? 46 : 34,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).colorScheme.onSurface,
                    height: 1.1,
                  ),
                ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.15, end: 0),
                const SizedBox(height: 14),

                SizedBox(
                  height: 34,
                  child: DefaultTextStyle(
                    style: GoogleFonts.inter(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flutter App Developer',
                          speed: const Duration(milliseconds: 90),
                        ),
                        TypewriterAnimatedText(
                          'Android & iOS Developer',
                          speed: const Duration(milliseconds: 90),
                        ),
                      ],
                      repeatForever: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 650),
                  child: Column(
                    crossAxisAlignment: isWide ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    children: [
                      Text(
                        "I specialize in developing high-quality cross-platform mobile applications using Flutter. "
                        "My focus is on creating fast, scalable, and user-friendly applications that provide a seamless "
                        "experience across Android and iOS devices.\n\n"
                        "From business applications and e-commerce platforms to booking systems, ERP solutions, and custom enterprise software, I transform ideas into reliable digital products using modern technologies and industry best practices.\n\n"
                        "\"Creating innovative mobile applications that help businesses grow digitally.\"",
                        textAlign: isWide ? TextAlign.left : TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 15.5,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        alignment: isWide ? WrapAlignment.start : WrapAlignment.center,
                        children: [
                          'Flutter App Development', 'Android & iOS', 'UI/UX Implementation', 'Firebase Integration', 'REST APIs', 'Payment Gateways'
                        ].map((service) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Theme.of(context).colorScheme.outline),
                          ),
                          child: Text(
                            service,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        )).toList(),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms),
                const SizedBox(height: 32),

                Wrap(
                  alignment: isWide
                      ? WrapAlignment.start
                      : WrapAlignment.center,
                  spacing: 14,
                  runSpacing: 14,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'View Projects',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Theme.of(context).colorScheme.onSurface,
                        side:  BorderSide(color: Theme.of(context).colorScheme.outline),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 26,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Get in Touch',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ).animate().fadeIn(delay: 400.ms),
              ],
            );

            final profile =
                AnimatedProfile(
                      imagePath: 'assets/images/profile.jpeg',
                      size: isWide ? 260 : 200,
                    )
                    .animate()
                    .fadeIn(duration: 500.ms)
                    .scale(
                      begin: const Offset(0.85, 0.85),
                      end: const Offset(1, 1),
                    );

            if (isWide) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: textColumn),
                  const SizedBox(width: 40),
                  Expanded(flex: 4, child: Center(child: profile)),
                ],
              );
            }

            return Column(
              children: [profile, const SizedBox(height: 36), textColumn],
            );
          },
        ),
      ),
    );
  }
}

// ---------------- ABOUT ----------------

class _AboutSection extends StatelessWidget {
  const _AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      child: _Bounded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _SectionLabel(text: 'ABOUT ME'),
            const SizedBox(height: 12),
            Text(
              "Hello, I'm Mageshwaran Selvam",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ).animate().fadeIn().slideY(begin: 0.15, end: 0),
            const SizedBox(height: 48),

            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 900;

                final textBlock = ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 560),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "I am a passionate Flutter Developer with extensive experience in designing and developing cross-platform mobile applications. I enjoy solving real-world business problems through technology by building applications that are secure, scalable, and easy to use.\n\n"
                        "Over the years, I have worked on various projects including travel booking systems, taxi applications, franchise management systems, ERP software, healthcare applications, audit management solutions, educational platforms, and e-commerce applications.\n\n"
                        "I continuously learn new technologies to deliver modern, efficient, and high-performance mobile solutions for clients.",
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          height: 1.7,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "What I Believe",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ...['Quality over quantity', 'Clean and maintainable code', 'User-focused design', 'Timely project delivery', 'Continuous learning and improvement']
                          .map((belief) => Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check_circle, size: 16, color: Theme.of(context).colorScheme.primary),
                                    const SizedBox(width: 8),
                                    Text(
                                      belief,
                                      style: GoogleFonts.inter(
                                        fontSize: 14.5,
                                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ],
                  ),
                ).animate().fadeIn(delay: 150.ms);

                final statsGrid = Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  alignment: WrapAlignment.center,
                  children: const [
                    _StatCard(value: '5+', label: 'Production Apps'),
                    _StatCard(value: '3+', label: 'State Mgmt Tools'),
                    _StatCard(value: '100%', label: 'Clean Code Focus'),
                  ],
                );

                if (isWide) {
                  return IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 6, child: textBlock),
                        const SizedBox(width: 40),
                        Expanded(flex: 5, child: statsGrid),
                      ],
                    ),
                  );
                }

                return Column(
                  children: [textBlock, const SizedBox(height: 32), statsGrid],
                );
              },
            ),

            const SizedBox(height: 64),
            const _SkillsGrid(),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
        border: Border.all(color: Theme.of(context).colorScheme.outline),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 26,
              fontWeight: FontWeight.w800,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: 12.5,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 12.5,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).colorScheme.primary,
        letterSpacing: 1.5,
      ),
    );
  }
}

class _SkillsGrid extends StatelessWidget {
  const _SkillsGrid();

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'category': 'Mobile Development',
        'items': ['Flutter', 'Dart', 'Android', 'iOS'],
      },
      {
        'category': 'Backend & Database',
        'items': ['Firebase', 'Firestore', 'MySQL', 'SQLite', 'REST APIs'],
      },
      {
        'category': 'Cloud & Services',
        'items': ['Auth', 'FCM', 'Cloud Storage', 'Maps API'],
      },
      {
        'category': 'Payment Integration',
        'items': ['Razorpay', 'Stripe', 'PayPal'],
      },
      {
        'category': 'Version Control',
        'items': ['Git', 'GitHub', 'GitLab'],
      },
      {
        'category': 'Tools',
        'items': ['Android Studio', 'VS Code', 'Xcode', 'Postman', 'Figma'],
      },
      {
        'category': 'Other Skills',
        'items': ['UI Implementation', 'State Management', 'Responsive Design', 'App Deployment'],
      },
    ];

    return Wrap(
      spacing: 18,
      runSpacing: 18,
      alignment: WrapAlignment.center,
      children: skills.map((skillSet) {
        return Container(
          width: 250,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(AppConstants.borderRadius),
            border: Border.all(color: Theme.of(context).colorScheme.outline),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                skillSet['category'] as String,
                style: GoogleFonts.inter(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: (skillSet['items'] as List<String>)
                    .map(
                      (item) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      }).toList(),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0);
  }
}

// ---------------- PROJECTS ----------------

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Thirukalyanam',
        'desc': 'A comprehensive matrimony application with traditional values and seamless matchmaking.',
        'contributions': <String>['Flutter', 'Firebase'],
        'playStoreUrl': 'https://play.google.com/store/apps/details?id=com.amrithaa.thirukalyanam',
        'image': 'assets/images/pngtree-adorable-cartoon-wedding-couple-traditional-indian-marriage-attire-png-image_15745834.png',
      },
      {
        'title': 'My Mediator',
        'desc': 'An application designed for mediation and dispute resolution services.',
        'contributions': <String>['Flutter', 'State Management'],
        'playStoreUrl': 'https://play.google.com/store/apps/details?id=com.amrithaa.mymediator',
        'image': 'assets/images/HomeBanerimage.png',
      },
      {
        'title': 'Taakshift Customer',
        'desc': 'Customer application for Taakshift to manage services and bookings.',
        'contributions': <String>['Flutter', 'Maps'],
        'playStoreUrl': 'https://play.google.com/store/apps/details?id=com.freshora.taakshiftcustomer',
        'image': null,
      },
      {
        'title': 'Audit Pro',
        'desc': 'Digital audit platform with inspection reports, issue tracking, and PDF generation.',
        'contributions': <String>['Flutter', 'PDF Generation'],
        'playStoreUrl': 'https://play.google.com/store/apps/details?id=com.amrithaa.auditpro',
        'image': 'assets/images/audit-PROlogo-1024x255.png',
      },
      {
        'title': 'Advo Pro',
        'desc': 'Application tailored for advocates to efficiently manage cases and schedules.',
        'contributions': <String>['Flutter', 'Architecture'],
        'playStoreUrl': 'https://play.google.com/store/apps/details?id=com.amrithaa.advopro',
        'image': 'assets/images/advopro.png',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 24),
      child: _Bounded(
        child: Column(
          children: [
            const _SectionLabel(text: 'PORTFOLIO'),
            const SizedBox(height: 12),
            Text(
              "Featured Projects",
              style: GoogleFonts.inter(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ).animate().fadeIn().slideY(begin: 0.15, end: 0),
            const SizedBox(height: 44),
            Wrap(
              alignment: WrapAlignment.center,
              children: projects.map((project) {
                return ProjectCard(
                  title: project['title'] as String,
                  description: project['desc'] as String,
                  keyContributions: project['contributions'] as List<String>?,
                  imageUrl: project['image'] as String?,
                  playStoreUrl: project['playStoreUrl'] as String?,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------- CONTACT ----------------

class _ContactSection extends StatefulWidget {
  const _ContactSection({super.key});

  @override
  State<_ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<_ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _companyController = TextEditingController();
  final _projectTypeController = TextEditingController();
  final _budgetController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    _projectTypeController.dispose();
    _budgetController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  void _sendEnquiry() {
    final name = _nameController.text;
    final email = _emailController.text;
    final phone = _phoneController.text;
    final company = _companyController.text;
    final projectType = _projectTypeController.text;
    final budget = _budgetController.text;
    final message = _messageController.text;

    final body = '''
Name: $name
Email: $email
Phone: $phone
Company: $company
Project Type: $projectType
Budget: $budget

Message:
$message
''';

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'mahimagesh78@gmail.com', // Your email
      queryParameters: {
        'subject': 'New Project Enquiry from $name',
        'body': body,
      },
    );
    _launchUrl(emailLaunchUri.toString().replaceAll('+', '%20'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: _Bounded(
        child: Column(
          children: [
            const _SectionLabel(text: 'GET IN TOUCH'),
            const SizedBox(height: 12),
            Text(
              "Let's Work Together",
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ).animate().fadeIn().slideY(begin: 0.15, end: 0),
            const SizedBox(height: 16),
            Text(
              "Whether you need a mobile application for your startup, business, or enterprise, I'd be happy to help turn your ideas into reality. I'm available for freelance projects, full-time opportunities, and long-term collaborations.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ).animate().fadeIn(delay: 100.ms),
            const SizedBox(height: 60),

            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 850;

                final contactDetails = Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact Information",
                      style: GoogleFonts.inter(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 24),
                    _ContactDetailTile(
                      icon: FontAwesomeIcons.user,
                      title: 'Name',
                      subtitle: 'Mageshwaran Selvam',
                    ),
                    const SizedBox(height: 20),
                    _ContactDetailTile(
                      icon: FontAwesomeIcons.briefcase,
                      title: 'Role',
                      subtitle: 'Flutter Mobile App Developer',
                    ),
                    const SizedBox(height: 20),
                    _ContactDetailTile(
                      icon: FontAwesomeIcons.envelope,
                      title: 'Email',
                      subtitle: 'mahimagesh78@gmail.com',
                      onTap: () => _launchUrl('mailto:mahimagesh78@gmail.com'),
                    ),
                    const SizedBox(height: 20),
                    _ContactDetailTile(
                      icon: FontAwesomeIcons.phone,
                      title: 'Phone',
                      subtitle: '+91 9488283532',
                      onTap: () => _launchUrl('tel:9488283532'),
                    ),
                    const SizedBox(height: 20),
                    _ContactDetailTile(
                      icon: FontAwesomeIcons.locationDot,
                      title: 'Location',
                      subtitle: 'India',
                    ),
                  ],
                ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1, end: 0);

                final contactForm = Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 8),
                      ),
                    ],
                    border: Border.all(color: Theme.of(context).colorScheme.outline),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Send an Enquiry",
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(child: _CustomTextField(label: 'Full Name', controller: _nameController)),
                          const SizedBox(width: 16),
                          Expanded(child: _CustomTextField(label: 'Email Address', controller: _emailController)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _CustomTextField(label: 'Phone Number', controller: _phoneController)),
                          const SizedBox(width: 16),
                          Expanded(child: _CustomTextField(label: 'Company Name', controller: _companyController)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _CustomTextField(label: 'Project Type', controller: _projectTypeController)),
                          const SizedBox(width: 16),
                          Expanded(child: _CustomTextField(label: 'Budget (Optional)', controller: _budgetController)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _CustomTextField(label: 'Message', maxLines: 5, controller: _messageController),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 54,
                        child: ElevatedButton(
                          onPressed: _sendEnquiry,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.primary,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Send Enquiry',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1, end: 0);

                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 4, child: contactDetails),
                      const SizedBox(width: 60),
                      Expanded(flex: 6, child: contactForm),
                    ],
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    contactDetails,
                    const SizedBox(height: 48),
                    contactForm,
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactDetailTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _ContactDetailTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      hoverColor: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomTextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final TextEditingController? controller;

  const _CustomTextField({
    required this.label,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: GoogleFonts.inter(
        fontSize: 15,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.inter(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
          fontSize: 14,
        ),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

// ---------------- FOOTER ----------------

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
        border: Border(top: BorderSide(color: Theme.of(context).colorScheme.outline)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            children: [
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 40,
                runSpacing: 40,
                children: [
                  // Brand
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Mageshwaran Selvam",
                          style: GoogleFonts.inter(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Flutter Mobile App Developer building modern and scalable applications.",
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Quick Links
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Quick Links",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...['Home', 'About', 'Skills', 'Projects', 'Contact'].map((link) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            link,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                  // Follow Me
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Follow Me",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...[
                        {'name': 'LinkedIn', 'icon': FontAwesomeIcons.linkedin},
                        {'name': 'GitHub', 'icon': FontAwesomeIcons.github},
                        {'name': 'Instagram', 'icon': FontAwesomeIcons.instagram},
                      ].map((social) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(social['icon'] as IconData, size: 16, color: Theme.of(context).colorScheme.primary),
                              const SizedBox(width: 8),
                              Text(
                                social['name'] as String,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Divider(color: Theme.of(context).colorScheme.outline),
              const SizedBox(height: 24),
              Text(
                "© 2026 Mageshwaran Selvam. All rights reserved.",
                style: GoogleFonts.inter(fontSize: 13, color: Theme.of(context).colorScheme.onSurfaceVariant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
