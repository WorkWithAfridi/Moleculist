import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';
import 'package:moleculist/presentation/views/global/widgets/button_w.dart';

class LoremView extends StatelessWidget {
  const LoremView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(80),
            const Text("Lorem View", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const Gap(20),
            CustomButton(onTap: () {}, label: "Do Something"),
            const Gap(10),
            CustomButton(onTap: () {}, label: "Another Action"),
            const Gap(10),
            const Divider(),
            const Text("Quick Actions", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const Gap(10),
            CustomButton(
              onTap: () {
                context.showSnackBar("Mock API request sent");
              },
              label: "Send Mock Request",
            ),
            CustomButton(
              onTap: () {
                context.showSnackBar("Downloaded lorem.pdf");
              },
              label: "Download PDF",
            ),
            CustomButton(
              onTap: () {
                context.showSnackBar("Uploaded dummy file");
              },
              label: "Upload File",
            ),
            const Gap(20),
            const Text("Mock Data Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            const Gap(10),
            Text(
              "• Name: John Lorem\n"
              "• Email: john@ipsum.com\n"
              "• Status: Active\n"
              "• Joined: Jan 1, 2023\n",
              style: const TextStyle(fontSize: 16),
            ),
            const Gap(100),
          ],
        ),
      ),
    );
  }
}
