import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:koupet/theme/app_color.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageUrl;
  final IconData trailingIcon;
  final Color color;
  final double borderRadius;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.trailingIcon,
    required this.color,
    required this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: ((context) => ProfilView())));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: color,
            ),
            child: ListTile(
                dense: true,
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
                title: Text(
                  title,
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.subtitle1, color: Colors.black),
                ),
                subtitle: Text(
                  subtitle,
                  style: GoogleFonts.outfit(
                      textStyle: textTheme.subtitle2, color: Colors.grey),
                ),
                trailing: Container(
                  color: Colors.white.withOpacity(0.6),
                  child: Icon(trailingIcon),
                ))),
      ),
    );
  }
}
