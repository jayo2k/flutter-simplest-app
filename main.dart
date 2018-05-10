import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/random_deals.dart';
import './navBar.dart';
import './pages/product.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
void main() => runApp(new Pennyfy());

class Pennyfy extends StatelessWidget{
    @override
    Widget build(BuildContext context){
        return new MaterialApp(
            theme : new ThemeData(
                primarySwatch : Colors.purple
            ),
            home : new Bar(),
            /*routes : <String, WidgetBuilder>{
                "/a" : (BuildContext context)=> new RandomDeal('DEALS'),
                "/b" : (BuildContext context) => new Bar()
            }*/
        );
    }
}
class Bar extends StatefulWidget{
    @override
    State createState() => new AllProd();
}

class AllProd extends State<Bar> with SingleTickerProviderStateMixin{
    List data = [];
    AnimationController anim;
    Animation<double> zoom;
    Future<String> getProducts() async {
        http.Response response = await http.post(
            "https://pennyfy.com/assets/phpserver/webse.php",
            headers : {"Content-type": "application/x-www-form-urlencoded"},
            body : {
                "products" : "0",
                "cat" : "0"
            }
        );
        this.setState(() {
            data = JSON.decode(response.body)['result'];
        });
        //print(data[1]['coming_id']);
        return response.body;
    }
    @override
    void initState(){
        super.initState();
        getProducts();
        anim = new AnimationController(
            vsync : this,
            duration : new Duration(milliseconds : 3000)
        );
        zoom = new CurvedAnimation(
            parent : anim,
            curve : Curves.easeOut
        );
        zoom.addListener( () => this.setState((){}));
        anim.forward();

    }

        
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar : new AppBar(
                title : new Text('PENNYFY',
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
            body : new GridView.extent(
                maxCrossAxisExtent : 250.0,
                children : buildCards(data.length, data, zoom, context)
            )
        );
    }
}
List<Widget>buildCards(n, data, anim, context){
        List<Container>container = new List<Container>.generate(n,
        (int index){
            final img = "https://pennyfy.com/assets/medium/${data[index]['coming_mainImg']}";
            return new Container(
                child : new Card(
                    elevation : 1.0,
                    child : new InkWell(
                        onTap : () {
                           Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder : (BuildContext context) =>
                                    new Product(data, index)
                                )
                            );
                        },
                        child : Column(
                            mainAxisSize : MainAxisSize.min,
                            mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                            children : <Widget>[
                                new Image.network(
                                    img,
                                    height : anim.value * 100,
                                    width : anim.value * 200
                                ),
                                new Padding(
                                    padding : const EdgeInsets.all(10.0),
                                    child : new Container(
                                        child : new Text(data[index]['coming_title'],
                                            style : new TextStyle(
                                                fontSize : 10.0,
                                                fontWeight : FontWeight.w300,
                                                color : Color(0xFF212121)
                                            )
                                        )
                                    )
                                ),
                                new Text(
                                    "\$ ${data[index]['coming_minPrice']}",
                                    style : new TextStyle(
                                        fontWeight : FontWeight.bold,
                                        color : Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5),
                                        fontSize : 20.0
                                    )
                                )
                            ]
                        ),
                    )
                )
            );
        });
        return container;
}