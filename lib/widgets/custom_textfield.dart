import 'package:bakery_app/utils/themeData.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({super.key, this.onSaved,this.maxLength, this.obscureText, this.counterText=false, this.validator, required this.hintText, this.onChanged, this.controller, this.errorText, this.focusNode, this.width, this.height, this.maxLine, this.readOnly = false, this.textColor});
  TextEditingController? controller;
  String hintText;
  String? errorText;
  Function(String)? onChanged;
  FocusNode? focusNode;
  double? width;
  double? height;
  int? maxLine;
  int? maxLength;
  bool readOnly;
  bool counterText;
  bool? obscureText;
  Color? textColor;
  FormFieldSetter? onSaved;
  String? Function(String?)? validator;


  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: TextFormField(
          obscureText: widget.obscureText ?? false,
          maxLength: widget.maxLength ?? 200,
          maxLines: widget.maxLine,
          onSaved: widget.onSaved,
          validator: (value){
            if (value?.isEmpty ?? true) return '${widget.hintText}을/를 입력해주세요.';
            if (widget.validator != null) {
              return widget.validator!(value);
            }
            return null;
          },
          readOnly: widget.readOnly,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: widget.textColor),
          textAlignVertical: TextAlignVertical.center,
          textInputAction: TextInputAction.done,
          focusNode: widget.focusNode,
          onChanged: (text) {

            if (widget.onChanged != null) widget.onChanged!(text);
          },
          controller: widget.controller,
          decoration: InputDecoration(
            counterText:widget.counterText? null:'',
            contentPadding: const EdgeInsets.all(10),
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: widget.textColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            errorText: widget.errorText,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: CC.errorColor,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: CC.errorColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: CC.mainColor,
              ),
            ),
            focusColor: CC.mainColor,
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}