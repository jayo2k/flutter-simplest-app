import 'package:flutter/material.dart';
import '../main.dart';
class Login extends StatelessWidget {
	final String title;
	Login(this.title);
	@override
	Widget build(BuildContext context){
		return new MaterialApp(
			home : new Content(),
			theme : new ThemeData(primarySwatch : Colors.red)
		);
	}
}
class Content extends StatefulWidget{
	@override
	State createState() => new LoginPageState();
}

class LoginPageState extends State<Content> with SingleTickerProviderStateMixin{
	AnimationController anim;
	Animation<double> iconAnim;

	@override
	void initState(){
		super.initState();
		anim = new AnimationController(
			vsync : this,
			duration : new Duration(milliseconds : 400)
		);
		iconAnim = new CurvedAnimation(
			parent : anim,
			curve : Curves.easeOut
		);
		iconAnim.addListener( ()=> this.setState((){}));
		anim.forward();
	}
	@override
	Widget build(BuildContext context){
		return new Scaffold(
			backgroundColor : Colors.greenAccent,
			body : new Stack(
				fit : StackFit.expand,
				children : <Widget>[
					new Image.network(
  						'http://sherwoodtaxi.ca/wp-content/uploads/2017/08/home-hero2-880-510-880x510.png',
						fit : BoxFit.cover,
						color : Colors.black87,
						colorBlendMode : BlendMode.darken
					),
					new Column(
						mainAxisAlignment : MainAxisAlignment.center,
						children : <Widget>[
							new FlutterLogo(
								size : iconAnim.value * 100
							),
							new Form(
								child: new Theme(
									data: new ThemeData(
										brightness : Brightness.dark,
										primarySwatch : Colors.teal,
										inputDecorationTheme : new InputDecorationTheme(
											labelStyle : new TextStyle(
												color : Colors.teal, 
												fontSize : 80.0
											)
										)
									),
									child : new Container(
										padding : const EdgeInsets.all(40.0),
										child : new Column(
											crossAxisAlignment : CrossAxisAlignment.center,
											children :<Widget>[
												new TextFormField(
													decoration : new InputDecoration(
														hintText : "Your Email"
													),
													keyboardType : TextInputType.emailAddress
												),
												new TextFormField(
													decoration : new InputDecoration(
														hintText : "Your Password"
													),
													keyboardType : TextInputType.text,
													obscureText : true
												),
												new Padding(
													padding : const EdgeInsets.only(top : 30.0)
												),
												new MaterialButton(
													color : Colors.teal,
													height : 45.0,
													textColor : Colors.white,
													child : new Icon(
														Icons.home
													),
													onPressed : ()=>{},
													splashColor : Colors.redAccent
												)
											]
										)
									)
								)
							)
						]
					)
				]
			)
		);
	}
}