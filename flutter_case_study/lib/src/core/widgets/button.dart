import 'package:flutter/material.dart';


class OrangeButton extends StatelessWidget {
  const OrangeButton({super.key, required this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
          backgroundColor: Colors.transparent,
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Colors.orange,
            ),
          ),
         ),
      child: Text(
        text,
 
      ),
    );
  }
}