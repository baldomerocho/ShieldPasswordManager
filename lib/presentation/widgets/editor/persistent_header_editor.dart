import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ptf/local.dart';
import 'package:ptf/presentation/blocs/blocs.dart';

class PersistentHeaderEditor extends SliverPersistentHeaderDelegate {
  final double height;
  final bool status;
  final AnimationController animationController;
  PersistentHeaderEditor({required this.height, required this.status, required this.animationController});

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
                0.9,
              ],
              colors: [
                Colors.pink.shade100,
                Colors.pink.shade50,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          width: MediaQuery.of(context).size.width,
          child: BlocBuilder<UpdatePassBloc, UpdatePassState>(
            builder: (context,state){
              return state.maybeMap(
                orElse: () => Container(),
                initial: (_) {
                  animationController.reverse();
                  return Lottie.asset("assets/lotties/animation_lmkejezc.json", height: 100, repeat: false, animate: true,controller: animationController);
                },
                loading: (_) {
                  animationController.reset();
                  animationController.forward();
                  return Lottie.asset("assets/lotties/animation_lmkejezc.json", height: 100, repeat: false,controller: animationController);
                },
                success: (_) {
                  animationController.reset();
                  animationController.forward();
                  return Lottie.asset("assets/lotties/animation_lmkfdqxp.json", height: 100, repeat: false,controller: animationController);
                },
              );
            }
          )
        ),
        Positioned(child: SafeArea(
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.back,size: 40,),
          )
        )),
        Positioned(child: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child:Text(status ? labels.create : labels.update, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
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
  bool shouldRebuild(PersistentHeaderEditor oldDelegate) {
    return oldDelegate.height != height;
  }
}