import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moleculist/presentation/views/global/widgets/button_w.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialsView extends StatelessWidget {
  const SocialsView({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Socials'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(12),
              CustomButton(
                label: "Facebook",
                onTap: () {
                  _launchURL('https://www.facebook.com/khondakar.afridi/');
                },
              ),
              Gap(12),
              CustomButton(
                label: "LinkedIn",
                onTap: () {
                  _launchURL('https://www.linkedin.com/in/khondakarafridi/');
                },
              ),
              Gap(12),
              CustomButton(
                label: "Github",
                onTap: () {
                  _launchURL('https://github.com/WorkWithAfridi');
                },
              ),
              Gap(12),
              CustomButton(
                label: "Portfolio",
                onTap: () {
                  _launchURL('https://sites.google.com/view/workwithafridi');
                },
              ),
              Gap(12),
              CustomButton(
                label: "Resume",
                onTap: () {
                  _launchURL('https://docs.google.com/document/d/1ezAKII08F9hZxpHytor5EV1jKm7R6Ab1NHwMedEKIVY/edit?usp=sharing');
                },
              ),
              Gap(12),
            ],
          ),
        ),
      ),
    );
  }
}
