giimport 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class CourseInfo extends StatelessWidget {





  /*void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDetailScreen.routName, arguments: id)
        .then((result) {
      if (result != null) removeItem(result);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    ,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      child: Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 26),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text("$duration minute")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text("$compixityText")
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("$affordabilityText")
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
