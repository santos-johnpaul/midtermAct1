import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "InstagramFont", // Set a custom font family
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Customize the color as needed
          ),
          // Add more text styles as needed
        ),
      ),
      home: InstagramScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InstagramScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 11, // Increase itemCount by 1
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // First item with "+"
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.orange, width: 2),
                            ),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.grey,
                                  child: Center(
                                    child: Text(
                                        '+',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Add',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  } else {
                    // Rest of the items from the list
                    List<String> names = [
                      'Rhea',
                      'Clarq',
                      'Cheennee',
                      'Ralf',
                      'Nikhos',
                      'Stephen',
                      'Mark James',
                      'PIPI Jones',
                      'Russel',
                      'Santiago'
                    ];

                    String userName = names[(index - 1) % names.length]; // Cycle through the list
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.orange, width: 2),
                            ),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage('https://picsum.photos/200?random=$index'),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            userName,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
