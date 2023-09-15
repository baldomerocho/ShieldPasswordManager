import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ptf/domain/entities/category_entity.dart';
import 'package:ptf/presentation/blocs/blocs.dart';

class CategoriesSlider extends StatelessWidget {
  const CategoriesSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchCategoriesSliderBloc, WatchCategoriesSliderState>(
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => const CircularProgressIndicator(),
            initial: () {
              context.read<WatchCategoriesSliderBloc>().add(WatchCategoriesSliderEvent.watch());
              return const CircularProgressIndicator();
            },
            streamLoaded: (stream) => StreamBuilder<List<CategoryEntity>>(
              stream: stream,
              builder: (context, snapshot) {
                List<CategoryEntity>? categories = [];
                categories.add(CategoryEntity(id: "", name: "All"));
                snapshot.data?.map((e) => categories.add(e)).toList();
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories?.length ?? 0,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<WatchPasswordsBloc>().add(WatchPasswordsEvent.watchPasswords(categories?[index].id ?? ""));
                      },
                      child: Container(
                          child: Text("${categories?[index].name}"),
                          margin: EdgeInsets.only(left: 10, right: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          )
                      ),
                    );
                  });
              }
            )
        );
      },
    );
  }
}
