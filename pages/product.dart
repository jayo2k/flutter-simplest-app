import 'package:flutter/material.dart';
import '../navBar.dart';
class Product extends StatelessWidget{
	final List data;
	final int i;
	Product(this.data, this.i);
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			appBar : new AppBar(
				title : new Text(data[i]['coming_title'],
					style : new TextStyle(
						fontSize : 40.0,
						color : Colors.white,
						fontStyle : FontStyle.italic
					)
				)
			),
			drawer : new Drawer(
				child : new NavBar()
			),
			body : new Container(
				child : new Center(
					child : new Text(data[i]['coming_title'])
				)
			)
		);
	}
}