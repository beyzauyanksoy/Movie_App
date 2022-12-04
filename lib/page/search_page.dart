import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../provider/movie_provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var movieProvider = Provider.of<MovieProvider>(context, listen: false);
    movieProvider.getSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return Scaffold(
          backgroundColor: const Color(0xff171721),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset("assets/back_icon.png"),
            ),
            title: const Text("Search"),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  "assets/searchpageicon.png",
                  width: 40,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 20, top: 20),
                  child: TextField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        provider.getQuery(query: 'Beyza');
                      } else {
                        provider.getQuery(query: value);
                      }
                    },
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFF2F2F2),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: provider.search?.results?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      child: provider.search?.results?[index].backdropPath !=
                              null
                          ? Container(
                              decoration: const BoxDecoration(
                                  //color: Colors.green,
                                  ),
                              height: 70,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w200${provider.search?.results?[index].backdropPath ?? ""}",
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.search?.results?[index].title
                                                  .toString() ??
                                              "",
                                          maxLines: 1,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          //color: Colors.red,
                                          width: 60,

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.asset("assets/Star.png"),
                                              Text(
                                                provider.popularid?.voteAverage,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
