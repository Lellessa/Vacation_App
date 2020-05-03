import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacation_app/place_page.dart';
import 'constants.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vacation App',
      theme: ThemeData(
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: MediaQuery.of(context).padding,
        child: Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text('Your next trip', style: TextStyle(fontSize: mainTitleSize,),),
                      ),

                      // TOP DESTINATIONS
                      Column(
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Top destinations', style: subtitleStyle,),
                                Text('See all', style: seeAllStyle)
                              ],
                            ),
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                PlaceCard(name: 'Italy', img: 'assets/images/italy_img.jpg', attractions: '27',),
                                PlaceCard(name: 'Canada', img: 'assets/images/canada_img.jpg', attractions: '32',),
                                PlaceCard(name: 'French', img: 'assets/images/french_img.jpg', attractions: '45',),
                                PlaceCard(name: 'Moscow', img: 'assets/images/moscow_img.jpg', attractions: '12',),
                                PlaceCard(name: 'Rome', img: 'assets/images/rome_img.jpg', attractions: '21',),
                              ],
                            ),
                          ),

                        ],
                      ),

                      SizedBox(height: 20.0,),

                      //BEAUTIFUL CITIES
                      Column(
                        children: <Widget>[

                          Container(
                            padding: EdgeInsets.only(right: 20.0),
                            margin: EdgeInsets.only(bottom: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('Beautiful cities', style: subtitleStyle),
                                Text('See all', style: seeAllStyle),
                              ],
                            ),
                          ),

                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                SecondaryPlaceCard(name: 'Paris', img: 'assets/icons/eiffel_tower.svg',),
                                SecondaryPlaceCard(name: 'Rome', img: 'assets/icons/coliseum.svg',),
                                SecondaryPlaceCard(name: 'Rio', img: 'assets/icons/cristo_redentor.svg',),
                                SecondaryPlaceCard(name: 'Moscow', img: 'assets/icons/saint_basil.svg',),
                                SecondaryPlaceCard(name: 'Japan', img: 'assets/icons/japan.svg',),
                                SecondaryPlaceCard(name: 'London', img: 'assets/icons/london.svg',),
                                SecondaryPlaceCard(name: 'America', img: 'assets/icons/america.svg',),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20.0, 15.0, 40.0, 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: SvgPicture.asset('assets/icons/search.svg', height: 30.0, color: mainColor),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: (){},
                        icon: SvgPicture.asset('assets/icons/star.svg', height: 50.0, color: mainGrey,),
                      ),
                    ),
                    IconButton(
                      onPressed: (){},
                      icon: SvgPicture.asset('assets/icons/user.svg', height: 50.0, color: mainGrey),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryPlaceCard extends StatelessWidget {

  String name, img;

  SecondaryPlaceCard({this.name, this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.0,
      width: 120.0,
      margin: EdgeInsets.only(right: 20.0),

      decoration: BoxDecoration(
        color: secondaryCardColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(img, color: mainColor, height: 80,),
          SizedBox(height: 10.0,),
          Text(name, style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}

class PlaceCard extends StatefulWidget {

  String name, img, attractions;

  PlaceCard({this.name, this.img, this.attractions});

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {

    changeFavorite() {
      setState(() {
        isFavorite = !isFavorite;
      });
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlacePage(name: this.widget.name, img: this.widget.img, attractions: this.widget.attractions, isFavorite: this.isFavorite, function: changeFavorite)));
      },
      child: Container(
        height: 270.0,
        width: 220.0,
        padding: EdgeInsets.fromLTRB(15, 15, 15, 35),
        margin: EdgeInsets.only(right: 20.0),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            image: AssetImage(widget.img),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Favorite(isFavorite: isFavorite, function: changeFavorite,),

            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.name, style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),),
                  Row(
                    children: <Widget>[
                      
                      SvgPicture.asset('assets/icons/marker.svg', height: 15.0, color: Colors.white,),
                      Text('  '+widget.attractions+' attractions', style: TextStyle(color: Colors.white),)

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

class Favorite extends StatefulWidget {

  bool isFavorite;
  Function function;
  double pad;

  Favorite({this.isFavorite, this.function, this.pad = 2.0});

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Container(
        padding: EdgeInsets.all(widget.pad),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: (widget.isFavorite)?mainColor:mainColorWithOpacity
        ),
        child: (widget.isFavorite)?Icon(Icons.star, color: Colors.white,)
        :Icon(Icons.star_border, color: opacityWhite,)
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.pop(context),
      child: Container(
        padding: EdgeInsets.all(3.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.black38,
        ),
        child: Icon(Icons.keyboard_arrow_left, size: 35.0, color: Colors.white,)
      ),
    );
  }
}