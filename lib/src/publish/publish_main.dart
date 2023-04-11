import 'package:flutter/material.dart';
import 'widgets/NewPostScreen.dart';

class publish_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              title: Image.asset('assets/images/cool_stuff_light.png', height: 100),
              floating: true,
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: NewPostScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

