import 'package:flutter/material.dart';
import 'package:moleculist/presentation/views/global/widgets/button_w.dart';

class SocialsView extends StatelessWidget {
  const SocialsView({super.key});

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
              CustomButton(label: "Facebook", onTap: () {}),
              CustomButton(label: "LinkedIn", onTap: () {}),
              CustomButton(label: "Github", onTap: () {}),
              CustomButton(label: "Portfolio", onTap: () {}),
              CustomButton(label: "Resume", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
