import 'package:flutter/material.dart';
import 'package:final_app/models/HeroDC.dart';
import 'package:final_app/screens/detalle.dart';
import 'package:final_app/widget/superhero_avatar.dart';

class SuperHero extends StatelessWidget {
  HeroDC heroItem;

  SuperHero({
    Key key,
    @required this.heroItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(
            heroItem: heroItem,
          );
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  Hero(
                    tag: heroItem.id,
                    child: SuperheroAvatar(img: heroItem.image.url),
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${heroItem.name}",
                            style: textTheme.title,
                          ),
                          Text(
                            heroItem.name,
                            style: textTheme.subtitle.copyWith(
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                size: 18.0,
                              ),
                              SizedBox(
                                width: 2.0,
                              ),
                              Flexible(
                                child: Text(
                                  "${heroItem.biography.publisher}",
                                  style: textTheme.caption,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
