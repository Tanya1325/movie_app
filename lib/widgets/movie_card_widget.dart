import 'package:flutter/material.dart';

class MovieCardWidget extends StatelessWidget {
  const MovieCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
        'https://bst.icons8.com/wp-content/themes/icons8/app/uploads/2019/05/poster-for-movie.png',
        fit: BoxFit.cover,
      )),
    );
  }
}
