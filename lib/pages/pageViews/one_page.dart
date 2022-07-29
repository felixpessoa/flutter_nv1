import 'package:flutter/material.dart';
import 'package:flutter_nv1/pages/pageViews/two_page.dart';

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Column(
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
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
                child: Center(
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
                child: Center(
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
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => const TwoPage()),
                // );
                Navigator.of(context)
                    .pushNamed('/twoPage', arguments: 'Home')
                    .then((value) => print(value));
              },
              child: Text('Ir para Segunda Page'),
            ),
            
          ),      
        ],
      ),
    );
  }
}
