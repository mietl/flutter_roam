import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;

  const LoginButton({super.key,required this.child,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
        ),
        // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        onPressed: onPressed,
        disabledColor: const Color(0xFF8EC3C6).withOpacity(0.7),
        textColor: Colors.white,
        height: 52,
        elevation: 0,
        color: const Color(0xFF8EC3C6),
        child: child
    );
  }
}
