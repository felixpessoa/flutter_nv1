import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_nv1/widgets/custom_button_widget.dart';
import 'package:http/http.dart' as http;

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: const Center(
                child: Text(
                  'Container Central',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  color: Colors.red,
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Center(
                    child: Text(
                      'Container 1',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.purpleAccent,
                  height: 100,
                  width: MediaQuery.of(context).size.width / 2,
                  child: const Center(
                    child: Text(
                      'Container 2',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonWidget(
                    disable: false,
                    titleSize: 18,
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context) => const TwoPage()),
                      // );
                      Navigator.of(context)
                          .pushNamed('/list', arguments: 'Home')
                          .then((value) => print(value));
                    },
                    title: 'Custom BTN',
                  ),
                  CustomButtonWidget(
                    disable: false,
                    titleSize: 18,
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/twoPage', arguments: 'Home')
                          .then((value) => print(value));
                    },
                    title: 'Random',
                  ),
                  CustomButtonWidget(
                    disable: false,
                    onPressed: () {
                      callAPI();
                    },
                    title: 'Get API',
                    titleSize: 18,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: Listenable.merge([posts, inLoaded]),
              // ValueListenableBuilder<List<Post>>(
              //   valueListenable: posts,
              builder: (_, __) => inLoaded.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: posts.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(posts.value[index].title),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  factory Post.fromJson(Map json) {
    return Post(json['userId'], json['id'], json['title'], json['body']);
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'id: $id';
  }
}
