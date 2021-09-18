import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../utils/app_utils.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.white,
        child: StaggeredGridView.countBuilder(
          staggeredTileBuilder: (index) => index % 7 == 0
              ? StaggeredTile.count(2, 2)
              : StaggeredTile.count(1, 2),
          // StaggeredTile.count(2, 1), // 2 blocks in width and 1 blocks in height
          // StaggeredTile.count(2, index.isEven ? 2 : 1),
          mainAxisSpacing: 8, // vertical spacing between items
          crossAxisSpacing: 8, // horizontal spacing between items
          crossAxisCount: 3, // no. of virtual columns in grid
          itemCount: 60,
          itemBuilder: (context, index) => buildImageCard(index, context),
        ),
      );

  Widget buildImageCard(int index, BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          AppUtils.openFull(
              context, 'https://source.unsplash.com/random?sig=$index');
        },
        child: Card(
          color: Colors.white,
          // margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            margin: EdgeInsets.all(4),
            child: ClipRRect(
                // clip the image to a circle
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://source.unsplash.com/random?sig=$index',
                  fit: BoxFit.cover,
                )),
          ),
        ),
      );
}
