import 'package:flutter/material.dart';
import 'package:koupet/theme/app_color.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text, required this.onTap});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: ConstantsColor.lightGreenColor,
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(children: [
          const Icon(Icons.person_2),
          const SizedBox(
            width: 20,
          ),
          Text(text)
        ]),
      ),
    );
  }
}
