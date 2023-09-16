import 'package:flutter/material.dart';
import 'package:ptf/local.dart';

class FavouritesCard extends StatelessWidget {
  const FavouritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final labels = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/favourites'),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    image: const DecorationImage(
                      image: AssetImage('assets/images/star.jpeg'),
                      fit: BoxFit.cover
                    ),
                  ),
                  height: 200,
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.amber.shade300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text(labels.favouritesCard, style: TextStyle(color: Colors.deepOrange.shade900))),
                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, "/favourites");
                      }, child: Text(labels.viewFavourites))
                    ],
                  ),
                )
              ],
            ),
            Positioned(child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.2),
                    Colors.transparent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
            )),
            Positioned(
              top: 20,
              left: 20,
              child: Text(labels.myFavourites, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w900)),)
          ],
        ),
      ),
    );
  }
}
