import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff171721),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 15, right: 18.24),
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
                const Icon(
                  Icons.search,
                  color: Color(0xffFFFFFF),
                  size: 28,
                )
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
              width: MediaQuery.of(context).size.width,
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/popular_image.png"),
                        Padding(
                          padding: const EdgeInsets.only(top: 6,bottom: 3),
                          child: Text("Wonder Women (1984)",style: TextStyle(color: Color(0xffFFFFFF),fontSize: 14,fontWeight: FontWeight.w500),),
                        ),
                        Text("Des 16, 2020",style: TextStyle(color: Colors.white38),)
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
