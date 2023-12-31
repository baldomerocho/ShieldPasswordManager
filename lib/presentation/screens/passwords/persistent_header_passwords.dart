import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';
import 'package:ptf/presentation/screens/passwords/categories_slider.dart';

class PersistentHeaderPasswords extends SliverPersistentHeaderDelegate {
  final double height;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  PersistentHeaderPasswords({required this.height, required this.controller, required this.formKey});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final labels = AppLocalizations.of(context)!;
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.pink,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.1,
                0.5,
                0.9,
              ],
              colors: [
                Colors.pink.shade100,
                Colors.pink.shade200,
                Colors.pink.shade300,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 00,
          right: 00,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.958,
                  child: Row(
                    children: [
                      Expanded(child: TextFormField(
                          controller: controller,
                          cursorColor: Colors.pink.shade100,
                          style: TextStyle(color: Colors.pink.shade900),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white38,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // white
                              borderSide: const BorderSide(color: Colors.white, width: 2.0),
                            ),
                            hintText: labels.search,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            hintStyle: TextStyle(color: Colors.pink.shade800),
                            focusColor: Colors.pink.shade800,
                            suffixIcon: controller.text != "" ? IconButton(
                              onPressed: () {
                                controller.clear();
                                context.read<WatchPasswordsBloc>().add(WatchPasswordsEvent.watchPasswords(""));
                              },
                              icon: const Icon(CupertinoIcons.clear, color: Colors.white),
                            ) : null,
                          ),
                          validator: (value) {
                              if(value!.isEmpty) {
                                return labels.passwordRequired;
                              }
                              return null;
                          },
                      )),
                      IconButton(
                        onPressed: () {
                          if(formKey.currentState!.validate()) {
                            context.read<WatchPasswordsBloc>().add(WatchPasswordsEvent.watchPasswords(controller.text));
                          }
                        },
                        icon: const Icon(CupertinoIcons.search, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: kToolbarHeight/2,
                  margin: const EdgeInsets.only(top: 10),
                  child: const CategoriesSlider(),
                ),
              ],
            ),
          )
        ),
        Positioned(child: SafeArea(
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.back,size: 40,),
          )
        ))
      ],
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(PersistentHeaderPasswords oldDelegate) {
    return oldDelegate.height != height;
  }
}