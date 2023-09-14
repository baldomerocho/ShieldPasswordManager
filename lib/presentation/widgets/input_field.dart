import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? validatorMessage;
  final IconData? icon;
  final Color? iconColor;
  final bool? obscureText;
  final bool? autofocus;


  InputField({
    this.controller,
    this.label,
    this.hint,
    this.validatorMessage,
    this.icon,
    this.iconColor,
    this.obscureText,
    this.autofocus,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${label}", style: Theme.of(context).textTheme.titleMedium),
        TextFormField(
          autofocus: true,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                // border grey
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.grey.shade400,
                  width: 2,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.pink.shade400,
                  width: 2,
                ),
              ),
              hintText: hint,
              contentPadding: const EdgeInsets.all(10),
              prefixIcon: icon != null ? Icon(icon) :Icon (Icons.text_fields)

            ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validatorMessage;
            }
            return null;
          },
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

class InputDropdown extends StatelessWidget {
  final List<dynamic> items;
  final String? label;
  final String? validatorMessage;
  // on change
  final ValueChanged<String> onChanged;

  const InputDropdown({
    super.key,
    required this.items,
    this.label,
    required this.onChanged,
    this.validatorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${label}", style: Theme.of(context).textTheme.titleMedium),
        DropdownButtonFormField(
            items: items.map((e) => DropdownMenuItem(
              child: Text(e),
              value: e)
            ).toList(),
            onChanged: (value){
              onChanged(value.toString());
            },
          decoration: InputDecoration(
            isDense: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey.shade400,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              // border grey
              borderSide: BorderSide(
                color: Colors.grey.shade200,
                width: 2,
              ),
            ),
          ),
          validator: (value) {
            if (value == null || value == "") {
              return validatorMessage;
            }
          },
        ),
        SizedBox(height: 20)
      ],
    );
  }
}
