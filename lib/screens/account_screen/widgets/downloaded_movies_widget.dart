import 'package:flutter/material.dart';

class DownloadedMoviesWidget extends StatelessWidget {
  final String? imageSrc;
  final String? movieName;

  const DownloadedMoviesWidget(
      {super.key, required this.imageSrc, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      height: MediaQuery.of(context).size.height / 3,
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("https://image.tmdb.org/t/p/w500/$imageSrc",
              fit: BoxFit.cover, loadingBuilder: (BuildContext context,
                  Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return const Placeholder();
          }),
          Text(
            movieName ?? "",
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
