import 'package:ayal_sahabe/Model/colors.dart';
import 'package:ayal_sahabe/Model/model.dart';
import 'package:ayal_sahabe/Views/play.dart';
import 'package:ayal_sahabe/Views/play.dart';
import 'package:ayal_sahabe/constants/connection.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: serik,
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        centerTitle: true,
        title: Text("Category"),
      ),
      body: Center(
        child: FutureBuilder<List<Tvrler>>(
          future: FetchTvrler(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 4, // spacing between columns
                ),
                padding: const EdgeInsets.all(4.0), // padding around the grid
                itemCount: snapshot.data!.length,

                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => playing_page(
                                    videourl: snapshot.data![index] as String,
                                    videoTitle: snapshot.data![index] as String,
                                    videoid: snapshot.data![index].toString(),
                                  ),
                                ));
                          },
                          child: Container(
                            height: 75,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  alignment: Alignment.center,
                                  repeat: ImageRepeat.noRepeat,
                                  image: NetworkImage(
                                    '$CatecoryUrl'
                                    '${snapshot.data![index].categoryimage as String}',
                                  )),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey, // color of grid items
                        child: Center(
                            child:
                                Text('${snapshot.data![index].categoryname}')),
                      ),
                      Container(
                        color: Colors.brown, // color of grid items
                        child: Center(
                            child: Text('${snapshot.data![index].videocount}'
                                ' '
                                'Videos')),
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator(
              color: kok,
            );
          },
        ),
      ),
    );
  }
}
