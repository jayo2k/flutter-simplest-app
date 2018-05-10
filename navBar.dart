import 'package:flutter/material.dart';
import './pages/landing_page.dart';
import './pages/random_deals.dart';
import './pages/product.dart';
import './main.dart';
import './pages/login.dart';
class NavBar extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new Drawer(
            child : new ListView(
                children: <Widget>[
                    new UserAccountsDrawerHeader(
                        accountName : new Text("moi"),
                        accountEmail : new Text("abc@xyz.com"),
                        currentAccountPicture : new CircleAvatar(
                            backgroundColor : Colors.white,
                            child : new Text("J")
                        )
                    ),
                    new ListTile(
                        title : new Text('LOGIN'),
                        trailing : new Icon(Icons.home),
                        onTap : () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder : (BuildContext context) => 
                                    new Login("LOG!")
                                )
                            );
                        }
                    ),
                    new ListTile(
                        title : new Text('RANDOM DEALS!'),
                        trailing : new Icon(Icons.home),
                        onTap : () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder : (BuildContext context) =>
                                    new RandomDeal("DEALS")
                                )
                            );
                        }
                    ),
                    new Divider(),
                    /*new ListTile(
                        title : new Text('FOOTWEAR'),
                        onTap : () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                                new MaterialPageRoute(
                                    builder : (BuildContext context) =>
                                    new Product("Product")
                                )
                            );
                        }
                    )*/
                ]
            )
        );
    }
}
