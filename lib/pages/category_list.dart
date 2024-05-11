import 'package:ayal_sahabe/Model/colors.dart';
import 'package:ayal_sahabe/Model/model.dart';
import 'package:ayal_sahabe/Views/play.dart';
import 'package:flutter/material.dart';

class category_list extends StatefulWidget {
  const category_list({super.key});

  @override
  State<category_list> createState() => _HomePageState();
}

class _HomePageState extends State<category_list> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: serik,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Category List"),
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
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => playing_page(
                                        videourl: snapshot.data![index].videourl
                                            as String,
                                        videoTitle: snapshot
                                            .data![index].videoTitle as String,
                                        videoid: snapshot.data![index].videoid
                                            .toString(),
                                      ),
                                    ),
                                  );
                                }, // Handle your callback
                                child: Ink(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: kok,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://img.youtube.com/vi/${snapshot.data![index].videoid}/0.jpg'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  height: 100,
                                  width: 100,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                    child: Text(snapshot.data![index].videoTitle
                                        as String),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  InkWell(
                                    child: Text(snapshot
                                        .data![index].categoryName as String),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              }),
        ),
      ),
    );
  }
}
