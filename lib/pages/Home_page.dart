import 'package:ayal_sahabe/Model/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:ayal_sahabe/Model/model.dart';
import 'package:ayal_sahabe/Views/view_pge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Your  Channel"),
          ),
        ),
        body: Center(
          child: FutureBuilder<List<Post>>(
            future: fetchPosts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: <Widget>[
                          Positioned(
                            child: Container(
                              height: 300,
                              //to get height of screen

                              width: 350, //to get height of screen

                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "https://img.youtube.com/vi/${snapshot.data![index].videoid}/0.jpg",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => view_page(
                                        videoid: snapshot.data![index].videoid
                                            as String,
                                        videoTitle: snapshot
                                            .data![index].videoTitle as String,
                                        videourl: snapshot.data![index].videourl
                                            as String,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 2,
                                ),
                                Container(
                                  width: 50,
                                  child: Text(
                                    '${snapshot.data![index].datatime}',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ukij ekran'),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  child: Icon(Icons.remove_red_eye_sharp),
                                ),
                                Container(
                                  child: Text(
                                      '${snapshot.data![index].totalviews}'),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Container(
                                  width: 140,
                                  child: Text(
                                    snapshot.data![index].categoryName
                                        as String,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ukij ekran'),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  child: Text(
                                    snapshot.data![index].videoTitle as String,
                                    style: const TextStyle(
                                        fontSize: 16.0,
                                        fontFamily: 'ukij ekran'),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return SizedBox(
                height: 250,
                width: 250,
                child: LottieBuilder.asset("Lottie/louader.json"),
              );
            },
          ),
        ),
      ),
    );
  }
}
