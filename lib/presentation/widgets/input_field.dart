import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/category_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';

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
              prefixIcon: icon != null ? Icon(icon) :Icon (Icons.text_fields),
            prefixIconColor: Colors.grey,
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
  final String? initialValue;
  final String? label;
  final String? validatorMessage;
  final ValueChanged<String> onChanged;

  const InputDropdown({
    super.key,
    this.initialValue,
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
        BlocBuilder<WatchCategoriesBloc, WatchCategoriesState>(
          builder: (context, state) {
            return state.maybeWhen(
                orElse: () => CircularProgressIndicator(),
                initial: () {
                  context.read<WatchCategoriesBloc>().add(const WatchCategoriesEvent.watch());
                  return const CircularProgressIndicator();
                },
                streamLoaded: (stream) {
                  return StreamBuilder<List<CategoryEntity>>(
                    stream: stream,
                    builder: (context, snapshot) {
                      final categories = snapshot.data;
                      print(categories);
                      return DropdownButtonFormField(
                            isDense: true,
                            value: initialValue == "" ? null : initialValue,
                            items: categories?.map((category) => DropdownMenuItem<String>(
                              value: category.id, // Usa el ID de la categoría como valor
                              child: Text(category.name), // Muestra el nombre de la categoría
                            )).toList(),
                            onChanged: (value){
                              onChanged(value.toString());
                            },
                          decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.list, color: Colors.grey),
                            // if on focused pink icon else grey
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
                            return null;
                          },
                      );
                    }
                  );
                });
          }),
        SizedBox(height: 20)
      ],
    );
  }
}
