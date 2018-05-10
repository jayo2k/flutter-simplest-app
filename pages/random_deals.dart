import 'package:flutter/material.dart';
import '../navBar.dart';
class RandomDeal extends StatelessWidget{
	final String title;
	RandomDeal(this.title);
	@override
	Widget build(BuildContext context){
		return new Scaffold(
            appBar : new AppBar(
                title : new Text(title,
                    style : new TextStyle(
                        fontSize : 40.0,
                        color : Colors.white,
                        fontStyle : FontStyle.italic
                    )
                ),//title
            ),//appBar
            drawer : new Drawer(
                child : new NavBar()
            ),
            body : new Container(
                child : new Center(
                    child : new Text(
							title,
							style : new TextStyle(
								color : Colors.grey,
								fontSize : 50.0,
								fontWeight : FontWeight.bold,
								fontStyle : FontStyle.italic 
							)
						),
                )
            )
        );
	}
}