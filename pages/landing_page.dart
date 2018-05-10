import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:async';
class LandingPage extends StatelessWidget{
	@override
	Widget build(BuildContext context){
		return new Material(
			child : new InkWell(
				onTap : () => print("taped"),
				child : new Column(
					mainAxisAlignment : MainAxisAlignment.center,
					children : <Widget>[
						new Text(
							"PENNYFY",
							style : new TextStyle(
								color : Colors.grey,
								fontSize : 50.0,
								fontWeight : FontWeight.bold,
								fontStyle : FontStyle.italic 
							)
						),
						new MaterialButton(
							color : Colors.blueAccent,
							textColor : Colors.white,
							child : new Text(
								"Products!"
							),
							height : 40.0,
							splashColor : Colors.grey[50],
							onPressed : (){}
						)
					]
				)
			)
		);
	}
}