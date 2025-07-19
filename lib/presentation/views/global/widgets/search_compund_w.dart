import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';
import 'package:moleculist/common/utilities/extensions/string_extensions.dart';
import 'package:moleculist/common/utilities/routing/app_routes.dart';
import 'package:moleculist/domain/models/compund_m.dart';

import '../../../../common/resources/color/app_colors.dart';
import 'custom_loader.dart';

class SearchCompundWidget extends StatelessWidget {
  const SearchCompundWidget({super.key, required this.compound});

  final CompoundModel compound;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateToNamed(ROUTES.getCompundDetailRoute, arguments: compound);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors().pastelViolet.withAlpha(100)),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: compound.imageUrl ?? '',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              placeholder: (context, url) => CustomLoader(color: AppColors().pastelViolet),
              errorWidget: (context, url, error) => const Icon(Icons.broken_image, size: 60),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (compound.name ?? "Unknown Name").capitalizeFirstLetter(),
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text("Formula: ${compound.formula ?? 'N/A'}", style: Theme.of(context).textTheme.bodySmall),
                  Text("Hazard: ${compound.hazard ?? 'None'}", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            Gap(12),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.science, color: AppColors().primary),
                const SizedBox(height: 4),
                Text(compound.weight ?? '0.0', style: const TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
