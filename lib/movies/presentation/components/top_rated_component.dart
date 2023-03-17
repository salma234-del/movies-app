import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/network/api_constants.dart';
import '../../../core/utils/enums.dart';
import '../controller/movies_cubit/movies_cubit.dart';
import '../controller/movies_cubit/movies_state.dart';

Widget topRatedComponent() => BlocBuilder<MoviesCubit, MoviesStates>(
    buildWhen: (previous, current) =>
        previous.topRatedStatus != current.topRatedStatus,
    builder: (context, state) {
      switch (state.topRatedStatus) {
        case Status.initial:
          return Container();
        case Status.loading:
          return const SizedBox(
            height: 170,
            child: Center(child: CircularProgressIndicator()),
          );
        case Status.success:
          return FadeIn(
            duration: const Duration(milliseconds: 500),
            child: SizedBox(
              height: 170.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: state.topRatedMovies.length,
                itemBuilder: (context, index) {
                  final movie = state.topRatedMovies[index];
                  return Container(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: InkWell(
                      onTap: () {
                        /// TODO : NAVIGATE TO  MOVIE DETAILS
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        child: CachedNetworkImage(
                          width: 120.0,
                          fit: BoxFit.cover,
                          imageUrl: ApiConstants.imageUrl(movie.backdropPath!),
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey[850]!,
                            highlightColor: Colors.grey[800]!,
                            child: Container(
                              height: 170.0,
                              width: 120.0,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );

        case Status.failure:
          return SizedBox(
            height: 170,
            child: Center(child: Text(state.popularMessage)),
          );
      }
    });
