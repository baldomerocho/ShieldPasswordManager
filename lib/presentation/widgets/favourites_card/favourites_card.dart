import 'package:flutter/material.dart';
import 'package:ptf/presentation/widgets/get_all_passwords.dart';

class FavouritesCard extends StatelessWidget {
  const FavouritesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/favourites'),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shadowColor: Colors.black.withOpacity(0.4),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade200,
                    image: DecorationImage(
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
                      Expanded(child: Text("You selection of favoutites. View them here.")),
                      ElevatedButton(onPressed: (){
                        Navigator.pushNamed(context, "/favourites");
                      }, child: Text("Get All Favs")),
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
              child: Text("My favs", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w900)),)
          ],
        ),
      ),
    );
  }
}
