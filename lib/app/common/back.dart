import "package:flutter/material.dart";

class BackBtn extends StatelessWidget {
  const BackBtn({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => IconButton(
      onPressed: () {
        Navigator.maybePop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
      ),
    );
}
