import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../model/carModel.dart';
import 'favoriteBadge.dart';

class CarFeed extends StatelessWidget {
  final Car? car;
  final String? userID;
  const CarFeed({this.car, this.userID});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
    Stack(
      children : [
        GestureDetector(
          onTap: () => Navigator.pushNamed(
              context,
              '/detail',
              arguments: car!
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.35,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color : Colors.grey,
              image : DecorationImage(
                image : NetworkImage(car!.carUrlImg!),
                fit:BoxFit.cover,

              ),
            ),
          ),
        ),
        FavoriteBadge(car : car!, userID: userID),
      ]
    ),
        Padding(
          padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car!.carName!,
                    style : TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('De ${car!.carUserName!}'),
                ],
              ),
              Text(formattingDate(car!.carTimestamp)),
            ],
          ),
        )
      ],
    );
  }

  String formattingDate(Timestamp? timestamp){
    initializeDateFormatting('fr', null);
    DateTime? dateTime = timestamp?.toDate();
    DateFormat dateFormat = DateFormat.MMMd('fr');
    return dateFormat.format(dateTime ?? DateTime.now());
  }
}
