import 'dart:math' as math;

import 'package:flutter/material.dart';

void main() {
  runApp(const LandaMortApp());
}

class AppColors {
  static const green = Color(0xFF08783F);
  static const greenDark = Color(0xFF045C31);
  static const greenSoft = Color(0xFFEAF8EF);
  static const blue = Color(0xFF1248B8);
  static const blueSoft = Color(0xFFEAF2FF);
  static const navy = Color(0xFF082B57);
  static const ink = Color(0xFF142033);
  static const muted = Color(0xFF667085);
  static const border = Color(0xFFE5EAF0);
  static const page = Color(0xFFF7FAFC);
  static const warning = Color(0xFFF59E0B);
  static const danger = Color(0xFFD92D20);
}

class LandaMortApp extends StatelessWidget {
  const LandaMortApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.green,
      brightness: Brightness.light,
    ).copyWith(
      primary: AppColors.green,
      secondary: AppColors.blue,
      surface: Colors.white,
      error: AppColors.danger,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LandaMort',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: AppColors.page,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.ink,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: AppColors.green, width: 1.5),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.green,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.greenDark,
            side: const BorderSide(color: AppColors.green),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

class PropertyItem {
  final String title;
  final String location;
  final String type;
  final String size;
  final int price;
  final bool verified;
  final String owner;
  final String description;
  final IconData icon;

  const PropertyItem({
    required this.title,
    required this.location,
    required this.type,
    required this.size,
    required this.price,
    required this.verified,
    required this.owner,
    required this.description,
    required this.icon,
  });
}

const demoProperties = <PropertyItem>[
  PropertyItem(
    title: '১০ কাঠা আবাসিক জমি',
    location: 'উত্তরা, ঢাকা',
    type: 'জমি',
    size: '১০ কাঠা',
    price: 12000000,
    verified: true,
    owner: 'Rahim Uddin',
    description: 'প্রধান সড়কের কাছে, আবাসিক ব্যবহারের উপযোগী ডেমো লিস্টিং।',
    icon: Icons.landscape_rounded,
  ),
  PropertyItem(
    title: '৫ কাঠা প্লট',
    location: 'পূর্বাচল, ঢাকা',
    type: 'প্লট',
    size: '৫ কাঠা',
    price: 6500000,
    verified: true,
    owner: 'Sadia Karim',
    description: 'পরিকল্পিত এলাকায় ডেমো প্লট, রেকর্ড স্ট্যাটাস নমুনা হিসেবে দেখানো।',
    icon: Icons.grid_view_rounded,
  ),
  PropertyItem(
    title: '৩ বিঘা কৃষি জমি',
    location: 'সাভার, ঢাকা',
    type: 'কৃষি',
    size: '৩ বিঘা',
    price: 7800000,
    verified: false,
    owner: 'Mehedi Hasan',
    description: 'কৃষি ব্যবহারের জন্য প্রদর্শনী ডেটা। লাইভ যাচাই সংযুক্ত নয়।',
    icon: Icons.grass_rounded,
  ),
  PropertyItem(
    title: 'কমার্শিয়াল ফ্লোর ইউনিট',
    location: 'গুলশান, ঢাকা',
    type: 'কমার্শিয়াল',
    size: '১,২০০ sq ft',
    price: 18500000,
    verified: true,
    owner: 'Nusrat Jahan',
    description: 'ব্যবসায়িক সম্পত্তির ডেমো লিস্টিং ও ইনভেস্টমেন্ট উদাহরণ।',
    icon: Icons.apartment_rounded,
  ),
];

String money(int amount) {
  final s = amount.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buffer.write(',');
    buffer.write(s[i]);
  }
  return '৳$buffer';
}

void openPage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool signUp = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void continueToApp() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const AppShell()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.green.withOpacity(.08),
                          blurRadius: 28,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/landamort_logo.png',
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(
                        Icons.home_work_rounded,
                        color: AppColors.green,
                        size: 84,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Smart Property Network',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: AppColors.navy,
                      letterSpacing: -.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Search • Verify • Buy & Sell • AI • Invest',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.5,
                      color: AppColors.muted,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4F8),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: _AuthTab(
                            label: 'Sign In',
                            selected: !signUp,
                            onTap: () => setState(() => signUp = false),
                          ),
                        ),
                        Expanded(
                          child: _AuthTab(
                            label: 'Sign Up',
                            selected: signUp,
                            onTap: () => setState(() => signUp = true),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.border),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.04),
                          blurRadius: 24,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          signUp ? 'Create your account' : 'Welcome back',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: AppColors.navy,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          signUp
                              ? 'LandaMort ব্যবহার করতে আপনার তথ্য দিন।'
                              : 'আপনার account-এ login করুন।',
                          style: const TextStyle(
                            color: AppColors.muted,
                            fontSize: 13.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        if (signUp) ...[
                          TextField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              labelText: 'Full Name',
                              hintText: 'আপনার নাম',
                              prefixIcon: Icon(Icons.person_outline_rounded),
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: const InputDecoration(
                            labelText: 'Email / Phone',
                            hintText: 'name@email.com',
                            prefixIcon: Icon(Icons.alternate_email_rounded),
                          ),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          controller: passwordController,
                          obscureText: obscurePassword,
                          textInputAction: signUp
                              ? TextInputAction.next
                              : TextInputAction.done,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline_rounded),
                            suffixIcon: IconButton(
                              onPressed: () => setState(
                                () => obscurePassword = !obscurePassword,
                              ),
                              icon: Icon(
                                obscurePassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                              ),
                            ),
                          ),
                        ),
                        if (signUp) ...[
                          const SizedBox(height: 12),
                          TextField(
                            controller: confirmPasswordController,
                            obscureText: obscureConfirmPassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: const Icon(Icons.lock_reset_rounded),
                              suffixIcon: IconButton(
                                onPressed: () => setState(
                                  () => obscureConfirmPassword =
                                      !obscureConfirmPassword,
                                ),
                                icon: Icon(
                                  obscureConfirmPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                ),
                              ),
                            ),
                          ),
                        ],
                        if (!signUp) ...[
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Password reset option backend phase-এ connect হবে।',
                                  ),
                                ),
                              ),
                              child: const Text('Forgot password?'),
                            ),
                          ),
                        ] else
                          const SizedBox(height: 18),
                        SizedBox(
                          width: double.infinity,
                          child: FilledButton.icon(
                            onPressed: continueToApp,
                            icon: Icon(
                              signUp
                                  ? Icons.person_add_alt_1_rounded
                                  : Icons.login_rounded,
                            ),
                            label: Text(
                              signUp ? 'Create Account' : 'Sign In',
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              signUp
                                  ? 'Already have an account? '
                                  : 'New to LandaMort? ',
                              style: const TextStyle(color: AppColors.muted),
                            ),
                            TextButton(
                              onPressed: () => setState(() => signUp = !signUp),
                              child: Text(signUp ? 'Sign In' : 'Sign Up'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Secure land access • Clear information • Smarter decisions',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AuthTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _AuthTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: selected ? AppColors.greenDark : AppColors.muted,
            ),
          ),
        ),
      ),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> with SingleTickerProviderStateMixin {
  int index = 0;
  late final AnimationController _aiBob;

  final pages = const [
    HomeScreen(),
    VerifyHubScreen(),
    MarketplaceScreen(),
    InvestScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _aiBob = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))..repeat(reverse: true);
  }

  @override
  void dispose() {
    _aiBob.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: AnimatedBuilder(
        animation: _aiBob,
        builder: (context, child) => Transform.translate(
          offset: Offset(0, math.sin(_aiBob.value * math.pi * 2) * 4),
          child: child,
        ),
        child: FloatingAiButton(onTap: () => openPage(context, const AiAssistantScreen())),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'হোম'),
          NavigationDestination(icon: Icon(Icons.verified_user_outlined), selectedIcon: Icon(Icons.verified_user_rounded), label: 'ভেরিফাই'),
          NavigationDestination(icon: Icon(Icons.storefront_outlined), selectedIcon: Icon(Icons.storefront_rounded), label: 'মার্কেট'),
          NavigationDestination(icon: Icon(Icons.trending_up_rounded), selectedIcon: Icon(Icons.show_chart_rounded), label: 'ইনভেস্ট'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LandaMortAppBar(
        title: 'LandaMort',
        actions: [
          IconButton(
            onPressed: () => openPage(context, const NotificationsScreen()),
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeroPanel(),
                const SizedBox(height: 24),
                const SectionTitle(title: 'Verification & Smart Services', subtitle: 'এক জায়গায় রেকর্ড, মালিকানা, মিউটেশন ও প্রি-চেক'),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final count = width > 1000 ? 4 : width > 650 ? 2 : 1;
                    final ratio = width > 1000 ? 1.04 : width > 650 ? 1.08 : 1.28;
                    final cards = [
                      FeatureCard(
                        icon: Icons.manage_search_rounded,
                        title: 'Digital Record & Search',
                        subtitle: 'খতিয়ান, দাগ, মৌজা দিয়ে স্মার্ট সার্চ',
                        color: AppColors.green,
                        onTap: () => openPage(context, const RecordSearchScreen()),
                      ),
                      FeatureCard(
                        icon: Icons.shield_outlined,
                        title: 'Ownership & Fraud Check',
                        subtitle: 'ডকুমেন্ট, মালিকানা ও risk signal cross-check',
                        color: AppColors.blue,
                        onTap: () => openPage(context, const OwnershipVerificationScreen()),
                      ),
                      FeatureCard(
                        icon: Icons.sync_alt_rounded,
                        title: 'Smart e-Mutation',
                        subtitle: 'ধাপ, ডকুমেন্ট ও status guidance',
                        color: AppColors.greenDark,
                        onTap: () => openPage(context, const MutationScreen()),
                      ),
                      FeatureCard(
                        icon: Icons.fact_check_outlined,
                        title: 'Citizen Pre-Check',
                        subtitle: 'কেনার আগে প্রয়োজনীয় checklist',
                        color: AppColors.blue,
                        onTap: () => openPage(context, const CitizenCheckScreen()),
                      ),
                    ];
                    return GridView.builder(
                      itemCount: cards.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 14,
                        childAspectRatio: ratio,
                      ),
                      itemBuilder: (_, i) => cards[i],
                    );
                  },
                ),
                const SizedBox(height: 24),
                const SectionTitle(title: 'LandaMort Ecosystem', subtitle: 'Buy & Sell, AI guidance এবং Invest module'),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final wide = constraints.maxWidth > 900;
                    final items = [
                      WideActionCard(
                        icon: Icons.storefront_rounded,
                        title: 'Buy & Sell Marketplace',
                        subtitle: 'লোকেশন, বাজেট ও verified-style property listing দেখুন',
                        color: AppColors.blue,
                        buttonText: 'মার্কেটপ্লেস দেখুন',
                        onTap: () => openPage(context, const MarketplaceScreen()),
                      ),
                      WideActionCard(
                        icon: Icons.smart_toy_rounded,
                        title: 'LandaMort AI',
                        subtitle: 'ভূমি-সম্পর্কিত প্রশ্নের সহজ ভাষার smart guide',
                        color: AppColors.green,
                        buttonText: 'AI খুলুন',
                        onTap: () => openPage(context, const AiAssistantScreen()),
                      ),
                      WideActionCard(
                        icon: Icons.show_chart_rounded,
                        title: 'LandaMort Invest',
                        subtitle: 'Fractional property investment concept dashboard',
                        color: AppColors.blue,
                        buttonText: 'ইনভেস্ট দেখুন',
                        onTap: () => openPage(context, const InvestScreen()),
                      ),
                    ];
                    if (wide) {
                      return Row(
                        children: [
                          for (int i = 0; i < items.length; i++) ...[
                            Expanded(child: items[i]),
                            if (i != items.length - 1) const SizedBox(width: 14),
                          ],
                        ],
                      );
                    }
                    return Column(
                      children: [
                        for (int i = 0; i < items.length; i++) ...[
                          items[i],
                          if (i != items.length - 1) const SizedBox(height: 12),
                        ],
                      ],
                    );
                  },
                ),
                const SizedBox(height: 24),
                const SourceStrip(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VerifyHubScreen extends StatelessWidget {
  const VerifyHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Verification & Smart Services'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFEAF8EF), Color(0xFFF4F8FF)]),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Verification Hub', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.navy)),
                            SizedBox(height: 6),
                            Text('Input → Digitize → Match → Assess → Profile → Action', style: TextStyle(color: AppColors.muted)),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.verified_user_rounded, size: 58, color: AppColors.green),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const SectionTitle(title: 'চারটি মূল সেবা', subtitle: 'আপনার verification journey এখান থেকেই শুরু'),
                const SizedBox(height: 12),
                ServiceFlowCard(
                  number: '1',
                  title: 'Digital Record & Search',
                  badge: 'P1 Solution',
                  steps: const ['রেকর্ড ইনপুট', 'Bangla OCR', 'খতিয়ান/দাগ সার্চ', 'ফলাফল ও প্রোফাইল'],
                  onTap: () => openPage(context, const RecordSearchScreen()),
                ),
                ServiceFlowCard(
                  number: '2',
                  title: 'Ownership Verification & Fraud Check',
                  badge: 'P2 + P3',
                  steps: const ['ডকুমেন্ট', 'তথ্য ম্যাচিং', 'মালিকানা ক্রস-চেক', 'রিস্ক স্ট্যাটাস'],
                  color: AppColors.blue,
                  onTap: () => openPage(context, const OwnershipVerificationScreen()),
                ),
                ServiceFlowCard(
                  number: '3',
                  title: 'Smart e-Mutation Workflow',
                  badge: 'P4 Solution',
                  steps: const ['আবেদন', 'ডকুমেন্ট চেক', 'স্ট্যাটাস ট্র্যাকিং', 'পরবর্তী ধাপ'],
                  onTap: () => openPage(context, const MutationScreen()),
                ),
                ServiceFlowCard(
                  number: '4',
                  title: 'Citizen Pre-Check & Open Ecosystem',
                  badge: 'P5 + P6',
                  steps: const ['প্রি-চেক', 'আইডি/মালিকানা', 'ঝুঁকি/মামলা', 'সেবা লিংক'],
                  color: AppColors.blue,
                  onTap: () => openPage(context, const CitizenCheckScreen()),
                ),
                const SourceStrip(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecordSearchScreen extends StatefulWidget {
  const RecordSearchScreen({super.key});

  @override
  State<RecordSearchScreen> createState() => _RecordSearchScreenState();
}

class _RecordSearchScreenState extends State<RecordSearchScreen> {
  String division = 'ঢাকা';
  String district = 'ঢাকা';
  String upazila = 'সাভার';
  String mouza = 'বিরুলিয়া';
  final khatian = TextEditingController(text: '৫৬৭');
  final dag = TextEditingController(text: '১২০৪');
  bool searched = false;

  @override
  void dispose() {
    khatian.dispose();
    dag.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Digital Record & Search', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                    const SizedBox(height: 16),
          const StepHeader(
            icon: Icons.manage_search_rounded,
            title: 'জমির রেকর্ড খুঁজুন',
            subtitle: 'খতিয়ান, দাগ, মৌজা বা লোকেশন তথ্য দিয়ে সার্চ করুন।',
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _dropdown('বিভাগ', division, const ['ঢাকা', 'চট্টগ্রাম', 'রাজশাহী'], (v) => setState(() => division = v))),
                    const SizedBox(width: 10),
                    Expanded(child: _dropdown('জেলা', district, const ['ঢাকা', 'গাজীপুর', 'নারায়ণগঞ্জ'], (v) => setState(() => district = v))),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: _dropdown('উপজেলা', upazila, const ['সাভার', 'কেরানীগঞ্জ', 'ধামরাই'], (v) => setState(() => upazila = v))),
                    const SizedBox(width: 10),
                    Expanded(child: _dropdown('মৌজা', mouza, const ['বিরুলিয়া', 'আমিনবাজার', 'আশুলিয়া'], (v) => setState(() => mouza = v))),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(controller: khatian, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'খতিয়ান নম্বর')),
                const SizedBox(height: 10),
                TextField(controller: dag, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'দাগ নম্বর')),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => setState(() => searched = true),
                    icon: const Icon(Icons.search_rounded),
                    label: const Text('রেকর্ড খুঁজুন'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Row(
              children: [
                const Icon(Icons.document_scanner_outlined, color: AppColors.blue, size: 32),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('পুরোনো কাগজ স্ক্যান / OCR', style: TextStyle(fontWeight: FontWeight.w800)),
                      SizedBox(height: 4),
                      Text('ফাইল আপলোড ও OCR flow এখানে প্রস্তুত আছে।', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
                    ],
                  ),
                ),
                OutlinedButton(onPressed: () => _demoToast(context, 'ডকুমেন্ট আপলোড UI প্রস্তুত। OCR integration পরে যুক্ত করা যাবে।'), child: const Text('আপলোড')),
              ],
            ),
          ),
          if (searched) ...[
            const SizedBox(height: 16),
            const SearchResultCard(),
          ],
        ],
      ),
    );
  }

  Widget _dropdown(String label, String value, List<String> items, ValueChanged<String> onChanged) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(labelText: label),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

class SearchResultCard extends StatelessWidget {
  const SearchResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.green.withOpacity(.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: AppColors.greenSoft, borderRadius: BorderRadius.circular(14)),
                child: const Icon(Icons.description_outlined, color: AppColors.green),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ডেমো রেকর্ড পাওয়া গেছে', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: AppColors.greenDark)),
                    Text('নমুনা ফলাফল দেখানো হচ্ছে।', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const KeyValue(label: 'খতিয়ান নং', value: '৫৬৭'),
          const KeyValue(label: 'দাগ নং', value: '১২০৪'),
          const KeyValue(label: 'মৌজা', value: 'বিরুলিয়া'),
          const KeyValue(label: 'জেলা', value: 'ঢাকা'),
          const KeyValue(label: 'মালিক', value: 'আব্দুর রহমান (ডেমো)'),
          const KeyValue(label: 'জমির পরিমাণ', value: '৩.২৫ একর'),
          const SizedBox(height: 10),
          const SourceStatusRow(),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: OutlinedButton.icon(onPressed: () => _demoToast(context, 'Map screen backend/map SDK phase-এ যুক্ত হবে।'), icon: const Icon(Icons.map_outlined), label: const Text('ম্যাপে দেখুন'))),
              const SizedBox(width: 10),
              Expanded(child: FilledButton.icon(onPressed: () => _demoToast(context, 'ডেমো PDF download action।'), icon: const Icon(Icons.download_rounded), label: const Text('কপি নিন'))),
            ],
          ),
        ],
      ),
    );
  }
}

class OwnershipVerificationScreen extends StatefulWidget {
  const OwnershipVerificationScreen({super.key});

  @override
  State<OwnershipVerificationScreen> createState() => _OwnershipVerificationScreenState();
}

class _OwnershipVerificationScreenState extends State<OwnershipVerificationScreen> {
  bool uploaded = false;
  bool scanning = false;
  bool result = false;

  Future<void> verify() async {
    if (!uploaded) {
      _demoToast(context, 'প্রথমে ডেমো ডকুমেন্ট নির্বাচন করুন।');
      return;
    }
    setState(() => scanning = true);
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;
    setState(() {
      scanning = false;
      result = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Ownership Verification & Fraud Check', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                    const SizedBox(height: 16),
          const StepHeader(
            icon: Icons.verified_user_rounded,
            title: 'মালিকানা যাচাই ও Fraud Check',
            subtitle: 'ডকুমেন্ট, মালিকানা ও রেকর্ড তথ্য ক্রস-চেকের demo workflow।',
          ),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () => setState(() => uploaded = true),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                    decoration: BoxDecoration(
                      color: uploaded ? AppColors.greenSoft : AppColors.blueSoft,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: uploaded ? AppColors.green : AppColors.blue.withOpacity(.35)),
                    ),
                    child: Column(
                      children: [
                        Icon(uploaded ? Icons.check_circle_rounded : Icons.cloud_upload_outlined, color: uploaded ? AppColors.green : AppColors.blue, size: 44),
                        const SizedBox(height: 8),
                        Text(uploaded ? 'দলিল_demo.pdf নির্বাচিত' : 'দলিল / খতিয়ান / নথি নির্বাচন করুন', style: const TextStyle(fontWeight: FontWeight.w800)),
                        const SizedBox(height: 4),
                        const Text('PDF, JPG, PNG — UI demo', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(decoration: const InputDecoration(labelText: 'QR / দলিল নম্বর (ঐচ্ছিক)', prefixIcon: Icon(Icons.qr_code_scanner_rounded))),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: scanning ? null : verify,
                    icon: scanning
                        ? const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                        : const Icon(Icons.security_rounded),
                    label: Text(scanning ? 'যাচাই চলছে...' : 'ডেমো যাচাই চালান'),
                  ),
                ),
              ],
            ),
          ),
          if (result) ...[
            const SizedBox(height: 16),
            AppCard(
              borderColor: AppColors.green.withOpacity(.35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.task_alt_rounded, color: AppColors.green, size: 32),
                      SizedBox(width: 10),
                      Expanded(child: Text('ডেমো Verification Result', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w900, color: AppColors.greenDark))),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('Live সরকারি API সংযুক্ত হলে status আরও শক্তিশালী হবে।', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
                  const SizedBox(height: 14),
                  const CheckLine(text: 'মালিকের নাম নথির সাথে মিলেছে', status: 'Matched'),
                  const CheckLine(text: 'খতিয়ান ও দাগ নম্বর format valid', status: 'Checked'),
                  const CheckLine(text: 'Duplicate sale indicator পাওয়া যায়নি', status: 'Low demo risk'),
                  const CheckLine(text: 'Government source confirmation', status: 'Not connected', warning: true),
                  const SizedBox(height: 12),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      StatusChip(text: 'Low Risk', icon: Icons.shield_outlined, color: AppColors.green),
                      StatusChip(text: 'Needs official confirmation', icon: Icons.info_outline_rounded, color: AppColors.warning),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class MutationScreen extends StatefulWidget {
  const MutationScreen({super.key});

  @override
  State<MutationScreen> createState() => _MutationScreenState();
}

class _MutationScreenState extends State<MutationScreen> {
  int current = 0;

  final steps = const [
    ('আবেদন তথ্য', 'আবেদনকারী, জমি ও পূর্ব মালিকের তথ্য দিন।', Icons.edit_document),
    ('ডকুমেন্ট চেক', 'দলিল, খতিয়ান, কর/ফি ও প্রয়োজনীয় নথি প্রস্তুত রাখুন।', Icons.fact_check_outlined),
    ('স্ট্যাটাস ট্র্যাকিং', 'আবেদনের অগ্রগতি, শুনানি বা অতিরিক্ত নথির অবস্থা দেখুন।', Icons.schedule_rounded),
    ('পরবর্তী পদক্ষেপ', 'Official e-Mutation service-এ অনুমোদিত পথে এগিয়ে যান।', Icons.account_balance_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Smart e-Mutation Support', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                    const SizedBox(height: 16),
          const StepHeader(icon: Icons.sync_alt_rounded, title: 'নামজারি Workflow', subtitle: 'এই screen official submission নয়; user guidance ও preparation demo।'),
          const SizedBox(height: 16),
          ...List.generate(steps.length, (i) {
            final item = steps[i];
            final done = i < current;
            final active = i == current;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: AppCard(
                borderColor: active ? AppColors.green : AppColors.border,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: done || active ? AppColors.green : const Color(0xFFF2F4F7),
                      foregroundColor: done || active ? Colors.white : AppColors.muted,
                      child: Icon(done ? Icons.check_rounded : item.$3, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${i + 1}. ${item.$1}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(item.$2, style: const TextStyle(color: AppColors.muted)),
                          if (active) ...[
                            const SizedBox(height: 10),
                            FilledButton(
                              onPressed: () => setState(() => current = math.min(current + 1, steps.length - 1)),
                              child: Text(i == steps.length - 1 ? 'Official service link (demo)' : 'পরবর্তী ধাপ'),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          const SourceStrip(),
        ],
      ),
    );
  }
}

class CitizenCheckScreen extends StatefulWidget {
  const CitizenCheckScreen({super.key});

  @override
  State<CitizenCheckScreen> createState() => _CitizenCheckScreenState();
}

class _CitizenCheckScreenState extends State<CitizenCheckScreen> {
  final checks = <String, bool>{
    'খতিয়ান ও দাগ নম্বর মিলিয়ে দেখেছি': true,
    'মালিকানা ইতিহাস পরীক্ষা করেছি': false,
    'নামজারি / mutation status দেখেছি': false,
    'রেজিস্ট্রি/দলিল তথ্য cross-check করেছি': false,
    'জমির লোকেশন ও সীমানা সরেজমিনে দেখেছি': false,
    'মামলা/বিরোধ/ঝুঁকি সম্পর্কে খোঁজ নিয়েছি': false,
  };

  @override
  Widget build(BuildContext context) {
    final done = checks.values.where((e) => e).length;
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Citizen Pre-Check', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                    const SizedBox(height: 16),
          StepHeader(
            icon: Icons.fact_check_rounded,
            title: 'কেনার আগে Pre-Check',
            subtitle: '$done/${checks.length}টি checklist সম্পন্ন',
          ),
          const SizedBox(height: 14),
          LinearProgressIndicator(value: done / checks.length, minHeight: 9, borderRadius: BorderRadius.circular(10)),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              children: checks.keys.map((key) {
                return CheckboxListTile(
                  value: checks[key],
                  onChanged: (v) => setState(() => checks[key] = v ?? false),
                  title: Text(key, style: const TextStyle(fontWeight: FontWeight.w600)),
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),
          AppCard(
            backgroundColor: done == checks.length ? AppColors.greenSoft : const Color(0xFFFFF8E8),
            borderColor: done == checks.length ? AppColors.green.withOpacity(.25) : AppColors.warning.withOpacity(.35),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(done == checks.length ? Icons.check_circle_rounded : Icons.info_rounded, color: done == checks.length ? AppColors.green : AppColors.warning),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    done == checks.length
                        ? 'Checklist পূর্ণ। এরপরও official verification, legal review এবং site inspection প্রয়োজন হতে পারে।'
                        : 'Checklist অসম্পূর্ণ। সিদ্ধান্তের আগে বাকি বিষয়গুলো যাচাই করুন।',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  State<MarketplaceScreen> createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  String filter = 'সব';
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final list = demoProperties.where((p) {
      final matchesFilter = filter == 'সব' || p.type == filter;
      final q = searchController.text.trim().toLowerCase();
      final matchesSearch = q.isEmpty || p.title.toLowerCase().contains(q) || p.location.toLowerCase().contains(q);
      return matchesFilter && matchesSearch;
    }).toList();

    return Scaffold(
      appBar: LandaMortAppBar(
        title: 'Buy & Sell',
        actions: [
          IconButton(onPressed: () => openPage(context, const SellerDashboardScreen()), icon: const Icon(Icons.add_business_outlined), tooltip: 'Seller Dashboard'),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFEAF8EF), Color(0xFFEAF2FF)]),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Property Marketplace', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.navy)),
                            SizedBox(height: 6),
                            Text('লোকেশনভিত্তিক সম্পত্তি খুঁজুন, শর্টলিস্ট করুন এবং seller-এর সাথে যোগাযোগ করুন।', style: TextStyle(color: AppColors.muted, height: 1.45)),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(color: Colors.white.withOpacity(.7), borderRadius: BorderRadius.circular(22)),
                        child: const Icon(Icons.storefront_rounded, size: 50, color: AppColors.blue),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: searchController,
                  onChanged: (_) => setState(() {}),
                  decoration: const InputDecoration(prefixIcon: Icon(Icons.search_rounded), hintText: 'লোকেশন বা property search করুন'),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ['সব', 'জমি', 'প্লট', 'কৃষি', 'কমার্শিয়াল'].map((e) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ChoiceChip(label: Text(e), selected: filter == e, onSelected: (_) => setState(() => filter = e)),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: Text('${list.length}টি listing', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 17))),
                    TextButton.icon(onPressed: () => openPage(context, const SellerDashboardScreen()), icon: const Icon(Icons.add_rounded), label: const Text('Sell Property')),
                  ],
                ),
                const SizedBox(height: 6),
                ...list.map((p) => Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: PropertyCard(property: p),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final PropertyItem property;
  const PropertyCard({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => openPage(context, PropertyDetailScreen(property: property)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PropertyVisual(property: property, height: 170),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(child: Text(property.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900))),
              if (property.verified) const Icon(Icons.verified_rounded, color: AppColors.green, size: 20),
            ],
          ),
          const SizedBox(height: 6),
          Text(property.location, style: const TextStyle(color: AppColors.muted)),
          const SizedBox(height: 9),
          Text(money(property.price), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.blue)),
          const SizedBox(height: 8),
          Wrap(spacing: 6, runSpacing: 6, children: [MiniPill(text: property.type), MiniPill(text: property.size), if (property.verified) const MiniPill(text: 'Verified-style')]),
        ],
      ),
    );
  }
}

class PropertyDetailScreen extends StatelessWidget {
  final PropertyItem property;
  const PropertyDetailScreen({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Property Details', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              PropertyVisual(property: property, height: 240),
              Positioned(top: 14, right: 14, child: IconButton.filledTonal(onPressed: () {}, icon: const Icon(Icons.favorite_border_rounded))),
              Positioned(bottom: 12, left: 12, child: StatusChip(text: property.verified ? 'Verified-style Listing' : 'Review Required', icon: property.verified ? Icons.verified_rounded : Icons.info_outline_rounded, color: property.verified ? AppColors.green : AppColors.blue)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: Text(property.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900, color: AppColors.navy))),
              if (property.verified) const Icon(Icons.verified_rounded, color: AppColors.green),
            ],
          ),
          const SizedBox(height: 6),
          Text('${property.location} • ${property.size}', style: const TextStyle(color: AppColors.muted, fontSize: 15)),
          const SizedBox(height: 10),
          Text(money(property.price), style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.blue)),
          const SizedBox(height: 16),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Property summary', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                const SizedBox(height: 8),
                Text(property.description, style: const TextStyle(height: 1.45)),
                const SizedBox(height: 12),
                KeyValue(label: 'Seller', value: property.owner),
                KeyValue(label: 'Listing status', value: property.verified ? 'Verified-style' : 'Needs review'),
                const KeyValue(label: 'Government verification', value: 'Integration-ready status'),
              ],
            ),
          ),
          const SizedBox(height: 12),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Buyer actions', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17)),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: OutlinedButton.icon(onPressed: () => _showMessageDialog(context, 'Seller Chat', 'Hi, এই property কি এখনো available আছে?\n\nSeller: হ্যাঁ, demo chat active.'), icon: const Icon(Icons.chat_bubble_outline), label: const Text('Chat'))),
                    const SizedBox(width: 10),
                    Expanded(child: OutlinedButton.icon(onPressed: () => _showVisitDialog(context), icon: const Icon(Icons.calendar_month_outlined), label: const Text('Visit'))),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(width: double.infinity, child: FilledButton.icon(onPressed: () => _showOfferDialog(context, property.price), icon: const Icon(Icons.local_offer_outlined), label: const Text('দর প্রস্তাব দিন'))),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const SourceStrip(),
        ],
      ),
    );
  }
}

class SellerDashboardScreen extends StatefulWidget {
  const SellerDashboardScreen({super.key});

  @override
  State<SellerDashboardScreen> createState() => _SellerDashboardScreenState();
}

class _SellerDashboardScreenState extends State<SellerDashboardScreen> {
  final title = TextEditingController();
  final location = TextEditingController();
  final price = TextEditingController();
  bool published = false;

  @override
  void dispose() {
    title.dispose();
    location.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Listing & Seller Dashboard', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
                    const SizedBox(height: 16),
          const StepHeader(icon: Icons.add_business_rounded, title: 'নতুন listing তৈরি করুন', subtitle: 'ছবি, তথ্য, দাম ও verification status দিয়ে demo property publish করুন।'),
          const SizedBox(height: 14),
          AppCard(
            child: Column(
              children: [
                TextField(controller: title, decoration: const InputDecoration(labelText: 'Property title')),
                const SizedBox(height: 10),
                TextField(controller: location, decoration: const InputDecoration(labelText: 'লোকেশন')),
                const SizedBox(height: 10),
                TextField(controller: price, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'দাম (৳)')),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () => _demoToast(context, 'Image picker backend/package phase-এ যুক্ত করুন।'),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(color: AppColors.blueSoft, borderRadius: BorderRadius.circular(16), border: Border.all(color: AppColors.border)),
                    child: const Column(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.add_photo_alternate_outlined, color: AppColors.blue, size: 38), SizedBox(height: 6), Text('ছবি যোগ করুন (demo)')]),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () => setState(() => published = true),
                    icon: const Icon(Icons.publish_rounded),
                    label: const Text('Listing publish করুন'),
                  ),
                ),
              ],
            ),
          ),
          if (published) ...[
            const SizedBox(height: 14),
            AppCard(
              borderColor: AppColors.green.withOpacity(.35),
              backgroundColor: AppColors.greenSoft,
              child: const Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: AppColors.green),
                  SizedBox(width: 10),
                  Expanded(child: Text('Listing draft তৈরি হয়েছে। Backend moderation যুক্ত হলে এটি review queue-তে যাবে।', style: TextStyle(fontWeight: FontWeight.w700))),
                ],
              ),
            ),
          ],
          const SizedBox(height: 14),
          const SectionTitle(title: 'আমার ডেমো listing', subtitle: 'Views, offer ও message mock metrics'),
          const SizedBox(height: 10),
          AppCard(
            child: Column(
              children: const [
                KeyValue(label: '১০ কাঠা জমি — উত্তরা', value: 'Active demo'),
                SizedBox(height: 8),
                Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [MetricMini(value: '1.2K', label: 'Views'), MetricMini(value: '45', label: 'Offers'), MetricMini(value: '12', label: 'Messages')]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AiAssistantScreen extends StatefulWidget {
  const AiAssistantScreen({super.key});

  @override
  State<AiAssistantScreen> createState() => _AiAssistantScreenState();
}

class _AiAssistantScreenState extends State<AiAssistantScreen> {
  final controller = TextEditingController();
  final messages = <ChatMessage>[
    const ChatMessage(
      text: 'আমি LandaMort AI। খতিয়ান, দাগ, মালিকানা, নামজারি বা জমি কেনার আগে কী দেখবেন—এসব বিষয়ে সাধারণ গাইড দিতে পারি।',
      user: false,
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void send([String? preset]) {
    final q = (preset ?? controller.text).trim();
    if (q.isEmpty) return;
    setState(() {
      messages.add(ChatMessage(text: q, user: true));
      messages.add(ChatMessage(text: answerFor(q), user: false));
      controller.clear();
    });
  }

  String answerFor(String q) {
    final s = q.toLowerCase();
    if (s.contains('মালিকানা') || s.contains('ownership')) {
      return 'মালিকানা যাচাইয়ের আগে সাধারণভাবে ১) খতিয়ান ও দাগ মিলান, ২) দলিলের seller name ও record owner মিলান, ৩) mutation/registration history দেখুন, ৪) বিরোধ বা duplicate claim আছে কি না দেখুন।';
    }
    if (s.contains('নামজারি') || s.contains('mutation')) {
      return 'নামজারির জন্য প্রয়োজনীয় নথি প্রস্তুত, আবেদন তথ্য, status tracking ও official service-এ যাওয়ার ধাপ LandaMort guide করতে পারে।';
    }
    if (s.contains('কিন') || s.contains('buy')) {
      return 'কেনার আগে record, ownership, mutation, location, seller documents এবং known risk indicators check করুন। কোনো source verify না হলে তাকে verified হিসেবে ধরা উচিত নয়।';
    }
    if (s.contains('খতিয়ান') || s.contains('দাগ')) {
      return 'Digital Record & Search screen-এ division, district, upazila, mouza, khatian ও dag দিয়ে search UI আছে। পরে authorized integration হলে real data ব্যবহার করা যাবে।';
    }
    if (s.contains('invest') || s.contains('ইনভেস্ট')) {
      return 'LandaMort Invest একটি future regulated concept। Real-money fractional property investment চালুর আগে আইনগত অনুমোদন, KYC/AML এবং consumer protection প্রয়োজন।';
    }
    return 'আমি LandaMort AI — land-service guidance, basic verification checklist এবং next-step বুঝতে সাহায্য করতে পারি।';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'LandaMort AI'),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 10, 16, 6),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFFEAF8EF), Color(0xFFEAF2FF)]),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Container(
                  width: 58,
                  height: 58,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)),
                  child: Image.asset('assets/images/landamort_logo.png', fit: BoxFit.contain),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ask LandaMort AI', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: AppColors.navy)),
                      SizedBox(height: 4),
                      Text('আপনার ভূমি প্রশ্নের smart সহকারী', style: TextStyle(color: AppColors.muted)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 46,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              children: [
                SuggestionChip(text: 'মালিকানা যাচাই কীভাবে করব?', onTap: send),
                SuggestionChip(text: 'নামজারির ধাপ কী?', onTap: send),
                SuggestionChip(text: 'জমি কেনার আগে কী দেখব?', onTap: send),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
              itemCount: messages.length,
              itemBuilder: (_, i) => ChatBubble(message: messages[i]),
            ),
          ),
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: AppColors.border))),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      onSubmitted: (_) => send(),
                      decoration: const InputDecoration(hintText: 'এখানে আপনার প্রশ্ন লিখুন...', prefixIcon: Icon(Icons.chat_bubble_outline_rounded)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(onPressed: send, icon: const Icon(Icons.send_rounded)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool user;
  const ChatMessage({required this.text, required this.user});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;
  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.user ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 520),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          color: message.user ? AppColors.blueSoft : AppColors.greenSoft,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft: Radius.circular(message.user ? 18 : 4),
            bottomRight: Radius.circular(message.user ? 4 : 18),
          ),
          border: Border.all(color: AppColors.border),
        ),
        child: Text(message.text, style: const TextStyle(height: 1.45)),
      ),
    );
  }
}

class SuggestionChip extends StatelessWidget {
  final String text;
  final void Function([String?]) onTap;
  const SuggestionChip({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(label: Text(text), onPressed: () => onTap(text)),
    );
  }
}

class InvestScreen extends StatefulWidget {
  const InvestScreen({super.key});

  @override
  State<InvestScreen> createState() => _InvestScreenState();
}

class _InvestScreenState extends State<InvestScreen> {
  int invested = 125000;
  double returnPct = 12.5;

  void buyShare(String name, int minAmount) {
    final controller = TextEditingController(text: minAmount.toString());
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('$name — Buy Share'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enter your preferred amount.'),
            const SizedBox(height: 12),
            TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'Amount (৳)')),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          FilledButton(
            onPressed: () {
              final amount = int.tryParse(controller.text) ?? minAmount;
              setState(() => invested += amount);
              Navigator.pop(context);
              _demoToast(this.context, 'Portfolio updated successfully.');
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'LandaMort Invest'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 110),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFFEAF8EF), Color(0xFFEAF2FF)]),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: const Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('LandaMort Invest', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, color: AppColors.navy)),
                            SizedBox(height: 6),
                            Text('ছোট অঙ্ক থেকে property-share style investment dashboard', style: TextStyle(color: AppColors.muted)),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.show_chart_rounded, size: 56, color: AppColors.blue),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Portfolio', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: PortfolioMetric(label: 'Total Invested', value: money(invested))),
                    Container(height: 48, width: 1, color: AppColors.border),
                    Expanded(child: PortfolioMetric(label: 'Return', value: '+${returnPct.toStringAsFixed(1)}%', valueColor: AppColors.green)),
                  ],
                ),
                const SizedBox(height: 18),
                SizedBox(height: 150, width: double.infinity, child: CustomPaint(painter: TrendPainter())),
                const SizedBox(height: 4),
                const Align(alignment: Alignment.centerRight, child: Text('Illustrative trend only', style: TextStyle(color: AppColors.muted, fontSize: 11.5))),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const SectionTitle(title: 'Property Shares', subtitle: '৳500 থেকে শুরু করার investment flow'),
          const SizedBox(height: 10),
          ShareCard(name: 'Dhaka Apartment Project', location: 'Uttara, Dhaka', minAmount: 500, icon: Icons.apartment_rounded, onBuy: buyShare),
          ShareCard(name: 'Commercial Hub', location: 'Gulshan, Dhaka', minAmount: 5000, icon: Icons.business_rounded, onBuy: buyShare),
          ShareCard(name: 'Smart Land Plot', location: 'Purbachal, Dhaka', minAmount: 50000, icon: Icons.landscape_rounded, onBuy: buyShare),
                const SizedBox(height: 8),
                const ComplianceBanner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShareCard extends StatelessWidget {
  final String name;
  final String location;
  final int minAmount;
  final IconData icon;
  final void Function(String, int) onBuy;

  const ShareCard({super.key, required this.name, required this.location, required this.minAmount, required this.icon, required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        child: Row(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(color: AppColors.greenSoft, borderRadius: BorderRadius.circular(16)),
              child: Icon(icon, color: AppColors.greenDark, size: 34),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
                  const SizedBox(height: 2),
                  Text(location, style: const TextStyle(color: AppColors.muted, fontSize: 12.5)),
                  const SizedBox(height: 4),
                  Text('Starts from ${money(minAmount)}', style: const TextStyle(color: AppColors.blue, fontWeight: FontWeight.w800)),
                ],
              ),
            ),
            FilledButton(onPressed: () => onBuy(name, minAmount), child: const Text('Buy')),
          ],
        ),
      ),
    );
  }
}

class TrendPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final gridPaint = Paint()..color = const Color(0xFFE9EEF5)..strokeWidth = 1;
    for (var i = 1; i < 4; i++) {
      final y = size.height * i / 4;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    final points = <double>[.72, .66, .61, .64, .54, .49, .56, .43, .37, .44, .31, .27, .20];
    final path = Path();
    for (var i = 0; i < points.length; i++) {
      final x = size.width * i / (points.length - 1);
      final y = size.height * points[i];
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    final paint = Paint()
      ..color = AppColors.green
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawPath(path, paint);

    final fill = Path.from(path)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    final fillPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0x5533B76E), Color(0x0033B76E)],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawPath(fill, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LandaMortAppBar(title: 'Notifications', showBack: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(icon: Icons.verified_outlined, title: 'Verification update', subtitle: 'আপনার demo verification report প্রস্তুত।'),
          NotificationTile(icon: Icons.calendar_month_outlined, title: 'Visit reminder', subtitle: '২০ অক্টোবর সকাল ১১:০০ — demo booking.'),
          NotificationTile(icon: Icons.chat_bubble_outline, title: 'New seller message', subtitle: 'Seller আপনার offer সম্পর্কে reply করেছেন।'),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const NotificationTile({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AppCard(
        child: Row(
          children: [
            CircleAvatar(backgroundColor: AppColors.blueSoft, child: Icon(icon, color: AppColors.blue)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: AppColors.muted))])),
          ],
        ),
      ),
    );
  }
}

class LandaMortAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBack;
  final List<Widget>? actions;
  const LandaMortAppBar({super.key, required this.title, this.showBack = false, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: showBack ? IconButton(onPressed: () => Navigator.maybePop(context), icon: const Icon(Icons.arrow_back_rounded)) : null,
      titleSpacing: showBack ? 0 : 16,
      title: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(.03), blurRadius: 10, offset: const Offset(0, 4))],
            ),
            child: Image.asset(
              'assets/images/landamort_logo.png',
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => const Icon(Icons.home_work_rounded, color: AppColors.green, size: 24),
            ),
          ),
          const SizedBox(width: 10),
          Flexible(child: Text(title, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.navy, fontSize: 20))),
        ],
      ),
      actions: actions,
    );
  }
}

class HeroPanel extends StatelessWidget {
  const HeroPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFFE7F8ED), Color(0xFFEAF2FF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.border),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth > 880;
          final left = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  MiniPill(text: 'SEARCH', color: AppColors.green),
                  MiniPill(text: 'VERIFY', color: AppColors.blue),
                  MiniPill(text: 'BUY & SELL', color: AppColors.green),
                  MiniPill(text: 'INVEST', color: AppColors.blue),
                ],
              ),
              const SizedBox(height: 16),
              const Text('একটি verified land profile, অনেক useful service.', style: TextStyle(fontSize: 33, fontWeight: FontWeight.w900, color: AppColors.navy, height: 1.15)),
              const SizedBox(height: 10),
              const Text('পুরোনো রেকর্ড খোঁজা, মালিকানা যাচাই, marketplace, AI guidance এবং future investment workflow—সব এক ecosystem-এ।', style: TextStyle(color: AppColors.muted, height: 1.6, fontSize: 15)),
              const SizedBox(height: 18),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  FilledButton.icon(onPressed: () => openPage(context, const RecordSearchScreen()), icon: const Icon(Icons.search_rounded), label: const Text('রেকর্ড সার্চ শুরু করুন')),
                  OutlinedButton.icon(onPressed: () => openPage(context, const MarketplaceScreen()), icon: const Icon(Icons.storefront_rounded), label: const Text('মার্কেটপ্লেস দেখুন')),
                ],
              ),
            ],
          );
          final visual = Container(
            constraints: const BoxConstraints(maxWidth: 360),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.7),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [BoxShadow(color: AppColors.green.withOpacity(.08), blurRadius: 24, offset: const Offset(0, 10))],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text('LandaMort', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900, color: AppColors.greenDark))),
                    Image.asset('assets/images/landamort_logo.png', width: 52, height: 52, fit: BoxFit.contain),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(colors: [Color(0xFFD8F3E2), Color(0xFFDCEBFF)]),
                  ),
                  child: Stack(
                    children: [
                      Positioned(left: 16, bottom: 16, child: _HeroStatCard(icon: Icons.verified_rounded, title: 'Ownership', subtitle: 'Cross-check')),
                      Positioned(right: 16, top: 16, child: _HeroStatCard(icon: Icons.map_rounded, title: 'Record', subtitle: 'Search')),
                      const Center(child: Icon(Icons.phone_iphone_rounded, size: 88, color: AppColors.blue)),
                    ],
                  ),
                ),
              ],
            ),
          );
          if (wide) {
            return Row(
              children: [
                Expanded(flex: 6, child: left),
                const SizedBox(width: 20),
                Expanded(flex: 4, child: visual),
              ],
            );
          }
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [left, const SizedBox(height: 16), visual]);
        },
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;
  const FeatureCard({super.key, required this.icon, required this.title, required this.subtitle, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 92,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color.withOpacity(.18), Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(right: 12, top: 10, child: Icon(icon, color: color, size: 38)),
                Positioned(left: 12, bottom: 12, child: Container(width: 56, height: 56, decoration: BoxDecoration(color: color.withOpacity(.12), shape: BoxShape.circle), child: Icon(icon, color: color, size: 28))),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(title, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 16.5, color: AppColors.navy)),
          const SizedBox(height: 6),
          Text(subtitle, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(color: AppColors.muted, fontSize: 12.8, height: 1.45)),
        ],
      ),
    );
  }
}

class WideActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final String buttonText;
  final VoidCallback onTap;
  const WideActionCard({super.key, required this.icon, required this.title, required this.subtitle, required this.color, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [color.withOpacity(.16), Colors.white], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Positioned(left: 16, bottom: 16, child: Container(width: 62, height: 62, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(18)), child: Icon(icon, color: color, size: 36))),
                Positioned(right: 20, top: 18, child: Icon(Icons.auto_awesome_rounded, color: color.withOpacity(.55), size: 28)),
                Positioned(right: 18, bottom: 18, child: MiniPill(text: title.split(' ').first.toUpperCase(), color: color)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
          const SizedBox(height: 6),
          Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 12.8, height: 1.45)),
          const SizedBox(height: 10),
          TextButton.icon(onPressed: onTap, icon: const Icon(Icons.arrow_forward_rounded), label: Text(buttonText)),
        ],
      ),
    );
  }
}

class ServiceFlowCard extends StatelessWidget {
  final String number;
  final String title;
  final String badge;
  final List<String> steps;
  final Color color;
  final VoidCallback onTap;
  const ServiceFlowCard({super.key, required this.number, required this.title, required this.badge, required this.steps, this.color = AppColors.green, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AppCard(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundColor: color, foregroundColor: Colors.white, child: Text(number, style: const TextStyle(fontWeight: FontWeight.w900))),
                const SizedBox(width: 10),
                Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 17, color: AppColors.navy))),
                MiniPill(text: badge, color: color),
              ],
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 6,
              runSpacing: 8,
              children: List.generate(steps.length, (i) => Row(mainAxisSize: MainAxisSize.min, children: [MiniPill(text: steps[i], color: color), if (i != steps.length - 1) Icon(Icons.arrow_forward_rounded, color: color, size: 18)])),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: AppColors.navy)), const SizedBox(height: 3), Text(subtitle, style: const TextStyle(color: AppColors.muted))]);
  }
}

class StepHeader extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const StepHeader({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: AppColors.greenSoft, borderRadius: BorderRadius.circular(14)), child: Icon(icon, color: AppColors.green, size: 28)),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: AppColors.navy)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: AppColors.muted, height: 1.4))])),
      ],
    );
  }
}


class FloatingAiButton extends StatelessWidget {
  final VoidCallback onTap;
  const FloatingAiButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.border),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(.10), blurRadius: 18, offset: const Offset(0, 8))],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 42,
                height: 42,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFFEAF8EF), Color(0xFFEAF2FF)]),
                  borderRadius: BorderRadius.circular(21),
                ),
                child: Image.asset('assets/images/landamort_logo.png', fit: BoxFit.contain),
              ),
              const SizedBox(width: 10),
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('LandaMort AI', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.navy)),
                  Text('Ask now', style: TextStyle(fontSize: 11.5, color: AppColors.muted)),
                ],
              ),
              const SizedBox(width: 8),
              const Icon(Icons.auto_awesome_rounded, color: AppColors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class PropertyVisual extends StatelessWidget {
  final PropertyItem property;
  final double height;
  const PropertyVisual({super.key, required this.property, this.height = 170});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(colors: [Color(0xFFDFF7E8), Color(0xFFDDEBFF)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomPaint(painter: ScenicPainter(color: property.type == 'কমার্শিয়াল' ? AppColors.blue : AppColors.green)),
            ),
            Align(
              alignment: Alignment.center,
              child: Icon(property.icon, size: height * .34, color: property.type == 'কমার্শিয়াল' ? AppColors.blue : AppColors.greenDark),
            ),
            Positioned(
              left: 12,
              top: 12,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.88), borderRadius: BorderRadius.circular(20)),
                child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.location_on_outlined, size: 14, color: AppColors.green), const SizedBox(width: 4), Text(property.location, style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700))]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScenicPainter extends CustomPainter {
  final Color color;
  ScenicPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final sky = Paint()..color = Colors.white.withOpacity(.18);
    canvas.drawCircle(Offset(size.width * .84, size.height * .22), size.height * .16, sky);

    final hill1 = Paint()..color = color.withOpacity(.14);
    final p1 = Path()
      ..moveTo(0, size.height * .78)
      ..quadraticBezierTo(size.width * .22, size.height * .58, size.width * .42, size.height * .74)
      ..quadraticBezierTo(size.width * .66, size.height * .88, size.width, size.height * .62)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(p1, hill1);

    final hill2 = Paint()..color = color.withOpacity(.22);
    final p2 = Path()
      ..moveTo(0, size.height * .88)
      ..quadraticBezierTo(size.width * .30, size.height * .68, size.width * .55, size.height * .85)
      ..quadraticBezierTo(size.width * .78, size.height * .96, size.width, size.height * .76)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(p2, hill2);
  }

  @override
  bool shouldRepaint(covariant ScenicPainter oldDelegate) => oldDelegate.color != color;
}

class _HeroStatCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _HeroStatCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(color: Colors.white.withOpacity(.90), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: AppColors.green),
          const SizedBox(width: 6),
          Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 11.5)), Text(subtitle, style: const TextStyle(color: AppColors.muted, fontSize: 10.5))]),
        ],
      ),
    );
  }
}

class PrototypeBanner extends StatelessWidget {
  const PrototypeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xFFFFF7E6), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFFFD58A))),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.science_outlined, color: AppColors.warning, size: 20),
          SizedBox(width: 8),
          Expanded(child: Text('Prototype mode: sample/synthetic data. Live DLRS, LARMS, e-Mutation বা registry API এখনো connected নয়।', style: TextStyle(fontSize: 12.5, height: 1.35, fontWeight: FontWeight.w600))),
        ],
      ),
    );
  }
}

class ComplianceBanner extends StatelessWidget {
  const ComplianceBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFFFF3F1), borderRadius: BorderRadius.circular(14), border: Border.all(color: const Color(0xFFF8B4AD))),
      child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(Icons.gavel_rounded, color: AppColors.danger, size: 21), SizedBox(width: 8), Expanded(child: Text('Real launch requires applicable legal approval, KYC/AML, payment/custody controls and consumer protection.', style: TextStyle(fontSize: 12.5, height: 1.35, fontWeight: FontWeight.w600)))]),
    );
  }
}

class SourceStrip extends StatelessWidget {
  const SourceStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Integration targets', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
          const SizedBox(height: 10),
          const Wrap(spacing: 8, runSpacing: 8, children: [StatusChip(text: 'DLRS', icon: Icons.account_balance_outlined, color: AppColors.blue), StatusChip(text: 'LARMS', icon: Icons.storage_rounded, color: AppColors.green), StatusChip(text: 'e-Mutation', icon: Icons.sync_alt_rounded, color: AppColors.blue), StatusChip(text: 'Registry-related', icon: Icons.description_outlined, color: AppColors.green)]),
          const SizedBox(height: 9),
          const Text('Connectivity depends on official API access, permission and data-sharing rules.', style: TextStyle(color: AppColors.muted, fontSize: 12.5)),
        ],
      ),
    );
  }
}

class SourceStatusRow extends StatelessWidget {
  const SourceStatusRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(spacing: 8, runSpacing: 8, children: [StatusChip(text: 'User input', icon: Icons.person_outline_rounded, color: AppColors.blue), StatusChip(text: 'Synthetic demo record', icon: Icons.science_outlined, color: AppColors.green), StatusChip(text: 'Govt API: offline', icon: Icons.cloud_off_rounded, color: AppColors.warning)]);
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  const AppCard({super.key, required this.child, this.onTap, this.backgroundColor, this.borderColor});

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor ?? AppColors.border),
        boxShadow: const [BoxShadow(color: Color(0x0A0C2440), blurRadius: 18, offset: Offset(0, 6))],
      ),
      child: child,
    );
    if (onTap == null) return content;
    return InkWell(onTap: onTap, borderRadius: BorderRadius.circular(20), child: content);
  }
}

class KeyValue extends StatelessWidget {
  final String label;
  final String value;
  const KeyValue({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(width: 130, child: Text(label, style: const TextStyle(color: AppColors.muted))), const SizedBox(width: 8), Expanded(child: Text(value, textAlign: TextAlign.right, style: const TextStyle(fontWeight: FontWeight.w700)))]),
    );
  }
}

class CheckLine extends StatelessWidget {
  final String text;
  final String status;
  final bool warning;
  const CheckLine({super.key, required this.text, required this.status, this.warning = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(children: [Icon(warning ? Icons.info_outline_rounded : Icons.check_circle_outline_rounded, color: warning ? AppColors.warning : AppColors.green, size: 21), const SizedBox(width: 8), Expanded(child: Text(text)), Text(status, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: warning ? AppColors.warning : AppColors.greenDark))]),
    );
  }
}

class StatusChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color color;
  const StatusChip({super.key, required this.text, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 7),
      decoration: BoxDecoration(color: color.withOpacity(.09), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withOpacity(.18))),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 15, color: color), const SizedBox(width: 5), Text(text, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: color))]),
    );
  }
}

class MiniPill extends StatelessWidget {
  final String text;
  final Color color;
  const MiniPill({super.key, required this.text, this.color = AppColors.green});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(color: color.withOpacity(.09), borderRadius: BorderRadius.circular(20)),
      child: Text(text, style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w800, color: color)),
    );
  }
}

class PortfolioMetric extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  const PortfolioMetric({super.key, required this.label, required this.value, this.valueColor = AppColors.navy});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 12.5)), const SizedBox(height: 5), Text(value, style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900, color: valueColor))]);
  }
}

class MetricMini extends StatelessWidget {
  final String value;
  final String label;
  const MetricMini({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppColors.blue)), Text(label, style: const TextStyle(color: AppColors.muted, fontSize: 12))]);
  }
}

void _demoToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message), behavior: SnackBarBehavior.floating));
}

void _showMessageDialog(BuildContext context, String title, String message) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(title: Text(title), content: Text(message), actions: [FilledButton(onPressed: () => Navigator.pop(context), child: const Text('ঠিক আছে'))]),
  );
}

void _showVisitDialog(BuildContext context) {
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Visit Booking'),
      content: const Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [Text('তারিখ: ২০ অক্টোবর ২০২৬'), SizedBox(height: 6), Text('সময়: সকাল ১১:০০'), SizedBox(height: 6), Text('লোকেশন: উত্তরা, ঢাকা')]),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')), FilledButton(onPressed: () { Navigator.pop(context); _demoToast(context, 'Visit booking confirmed.'); }, child: const Text('Confirm'))],
    ),
  );
}

void _showOfferDialog(BuildContext context, int askingPrice) {
  final controller = TextEditingController(text: (askingPrice * .92).round().toString());
  showDialog<void>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('দর প্রস্তাব দিন'),
      content: Column(mainAxisSize: MainAxisSize.min, children: [Text('Asking price: ${money(askingPrice)}'), const SizedBox(height: 12), TextField(controller: controller, keyboardType: TextInputType.number, decoration: const InputDecoration(labelText: 'আপনার প্রস্তাব (৳)')), const SizedBox(height: 10), const TextField(maxLines: 2, decoration: InputDecoration(labelText: 'বার্তা (ঐচ্ছিক)'))]),
      actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')), FilledButton(onPressed: () { Navigator.pop(context); _demoToast(context, 'Offer seller-কে পাঠানো হয়েছে।'); }, child: const Text('Offer পাঠান'))],
    ),
  );
}
