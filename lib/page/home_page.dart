import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../model/popular_movie_model.dart';
import '../provider/movie_provider.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    var movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getPopular();
    movieProvider.getRatedTop();
    movieProvider.getNowPlaying();
    movieProvider.getUpcoming();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xff171721),
          body: Padding(
            padding: const EdgeInsets.only(
              top: 45,
              left: 15,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    //appbarr
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Mov",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "ve",
                            style: TextStyle(
                                color: Color(0xffE11A38),
                                fontSize: 36,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Image.asset("assets/search_icon.png"))
                    ],
                  ), //appbar-finish
                  Padding(
                    padding: const EdgeInsets.only(top: 18, bottom: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Popular Movie",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    /// width: MediaQuery.of(context).size.width,
                    height: 245,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.popular?.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  DetailPage(id: provider.popular?.results?[index].id.toString())),
                            );
                          },
                          child: Container(
                            width: 150,
                            // color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                    height: 200,
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w200/${provider.popular?.results?[index].posterPath}',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6, bottom: 3),
                                  child: SizedBox(
                                    width: 136,
                                    child: Text(
                                      "${provider.popular?.results?[index].title ?? ""}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Text(
                                  "${provider.popular?.results?[index].releaseDate ?? ""}",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 16),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Now Playing",
                        style: TextStyle(
                            color: Color(0xffFFFFFF),
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  Container(
                    // color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.nowplaying?.results?.length ?? 0,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            // color: Colors.green,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        'https://image.tmdb.org/t/p/w200/${provider.nowplaying?.results?[index].posterPath}',
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 6, bottom: 3),
                                  child: Container(
                                    width: 120,
                                    // color: Colors.red,
                                    child: Text(
                                      "${provider.nowplaying?.results?[index].title ?? ""}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                Text(
                                  "start: ${provider.nowplaying?.dates?.minimum}",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "finish: ${provider.nowplaying?.dates?.maximum}",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        "Upcoming Moview",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //color: Colors.blue,
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: provider.upcoming?.results?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                            width: 105,
                            //color: Colors.red,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://image.tmdb.org/t/p/w200/${provider.upcoming?.results?[index].posterPath}")),
                                Padding(
                                  padding: EdgeInsets.only(top: 6, bottom: 3),
                                  child: Container(
                                    width: 120,
                                    child: Text(
                                      "${provider.upcoming?.results?[index].title}",
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text(
                                  provider.upcoming?.dates?.minimum
                                          ?.toString()
                                          .split(" ")
                                          .first
                                          .substring(0, 10) ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                ),
                                Text(
                                  provider.upcoming?.dates?.maximum
                                          ?.toString()
                                          .split(" ")
                                          .first
                                          .substring(0, 10) ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.white38, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
