import 'package:bloc_provider/constants/Colors.dart';
import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  const OfflineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child:Column(
          children: [
            const SizedBox(height: 90,),
            const Text('Can\'t connect.... check internet',
                style:TextStyle(
                  fontSize: 22,
                  color: MyColors.myGrey,
                )),
            Image.asset('assets/images/notify.png')
          ],
        )
      )
    ) ;
  }
}
