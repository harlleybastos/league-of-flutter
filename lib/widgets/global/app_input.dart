import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? hintText;
  const AppInput(
      {Key? key,
      required this.focusNode,
      required this.textEditingController,
      required this.onChanged,
      required this.hintText,
      required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40, right: 40, top: 90),
      padding: const EdgeInsets.only(
        left: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: const Color(0xFF2d2c2c),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: textEditingController,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(
            color: Color(0xFF474646),
            fontFamily: 'Montserrat',
          ),
          suffixIcon: const Icon(
            Icons.search,
            color: Color(0xFF939392),
            size: 30,
          ),
        ),
      ),
    );
  }
}
