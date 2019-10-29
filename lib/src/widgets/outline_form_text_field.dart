import 'package:flutter/material.dart';

class OutlineFormTextField extends StatelessWidget {
  final FocusNode focusNode;

  final String hintText;
  final String labelText;
  final String Function(String) validator;
  final void Function(String) onFieldSubmitted;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;

  OutlineFormTextField({
    Key key,
    this.hintText,
    this.labelText,
    this.validator,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 4,
        bottom: 4,
      ),
      child: TextFormField(
        validator: this.validator,
        obscureText: this.obscureText,
        keyboardType: this.keyboardType,
        textInputAction: this.textInputAction,
        focusNode: this.focusNode,
        onFieldSubmitted: this.onFieldSubmitted,
        decoration: InputDecoration(
          hintText: this.hintText,
          labelText: this.labelText,
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
