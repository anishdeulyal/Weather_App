import 'package:flutter/material.dart';

import 'FormPage.dart';

class classtask extends StatefulWidget {
  final String title;

  const classtask({super.key, required this.title});

  @override
  State<classtask> createState() => _classtaskState();
}

class _classtaskState extends State<classtask> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => FormPage(key: FormPageState.formPageKey)),
        );
      }
    });
  }

  var images = [
    "1.jpg",
    "salaar.jpg",
    "nature.jpg",
    "poster1.png",
    "logo.png",
    "logo3.png",
    "story.png",
    "story2.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Social',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: Icon(Icons.favorite_border, color: Colors.black)),
          IconButton(
              onPressed: null,
              icon: Icon(Icons.message_rounded, color: Colors.black))
        ],
      ),
      body: Column(
        children: [storyList(), Expanded(child: postList())],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        onTap: onTabTapped,
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
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget postDesign(String images) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45,
                      width: 45,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("images/$images"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("Anish"), Text("Deulyal")],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.more_vert),
              )
            ],
          ),
          Expanded(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("images/$images"),
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Widget storyItem() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.cyan,
            width: 3.0, // Width of the border
          ),
        ),
        child: CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("images/alfred.jpg"),
        ),
      ),
    );
  }

  Widget storyList() {
    return Container(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return storyItem();
          }),
    );
  }

  Widget postList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return postDesign(images[index]);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.0,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0, // Spacing between columns
        ),
      ),
    );
  }
}
