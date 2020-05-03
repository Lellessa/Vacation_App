import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacation_app/constants.dart';
import 'main.dart';

class PlacePage extends StatefulWidget {

  String img, name, attractions;
  bool isFavorite;
  Function function;

  PlacePage({this.img, this.name, this.isFavorite, this.function, this.attractions});

  @override
  _PlacePageState createState() => _PlacePageState();
}

class _PlacePageState extends State<PlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: MediaQuery.of(context).padding,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.img),
            fit: BoxFit.cover
          )
        ),

        child: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Container(
                padding: EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    CustomBackButton(),

                    Favorite(isFavorite: widget.isFavorite, pad: 8.0,
                      function: (){
                        setState(() {
                          widget.isFavorite = !widget.isFavorite;
                        });
                        widget.function();
                      },
                    ),        

                  ],
                ),
              ),

              //SPACE
              Expanded(
                child: Container(),
              ),

              //NAME AND ATTRCTIONS
              Text(widget.name, style: TextStyle(fontSize: mainTitleSize, fontWeight: FontWeight.bold, color: Colors.white),),
              Row(
                children: <Widget>[
                  SvgPicture.asset('assets/icons/marker.svg', height: 16.0, color: Colors.white,),
                  Text('  '+widget.attractions+' attractions', style: TextStyle(fontSize: 16.0, color: Colors.white),)
                ],
              ),
              SizedBox(height: 20.0,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    CardAttraction(name: 'Moraine Lake', img: 'assets/images/rome_img.jpg',),
                    CardAttraction(name: 'Stanley Park', img: 'assets/images/canada_img.jpg',),
                    CardAttraction(name: 'Banff Park', img: 'assets/images/french_img.jpg',),
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_up, size: 25.0, color: Colors.white,),
                    Text('More', style: TextStyle(fontSize: 18.0, color: Colors.white),)
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

class CardAttraction extends StatelessWidget {

  String img, name;

  CardAttraction({this.img, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      margin: EdgeInsets.only(right: 20.0),
      padding: EdgeInsets.only(bottom: 10.0, left: 5.0),
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.white),
        image: DecorationImage(
          image: AssetImage(img),
          fit: BoxFit.cover
        ),
      ),
      child: Text(name, style: TextStyle(color: Colors.white, fontSize: 16.0),),
    );
  }
}
