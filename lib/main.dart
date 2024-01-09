import 'package:flutter/material.dart';
import 'FoodMenu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApp",
      home: MyWidget(),
      theme: ThemeData(primaryColor: Colors.purple),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  List<FoodMenu> menu = [
    FoodMenu("chicken", "120", "assets/images/chicken.jpg"),
    FoodMenu("Fish", "500", "assets/images/fish.jpg"),
    FoodMenu("Beef", "139", "assets/images/cow.jpg"),
    FoodMenu("Pork", "80", "assets/images/pig.jpg")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two ISE Shop"),
        backgroundColor: Colors.purple[300],
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (BuildContext context, int index) {
          FoodMenu food = menu[index];
          return ListTile(
              leading: Image.asset(food.img),
              title: Text(
                food.name,
                style: TextStyle(fontSize: 30),
              ),
              subtitle: Text("Price " + food.price + " ฿"),
              onTap: () {
                _showDialog(context, food.name);
              });
        },
      ),
    );
  }

  void _showDialog(BuildContext context, String foodName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Food Selection"),
          content: Text("You are selected $foodName"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
