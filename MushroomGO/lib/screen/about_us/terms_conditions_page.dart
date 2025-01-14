import 'package:flutter/material.dart';
import 'package:mushroom_go/constant/dimension_constant.dart';
import 'package:mushroom_go/theme/about_us_theme.dart';

class TermsAndConditionsPage extends StatefulWidget {
  final AboutUsTheme? theme;

  const TermsAndConditionsPage({super.key, this.theme});

  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
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
        title: const Text("Terms and Conditions"),
        backgroundColor: theme.backgroundColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(DimensionConstant.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Terms and Conditions",
              style: theme.titleStyle,
            ),
            SizedBox(height: theme.defaultSpace),
            Text(
              "Last updated: January 20, 2025",
              style: theme.lastUpdateStyle,
            ),
            SizedBox(height: theme.defaultSpace),
            _buildSection("Acceptance of Terms",
                "By downloading or using Mushroom Go, you agree to be bound by these terms and conditions. Please read them carefully."),
            _buildSection("User Responsibilities",
                "1. You agree to use the app in compliance with all applicable laws.\n"
                    "2. You must not use the app for any illegal or unauthorized purpose.\n"
                    "3. You are responsible for the security of your account and any activity under your account."),
            _buildSection("Limitation of Liability",
                "Mushroom Go is not liable for any damages or losses resulting from your use of the app."),
            _buildSection("Termination",
                "We reserve the right to suspend or terminate your access to the app if you breach these terms."),
            _buildSection("Contact Us",
                "If you have any questions about these Terms and Conditions, contact us at support@mushroomgo.com."),
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
