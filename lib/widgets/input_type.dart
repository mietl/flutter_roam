import 'package:flutter/material.dart';

class InputType extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final bool autofocus = false;
  final ValueChanged<String>? onChanged;

  const InputType({super.key, this.hintText,this.obscureText = false,this.keyboardType,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText:obscureText,
        onChanged: onChanged,
        keyboardType:keyboardType,
        autofocus:autofocus,
        style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400
        ),
        decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            // isCollapsed: true,//重点，相当于高度包裹的意思，必须设置为true，不然有莫名其妙的最小高度
            contentPadding: const EdgeInsets.symmetric(horizontal: 21, vertical: 17),//内容内边距，影响高度
            fillColor:  const Color.fromRGBO(167,191,250,0.14),
            border: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100),
            )
        ),
    );
  }
}


