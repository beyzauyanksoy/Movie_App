import 'package:flutter/material.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class DetailPage extends StatefulWidget {
  final String? id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    var movieProvider = Provider.of<MovieProvider>(context, listen: false);
    await movieProvider.getPopularid(widget.id);
    await movieProvider.getCreditsid(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171721),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/back_icon.png",
            color: Colors.white,
          ),
        ),
        actions: [
          Image.asset(
            "assets/bookmark_icon.png",
            color: Colors.white,
          )
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (BuildContext context, provider, Widget? child) {
          if (provider.popularid?.status == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  provider.popularid?.posterPath != null
                      ? SizedBox(
                          //height: 350,
                          width: double.infinity,
                          //https://image.tmdb.org/t/p/w600_and_h900_bestv2/
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w600_and_h900_bestv2${provider.popularid?.posterPath}',
                            fit: BoxFit.contain,
                          ),
                        )
                      : const SizedBox(),
                  Positioned(
                    bottom: 0,
                    left: 15,
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.red,
                      child: Text(
                        "${provider.popularid?.title ?? ""}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 36,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${provider.popularid?.releaseDate?.year}",
                    style: const TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset("assets/circle.png"),
                  ),
                  Text(
                    provider.popularid?.genres?[0].name ?? "",
                    style: const TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      provider.popularid?.voteAverage.toString() ?? "",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0xffFDC432),
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    RatingBar.builder(
                      ignoreGestures: true,
                      unratedColor: Colors.grey,
                      itemSize: 20,
                      initialRating:
                          double.parse(provider.popularid?.voteAverage),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 10,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Color(0xffFDC432),
                      ),
                      onRatingUpdate: (rating) {
                        print("print yazdırıldı");
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  provider.popularid?.overview ?? "",
                  style: const TextStyle(color: Colors.white38),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 15, bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Cast",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                //color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: provider.creditsid?.cast?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: provider.creditsid!.cast![index].profilePath !=
                              null
                          ? Container(
                              // color: Colors.green,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w600_and_h900_bestv2${provider.creditsid!.cast![index].profilePath ?? ""}",
                                      height: 70,
                                      width: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // color: Colors.red,
                                    width: 120,
                                    child: Text(
                                      provider.creditsid?.cast?[index].name
                                              .toString() ??
                                          "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  ),
                                  Container(
                                    //color: Colors.green,
                                    width: 120,
                                    child: Text(
                                      provider.creditsid?.cast?[index].character
                                              .toString() ??
                                          "",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white38,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: Container(
                  width: 181,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xffE11A38),
                  ),
                  child: const Center(
                    child: Text(
                      "Watch Now",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
