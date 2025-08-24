import 'package:crypto_app/generated/flutter_gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CryptoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? title;
  const CryptoAppBar({super.key, this.showBackButton = true, this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : null,
      title: Center(
        child: title != null
            ? Text(title!)
            : Image(image: AssetImage(Assets.image.logo.path), width: 150),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
