

import 'package:flutter/material.dart';
import 'package:flutter_nv1/controllers/posts_controller.dart';
import 'package:flutter_nv1/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
  
  final PostsController _controller = PostsController();

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
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
                      _controller.callAPI();
                    },
                    title: 'Get API',
                    titleSize: 18,
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: Listenable.merge([_controller.posts, _controller.inLoaded]),
              // ValueListenableBuilder<List<Post>>(
              //   valueListenable: posts,
              builder: (_, __) => _controller.inLoaded.value
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _controller.posts.value.length,
                      itemBuilder: (_, index) => ListTile(
                        title: Text(_controller.posts.value[index].title),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}


