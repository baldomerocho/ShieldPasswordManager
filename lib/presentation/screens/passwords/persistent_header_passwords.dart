import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/presentation/blocs/blocs.dart';

class PersistentHeaderPasswords extends SliverPersistentHeaderDelegate {
  final double height;
  final TextEditingController controller;
  final GlobalKey<FormState> formKey;
  PersistentHeaderPasswords({required this.height, required this.controller, required this.formKey});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.pink,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
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
          left: 10,
          right: 10,
          child: Form(
            key: formKey,
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
                        borderSide: BorderSide(color: Colors.white, width: 2.0),
                      ),
                      hintText: "Search",
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      hintStyle: TextStyle(color: Colors.pink.shade800),
                      focusColor: Colors.pink.shade800,
                      suffixIcon: controller.text != "" ? IconButton(
                        onPressed: () {
                          controller.clear();
                          context.read<WatchPasswordsBloc>().add(WatchPasswordsEvent.watchPasswords(""));
                        },
                        icon: Icon(CupertinoIcons.clear, color: Colors.white),
                      ) : null,
                    ),
                    validator: (value) {
                        if(value!.isEmpty) {
                          return "Please enter a password";
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
                  icon: Icon(CupertinoIcons.search, color: Colors.white),
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