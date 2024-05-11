import 'package:ayal_sahabe/constants/connection.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  int? vid;
  int? catId;
  String? videoTitle;
  String? categoryName;
  String? videothumbnail;
  int? totalviews;
  String? datatime;
  String? videourl;
  String? videoid;

  Post({
    this.vid,
    this.catId,
    this.videoTitle,
    this.categoryName,
    this.videothumbnail,
    this.totalviews,
    this.videoid,
    this.datatime,
    this.videourl,
  });

  Post.fromJson(Map<String, dynamic> json) {
    vid = json['vid'];
    catId = json['cat_id'];
    videoTitle = json['video_title'];
    categoryName = json['category_name'];
    videothumbnail = json['video_thumbnail'];
    totalviews = json['total_views'];
    videoid = json['video_id'];
    datatime = json['data_time'];
    videourl = json['video_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['vid'] = this.vid;
    data['cat_id'] = this.catId;
    data['video_title'] = this.videoTitle;
    data['category_name'] = this.categoryName;
    data['video_thumbnail'] = this.videothumbnail;
    data['total_views'] = this.totalviews;
    data['video_id'] = this.videoid;
    data['data_time'] = this.datatime;
    data['video_url'] = this.videourl;

    return data;
  }
}

// Future<List<Post>> fetchPosts() async {
//   final response = await http.get(Uri.parse(
//       'http://192.168.0.104/video/api/get_posts&api_key=cda11CUvH0wBKPIbxymarJlO1FSf974Xsu8QiVh6dkzZ5DTqMR'));
//   final List<dynamic> itemlist = responseMap['items'];
//   if (response.statusCode == 200) {
//     List<String> data = json.decode(response.body);
//     return data
//         .map((json) => Post.fromJson(json as Map<String, dynamic>))
//         .toList();
//   } else {
//     throw Exception('Failed to load posts');
//   }
// }

// final Map<String, dynamic> responseMap = jsonDecode(responseMap.body);

Future<List<Post>> fetchPosts() async {
  final response = await http.get(
    Uri.parse(adrisi + all_post + Api),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> decodedJson = json.decode(response.body);

    if (decodedJson.containsKey('posts') && decodedJson['posts'] is List) {
      // If 'items' is a key in your JSON and it's a list
      final List<dynamic> itemsList = decodedJson['posts'];

      return itemsList.map((itemJson) => Post.fromJson(itemJson)).toList();
    } else {
      // Handle the case where 'items' is not a List
      throw Exception('Expected a list of items, but got something else.');
    }
  } else {
    throw Exception('Failed to load data');
  }
}

// category

class Tvrler {
  int? videocount;
  String? categoryname;
  String? categoryimage;

  Tvrler({
    this.videocount,
    this.categoryname,
    this.categoryimage,
  });

  Tvrler.fromJson(Map<String, dynamic> json) {
    videocount = json['video_count'];
    categoryname = json['category_name'];
    categoryimage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_count'] = this.videocount;
    data['category_name'] = this.categoryname;
    data['category_image'] = this.categoryimage;

    return data;
  }
}

//call category
Future<List<Tvrler>> FetchTvrler() async {
  final response = await http.get(
    Uri.parse(adrisi + category + Api),
  );
  if (response.statusCode == 200) {
    final Map<String, dynamic> decodedJson = json.decode(response.body);

    if (decodedJson.containsKey('categories') &&
        decodedJson['categories'] is List) {
      // If 'items' is a key in your JSON and it's a list
      final List<dynamic> itemsList = decodedJson['categories'];

      return itemsList.map((itemJson) => Tvrler.fromJson(itemJson)).toList();
    } else {
      // Handle the case where 'items' is not a List
      throw Exception('Expected a list of items, but got something else.');
    }
  } else {
    throw Exception('Failed to load data');
  }
}

// category list

class category_list {
  int? videocount;
  String? categoryname;
  String? categoryimage;

  category_list({
    this.videocount,
    this.categoryname,
    this.categoryimage,
  });

  category_list.fromJson(Map<String, dynamic> json) {
    videocount = json['video_count'];
    categoryname = json['category_name'];
    categoryimage = json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_count'] = this.videocount;
    data['category_name'] = this.categoryname;
    data['category_image'] = this.categoryimage;

    return data;
  }
}
