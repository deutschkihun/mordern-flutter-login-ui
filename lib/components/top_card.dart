
import 'package:flutter/material.dart';

import 'circular_border_avatar.dart';
import 'custom_container.dart';

class TopCard extends StatelessWidget {
  const TopCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your New Design is here!',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          Text(
            'Victor and Wonjun',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 32,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  width: 32,
                  top: 0,
                  bottom: 0,
                  child: CircularBorderAvatar(
                    'https://randomuser.me/api/portraits/women/68.jpg',
                    borderColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  left: 22,
                  width: 32,
                  top: 0,
                  bottom: 0,
                  child: CircularBorderAvatar(
                    'https://randomuser.me/api/portraits/women/90.jpg',
                    borderColor:
                        Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Text(
                    'now',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
