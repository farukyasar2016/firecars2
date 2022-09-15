import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/carModel.dart';
import 'carFeed.dart';

class CarList extends StatelessWidget {
  final String? userID;
  const CarList({this.userID}) ;

  @override
  Widget build(BuildContext context) {
    final _cars = Provider.of<List<Car>>(context);
    return SliverList(
        delegate: SliverChildBuilderDelegate(( _, index){
          return CarFeed(car : _cars[index] , userID: userID);
        },
        childCount : _cars.length,
        ),
    );
  }
}
