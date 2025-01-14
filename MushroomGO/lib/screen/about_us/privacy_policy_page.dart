import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/about_us_theme.dart';

class PrivacyPolicyPage extends StatefulWidget {
  final AboutUsTheme? theme;

  const PrivacyPolicyPage({super.key, this.theme});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  late AboutUsTheme theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    theme = (widget.theme ?? Theme.of(context).extension<AboutUsTheme>())!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: theme.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: theme.titleStyle,
            ),
            SizedBox(height: theme.defaultSpace),
            Text(
              "Last updated: January 20, 2025",
              style: theme.lastUpdateStyle,
            ),
            SizedBox(height: theme.defaultSpace),
            _buildSection("Introduction",
                "Mushroom Go respects your privacy and is committed to protecting your personal data. This Privacy Policy explains how we collect, use, and disclose information about you when you use our application."),
            _buildSection("Information We Collect",
                "1. Personal Data: We may collect personal information such as your name, email address, and location when you create an account or use the app.\n"
                    "2. Usage Data: We collect information about how you interact with the app, including the features you use and the time spent on the app."),
            _buildSection("How We Use Your Information",
                "1. To provide and improve the app's functionality.\n"
                    "2. To send updates and notifications.\n"
                    "3. To ensure the app complies with legal obligations."),
            _buildSection("Your Rights",
                "You have the right to access, modify, or delete your personal data. Please contact us at support@mushroomgo.com for any requests."),
            _buildSection("Contact Us",
                "If you have any questions about this Privacy Policy, contact us at support@mushroomgo.com."),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.titleSectionStyle,
        ),
        SizedBox(height: theme.smallSpace),
        Text(
          content,
          style: theme.sectionTextStyle,
        ),
        SizedBox(height: theme.defaultSpace),
      ],
    );
  }
}
