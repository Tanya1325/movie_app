import 'package:flutter/material.dart';
import 'package:movie_app/utils/index.dart';
import 'package:movie_app/widgets/movies_list_widget.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 32.0,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.myList,style: Theme.of(context).textTheme.titleLarge,),
                const SmallSpacingWidget(),
                MoviesListWidget(),
              ],
            ),
          ),
        )
    );
  }
}
