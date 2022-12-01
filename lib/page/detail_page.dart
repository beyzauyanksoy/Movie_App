import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171721),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset(
          "assets/back_icon.png",
          color: Colors.white,
        ),
        actions: [
          Image.asset(
            "assets/bookmark_icon.png",
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              SizedBox(
                //height: 350,
                width: double.infinity,
                child: Image.asset(
                  "assets/top_images.png",
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                bottom: 0,
                left: 70,
                child: Text(
                  "Wonder Women",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "2020",
                style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset("assets/circle.png"),
              ),
              const Text(
                "Adventure, Action",
                style: TextStyle(
                    color: Colors.white38,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset("assets/circle.png"),
              ),
              const Text(
                "2 h 35 min",
                style: TextStyle(
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
                const Text(
                  "7,2",
                  style: TextStyle(
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
                  initialRating: 2,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Text(
              "Wonder Woman squares off against Maxwell Lord and the Cheetah, a villainess who possesses superhuman strength and agility.",
              style: TextStyle(color: Colors.white38),
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      //color: Colors.green,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "assets/detail_small_image.png",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            "Gal Gadot",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          ),
                          const Text(
                            "Wonder women",
                            style: TextStyle(
                                color: Colors.white38,
                                fontWeight: FontWeight.w400,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
