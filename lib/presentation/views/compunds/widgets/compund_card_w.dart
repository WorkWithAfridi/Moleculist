import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moleculist/common/resources/color/app_colors.dart';
import 'package:moleculist/presentation/views/global/widgets/custom_loader.dart';

import '../../../../domain/models/compund_m.dart';

class CompoundCard extends StatelessWidget {
  final CompoundModel compound;
  final VoidCallback onTap;

  const CompoundCard({super.key, required this.compound, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CachedNetworkImage(
              imageUrl: compound.imageUrl,
              height: 100,
              fit: BoxFit.contain,
              placeholder: (context, url) => CustomLoader(color: AppColors().pastelViolet),
              errorWidget: (context, url, error) => const Icon(Icons.broken_image),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Text(compound.name, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
                  Text(compound.formula, style: const TextStyle(color: Colors.grey)),
                  Text('${compound.weight} g/mol', style: const TextStyle(color: Colors.black87)),
                  const SizedBox(height: 4),
                  Chip(
                    label: Text(compound.hazard),
                    backgroundColor: _hazardColor(compound.hazard),
                    labelStyle: const TextStyle(color: Colors.white),
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _hazardColor(String hazard) {
    switch (hazard.toLowerCase()) {
      case 'flammable':
        return Colors.red;
      case 'toxic':
        return Colors.purple;
      case 'corrosive':
        return Colors.blueGrey;
      default:
        return Colors.orange;
    }
  }
}
