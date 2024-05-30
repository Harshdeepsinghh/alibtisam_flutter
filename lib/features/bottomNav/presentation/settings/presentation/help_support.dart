import 'package:alibtisam_flutter/helper/common/widgets/custom_gradient_button.dart';
import 'package:alibtisam_flutter/helper/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpSupportPage extends StatelessWidget {
  final String whatsappNumber =
      "+966542222898"; // Replace with your WhatsApp number
  final String whatsappMessage =
      "Hello, I need help with..."; // Pre-filled message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help & Support"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "We're here to help!",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "If you have any questions or need assistance, feel free to reach out to us.",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 24),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse(
                      "https://forms.zohopublic.in/harshsinghsaluja10/form/newform/formperma/CQHk6paEPuPa6gspvdGjBfGVhE7q7kIKBCS8Xm14i7s"));
                },
                child: _buildSupportCard(
                  icon: Icons.question_answer,
                  title: "Zoho form",
                ),
              ),
              GestureDetector(
                onTap: () {
                  _launchWhatsApp();
                },
                child: _buildSupportCard(
                  icon: Icons.chat,
                  title: "Contact Us on WhatsApp",
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await launchUrl(Uri.parse("mailto:info@alibtisam.club"));
                },
                child: _buildSupportCard(
                  icon: Icons.email,
                  title: "Email Us",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSupportCard({
    IconData? icon,
    required String title,
  }) {
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          gradient: kGradientColor(), borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        leading: Icon(icon, color: Colors.white, size: 36),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _launchWhatsApp() async {
    final whatsappUrl =
        "https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(whatsappMessage)}";
    launchUrl(Uri.parse(whatsappUrl));
  }
}