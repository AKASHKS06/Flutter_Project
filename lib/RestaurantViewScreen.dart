import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RestaurantViewScreen(),
    );
  }
}

class RestaurantViewScreen extends StatefulWidget {
  @override
  _RestaurantViewScreenState createState() => _RestaurantViewScreenState();
}

class _RestaurantViewScreenState extends State<RestaurantViewScreen> {
  final Color backgroundColor = Color(0xFFF5E6C9);
  final Color bottomBarColor = Color(0xFF3C260C);

  String selectedCategory = 'Biryani';
  Map<String, int> counters = {
    'Hyderabadi Biryani': 0,
    'Dum Biryani': 0,
    // Add more dishes here
  };

  void incrementCounter(String dish) {
    setState(() {
      counters[dish] = counters[dish]! + 1;
    });
  }

  void decrementCounter(String dish) {
    setState(() {
      if (counters[dish]! > 0) {
        counters[dish] = counters[dish]! - 1;
      }
    });
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Restaurant View', style: TextStyle(color: Colors.brown)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.brown),
            onPressed: () {
              // Handle more options press
            },
          ),
        ],
      ),
      body: Container(
        color: backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/restr/chef.jpg', // replace with your image
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Reddy’s Kitchen',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Enjoy the finest, most aromatic biryanis, made with premium spices and ingredients. Every bite is a flavorful journey. Order Now for a taste experience like no other!',
                      style: TextStyle(fontSize: 14, color: Colors.brown),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.red),
                        SizedBox(width: 4),
                        Text('4.7', style: TextStyle(color: Colors.brown)),
                        SizedBox(width: 16),
                        Icon(Icons.delivery_dining, color: Colors.red),
                        SizedBox(width: 4),
                        Text('Free', style: TextStyle(color: Colors.brown)),
                        SizedBox(width: 16),
                        Icon(Icons.timer, color: Colors.red),
                        SizedBox(width: 4),
                        Text('20 min', style: TextStyle(color: Colors.brown)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () => selectCategory('Biryani'),
                          child: Chip(
                            label: Text('Biryani'),
                            backgroundColor: selectedCategory == 'Biryani' ? Colors.red : Colors.grey[200],
                            labelStyle: TextStyle(
                                color: selectedCategory == 'Biryani' ? Colors.white : Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => selectCategory('Pulao'),
                          child: Chip(
                            label: Text('Pulao'),
                            backgroundColor: selectedCategory == 'Pulao' ? Colors.red : Colors.grey[200],
                            labelStyle: TextStyle(
                                color: selectedCategory == 'Pulao' ? Colors.white : Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => selectCategory('Dal'),
                          child: Chip(
                            label: Text('Dal'),
                            backgroundColor: selectedCategory == 'Dal' ? Colors.red : Colors.grey[200],
                            labelStyle: TextStyle(
                                color: selectedCategory == 'Dal' ? Colors.white : Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => selectCategory('Chicken'),
                          child: Chip(
                            label: Text('Chicken'),
                            backgroundColor: selectedCategory == 'Chicken' ? Colors.red : Colors.grey[200],
                            labelStyle: TextStyle(
                                color: selectedCategory == 'Chicken' ? Colors.white : Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      selectedCategory,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                              child: Image.asset(
                                'assets/images/restr/hyderabadi_biryani.jpg', // replace with your image
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hyderabadi Biryani',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                                  ),
                                  Text('High Spice', style: TextStyle(color: Colors.brown)),
                                  Text('Rs. 150/-', style: TextStyle(color: Colors.brown)),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: IconButton(
                                          icon: Icon(Icons.remove, color: Colors.white),
                                          onPressed: () => decrementCounter('Hyderabadi Biryani'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          counters['Hyderabadi Biryani'].toString(),
                                          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: IconButton(
                                          icon: Icon(Icons.add, color: Colors.white),
                                          onPressed: () => incrementCounter('Hyderabadi Biryani'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
                              child: Image.asset(
                                'assets/images/restr/dum_biryani.jpg', // replace with your image
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Dum Biryani',
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                                  ),
                                  Text('Mild Spice', style: TextStyle(color: Colors.brown)),
                                  Text('Rs. 150/-', style: TextStyle(color: Colors.brown)),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: IconButton(
                                          icon: Icon(Icons.remove, color: Colors.white),
                                          onPressed: () => decrementCounter('Dum Biryani'),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Text(
                                          counters['Dum Biryani'].toString(),
                                          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold, fontSize: 16),
                                        ),
                                      ),
                                      CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: IconButton(
                                          icon: Icon(Icons.add, color: Colors.white),
                                          onPressed: () => incrementCounter('Dum Biryani'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        backgroundColor: bottomBarColor,
        onTap: (index) {
          // Handle bottom navigation bar tap
        },
      ),
    );
  }
}
