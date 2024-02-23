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
            Divider(height: 1, color: Colors.grey),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              itemBuilder: (context, index) {
                List<String> userNames = [
                  'John Paul Santos',
                  'Noel Gueco',
                  'Russel Guisihan',
                  'Santiago Quiambao',
                  'Juan Dela Cruz',
                  // Add more names as needed
                ];

                if (index >= 0 && index < userNames.length) {
                  return Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage('https://source.unsplash.com/featured/?philippines'),
                          ),
                          title: Text(userNames[index]),
                          subtitle: Text('Location $index'),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Container(
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('https://picsum.photos/400/300?random=$index'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 8),
                              Icon(Icons.comment),
                              SizedBox(width: 8),
                              Icon(Icons.send),
                              Spacer(),
                              Icon(Icons.bookmark_border),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            'Liked by Alden, Eidrei, and 23 others',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 4),
                        Padding(
                          padding: EdgeInsets.symmetric
                            (horizontal: 12.0),
                          child: Text('Love it. #NoelLangSakalam #Walang Forever'),
                        ),
                        SizedBox(height: 8),
                        Divider(height: 1, color: Colors.grey),
                      ],
                    ),
                  );
                } else {
                  // Handle index out of range
                  return SizedBox.shrink(); // or return an empty widget
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Instagram',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Add onPressed logic for the heart icon
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Add onPressed logic for the message icon
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add_box),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                  'https://yt3.googleusercontent.com/ytc/AIf8zZR2NKwzfg09cmpTtQMgooVzxtXM1MeBvIKzt726Yg=s900-c-k-c0x00ffffff-no-rj'),
            ),
          ],
        ),
      ),
    );
  }
}
