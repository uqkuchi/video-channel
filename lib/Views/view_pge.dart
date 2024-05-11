import 'package:ayal_sahabe/Model/colors.dart';
import 'package:ayal_sahabe/Model/model.dart';
import 'package:ayal_sahabe/Views/play.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class view_page extends StatefulWidget {
  final String videoid;
  final String videoTitle;
  final String videourl;
  const view_page(
      {super.key,
      required this.videoTitle,
      required this.videoid,
      required this.videourl});

  @override
  State<view_page> createState() => _view_pageState();
}

class _view_pageState extends State<view_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        title: Text('view page'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
            const Duration(seconds: 3),
          );
          fetchPosts();
        },
        child: Stack(
          children: [
            Container(
              height: 250,
              width: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        "https://img.youtube.com/vi/${widget.videoid}/0.jpg"),
                    fit: BoxFit.cover),
                color: kok,
              ),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 75, left: 165),
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => playing_page(
                                videourl: widget.videourl,
                                videoid: widget.videoid,
                                videoTitle: widget.videoTitle,
                              ),
                            ),
                          );
                        },
                        child: LottieBuilder.asset("Lottie/play.json"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300.0),
              child: SizedBox(
                height: 650,
                width: 420,
                child: FutureBuilder<List<Post>>(
                  future: fetchPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                              shadowColor: Colors.black,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 120,
                                    width: 420,
                                    child: Stack(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    playing_page(
                                                  videourl: snapshot
                                                      .data![index].videourl
                                                      .toString(),
                                                  videoid: widget.videoid,
                                                  videoTitle: widget.videoTitle,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        Container(
                                          height: 120,
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: const Color.fromARGB(
                                                255, 238, 236, 236),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://img.youtube.com/vi/${snapshot.data![index].videoid}/0.jpg"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 125.0),
                                          child: Text(
                                            snapshot.data![index].videoTitle
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 125, top: 50),
                                          child: Text(snapshot
                                              .data![index].categoryName
                                              .toString()),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 125, top: 90),
                                          child: Text(
                                            snapshot.data![index].totalviews
                                                .toString(),
                                            style: const TextStyle(
                                                fontFamily: 'ukij ekran'),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 135, top: 88),
                                          child:
                                              Icon(Icons.remove_red_eye_sharp),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          LottieBuilder.asset("Lottie/error.json"),
                        ],
                      );
                    }
                    return LottieBuilder.asset("Lottie/louader.json");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
