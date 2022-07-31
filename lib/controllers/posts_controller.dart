import 'dart:convert';


import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

import '../models/posts_model.dart';


class PostsController{
  ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoaded = ValueNotifier<bool>(false);
  callAPI() async {
    var client = http.Client();
    try {
      inLoaded.value = true;
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var decodedResponse = jsonDecode(response.body) as List;
      posts.value = decodedResponse.map((e) => Post.fromJson(e)).toList();
      await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoaded.value = false;
    }
  }
}