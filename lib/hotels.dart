import 'package:flutter/material.dart';
import 'package:matrix_link/models/hotel_model.dart';
import 'package:matrix_link/pages/flight.dart';

class Hotels extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.0,
            titleSpacing: 0,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.flight,
                    size: 40,
                  ),
                ),
                Tab(
                    icon: Icon(
                  Icons.hotel_rounded,
                  size: 40,
                )),
              ],
            ),
          ),
          body: TabBarView(
            // controller: _tabController,
            children: <Widget>[
              DropDownflight(),
              Hotels(),
            ],
          ),
        ),
      ),
    );
  }
}
