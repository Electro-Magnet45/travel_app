import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:why_book/components/cscaffold.dart';
import 'package:why_book/constrains.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  CScaffold build(BuildContext context) {
    final Color intColor = Colors.black.withOpacity(.5);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFF8F8F8), // navigation bar color
      statusBarColor: Color(0xFFF8F8F8), // status bar color
      statusBarBrightness: Brightness.dark, //status bar brigtness
      statusBarIconBrightness: Brightness.dark, //status bar Icon Brightness
      systemNavigationBarIconBrightness: Brightness.dark, //navigation bar icon
    ));
    return CScaffold(
      appBar: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(500),
            child: Image.network(
              'https://image.shutterstock.com/image-photo/beautiful-water-drop-on-dandelion-260nw-789676552.jpg',
              width: 62,
              height: 62,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Welcome",
                style: TextStyle(fontSize: 18, color: intColor),
              ),
              const Text("User Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600))
            ],
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Icon(Icons.notifications,
                  size: 32, color: Colors.black.withOpacity(.5)),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(50)),
              )
            ],
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, right: 40, bottom: 35),
              child: TextField(
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                decoration: InputDecoration(
                  prefixIcon: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.search,
                      color: intColor,
                      size: 32,
                    ),
                  ),
                  suffixIcon: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: secondaryColr,
                    ),
                    child: const Icon(
                      Icons.filter_list,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  hintText: " Search Destination",
                  hintStyle:
                      TextStyle(color: intColor, fontWeight: FontWeight.normal),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            hometitle("Upcoming"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  HomeListItem1(),
                  HomeListItem1(),
                  HomeListItem1(),
                  HomeListItem1(),
                ],
              ),
            ),
            const SizedBox(height: 40),
            hometitle("Recent"),
            const SizedBox(height: 10),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  HomeListItem2(),
                  HomeListItem2(),
                  HomeListItem2(),
                  HomeListItem2(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row hometitle(String title) {
    return Row(children: [
      Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const Spacer(),
      const Icon(Icons.more_horiz),
      const SizedBox(width: 30)
    ]);
  }
}

class HomeListItem1 extends StatelessWidget {
  const HomeListItem1({
    Key? key,
  }) : super(key: key);

  @override
  GestureDetector build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/trip-plan'),
      child: Container(
        margin: const EdgeInsets.only(right: 20, top: 20, bottom: 10, left: 10),
        padding: const EdgeInsets.all(10),
        height: 300,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 1),
                  spreadRadius: 1,
                  blurRadius: 10,
                  color: Colors.grey)
            ]),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(
                "https://picsum.photos/230",
                height: 190,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        'Canada',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_right, size: 34)
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text('30 March',
                      style: TextStyle(color: Colors.grey, fontSize: 17)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container homeListBack(Text textWidget) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white54.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50)),
        child: textWidget);
  }
}

class HomeListItem2 extends StatelessWidget {
  const HomeListItem2({Key? key}) : super(key: key);

  @override
  Container build(BuildContext context) {
    final Color intColor = Colors.black.withOpacity(.5);

    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 0.1, color: Colors.grey.withOpacity(0.7)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://picsum.photos/200',
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Telaga",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text("Bandung", style: TextStyle(color: intColor))
          ],
        )
      ]),
    );
  }
}
