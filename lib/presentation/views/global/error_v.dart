// Error screen widget
import 'package:flutter/material.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';

import '../../../common/resources/dimentions/app_sizes.dart';
import 'widgets/button_w.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Container(
        padding: EdgeInsets.all(24),
        width: getWidth(context),
        height: getHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 20),
            const Text('An unexpected error occurred.', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            const Text('Please try again or contact support.', textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                // Navigate to home or restart logic
                context.pop();
              },
              label: "Return",
            ),
          ],
        ),
      ),
    );
  }
}
