import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_flutter/data/dummy_data.dart';
import 'package:food_app_flutter/model/meal.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  //final Meal meal;
  //const MealDetailsScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SlidingUpPanel(
        minHeight: (size.height / 2),
        maxHeight: (size.height / 1.2),
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                selectedMeal.title,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Affordable",
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "198",
                    // style: _textTheme.caption,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.schedule,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "10 min",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Simple',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(
                            text: "Ingredients".toUpperCase(),
                          ),
                          Tab(
                            text: "Preparation".toUpperCase(),
                          ),
                          Tab(
                            text: "details".toUpperCase(),
                          ),
                        ],
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.black,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelStyle: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              child: ListView.separated(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: selectedMeal.ingredients.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Text('⚫️ ' +
                                        selectedMeal.ingredients[index]),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return Divider(
                                      color: Colors.black.withOpacity(0.3));
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Container(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemCount: selectedMeal.steps.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 2.0,
                                      ),
                                      child: Text(
                                          '⚫️ ' + selectedMeal.steps[index]),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return Divider(
                                        color: Colors.black.withOpacity(0.3));
                                  },
                                ),
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('Complexity :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('Challenging',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('Affordability :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('Pricey',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('isGlutenFree :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('True',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('isLactoseFree :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('True',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('isVegan :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('True',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      /*Icon(
                                        Icons.work,
                                        size: 16.00,
                                      ),*/
                                      Text('isVegetarian :',
                                          style: TextStyle(fontSize: 16)),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text('False',
                                          style: TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  Divider(color: Colors.black.withOpacity(0.3)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    child: Image.network(
                      selectedMeal.imageUrl,
                      height: (size.height / 2) + 50,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 20,
                child: Icon(
                  Icons.bookmark_outline_rounded,
                  color: Colors.white,
                  size: 38,
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 38,
                ),
              )
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
    /*return Scaffold(

      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
      
        
       
      ),
      
      
      /*body: ListView.builder(
          itemCount: selectedMeal.ingredients.length,
          itemBuilder: (context, index) => Card(
                color: Theme.of(context).canvasColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              )),*/
    );*/
  }
}
