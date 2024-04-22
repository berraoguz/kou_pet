import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CompCustomTextField extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final IconData? iconData;
  final TextEditingController? controller;
  final bool obscureText; 

  CompCustomTextField({
    Key? key,
    this.inputFormatters,
    this.hintText,
    this.iconData, this.controller, required this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(
            height: 45.0,
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              inputFormatters: inputFormatters,
              decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.red,
                    width: 1.0,
                  ),
                ),
                prefixIcon: iconData != null
                    ? Icon(iconData, color: Colors.grey)
                    : null,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
