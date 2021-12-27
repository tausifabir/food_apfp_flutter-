import 'package:flutter/material.dart';
import 'package:food_app_flutter/data/dummy_data.dart';
import 'package:food_app_flutter/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Foods Category'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            children: DUMMY_CATEGORIES
                .map(
                  (e) => CategoryItem(
                    e.id,
                    e.title,
                    e.color,
                  ),
                )
                .toList(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
          ),
        ));
  }
}
