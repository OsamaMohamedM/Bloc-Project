import 'package:bloc_provider/DataLayer/Models/Characters.dart';
import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';

class CharactersDetailsScreens extends StatelessWidget {
  final Character character;

  const CharactersDetailsScreens({ required this.character, super.key});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 700,
      backgroundColor: MyColors.myGrey,
      // centerTitle: true,
      // leadingWidth: 25,
      flexibleSpace: FlexibleSpaceBar(centerTitle: true,
        title: Text(
          character.name,
          style:const TextStyle(color: MyColors.myYellow, fontSize:20 , fontWeight: FontWeight.bold),
        ),

        background: Hero(
            tag: character.id,
            child: Image.network(
              character.image,
              fit: BoxFit.cover,)),
      ),
    );
  }
  Widget  characterInfo(String title , String value){
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text : TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(color: MyColors.myWhite, fontWeight: FontWeight.bold,fontSize: 18),
          ),TextSpan(
            text: value,
            style: const TextStyle(color: MyColors.myWhite, fontSize: 16),
          ),
        ]
      )
    );
  }
  Widget  buildDivider(double endIndent ) {
    return Divider(
        height: 30,
        endIndent: endIndent,
        thickness: 3,
        color: MyColors.myYellow
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
          slivers: [
          buildSliverAppBar(),
            SliverList(
              delegate:SliverChildListDelegate(
                  [
                    Container(
                      margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
                      padding: const EdgeInsets.all(8),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          characterInfo("Status : " , character.status),
                          buildDivider(120),
                          characterInfo("species : " , character.species),
                          buildDivider(190),
                          characterInfo("gender : " , character.species),
                          buildDivider(0),
                          characterInfo("origin : " , character.originName),
                          buildDivider(315),
                          characterInfo("location : " , character.location),
                          buildDivider(200),
                          characterInfo("episode : " , "${character.episodeAppearance.length}"),
                          buildDivider(400.0 - 300.0*(character.episodeAppearance.length/300)),
                          const SizedBox(height: 30,)
                        ],
                      ),
                    ),
                     SizedBox(
                          height: MediaQuery.of(context).size.height * 0.534,
                        )
                  ]) ,
            )
      ],
    ),);
  }
}
