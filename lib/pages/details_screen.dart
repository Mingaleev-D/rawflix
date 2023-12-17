import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rawflix/theme/app_colors.dart';

import '../config/app_config.dart';
import '../models/movie.dart';
import '../widgets/arrow_back_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: const ArrowBackWidget(),
            backgroundColor: AppColours.primaryBackground,
            //AppColours.primaryBackground,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.network(
                  '${AppConfig.imageUrl}${movie.posterPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Column(
                children: [
                  Text(
                    'О фильме',
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.overview,
                    style: GoogleFonts.notoSansNushu(
                        fontWeight: FontWeight.normal, fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Дата релиза: ',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                movie.releaseDate,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Рейтинг: ',
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15,
                              ),
                              Text(
                                movie.voteAverage.toStringAsFixed(1).toString(),
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
