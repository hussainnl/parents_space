import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parent_space_new/Screens/postscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ClipRRect> catImagex = [
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
    ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.tealAccent,
        )),
  ];
  int pagen = 0;
  late final PageController pageController;
  Timer? carasoulTimer;
  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pagen == 5) {
        pagen = 0;
      }

      // تحقق من أن pageController مرتبط بعنصر واجهة رسومية قبل استخدامه
      if (pageController.hasClients) {
        pageController.animateToPage(
          pagen,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      }
      pagen++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: .8);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carasoulTimer = getTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "School",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: Container(
              padding: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.teal, width: 3)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: PageView.builder(
                            controller: pageController,
                            onPageChanged: (index) {
                              pagen = index;
                              setState(() {});
                            },
                            itemBuilder: (context, index) {
                              return AnimatedBuilder(
                                animation: pageController,
                                builder: (context, child) {
                                  return child!;
                                },
                                child: GestureDetector(
                                    onTap: () {
                                      //TODO : CERTAIN ACTIVITY
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("${index + 1} Page")));
                                    },
                                    onPanDown: (details) {
                                      carasoulTimer?.cancel();
                                      carasoulTimer = null;
                                    },
                                    onPanCancel: () {
                                      carasoulTimer = getTimer();
                                    },
                                    child: catImagex[index]),
                              );
                            },
                            itemCount: catImagex.length,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            catImagex.length,
                            (index) => Container(
                                  padding: const EdgeInsets.only(bottom: 7),
                                  margin: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(Icons.circle,
                                        size: 12,
                                        color: pagen == index
                                            ? Colors.teal
                                            : Colors.teal[200]),
                                  ),
                                )),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      color: Colors.teal[200],
                      height: MediaQuery.of(context).size.height * 0.005),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 7, right: 7, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: Colors.blueAccent,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PostScreen()));
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * .8,
                              height: MediaQuery.of(context).size.height * .050,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.black)),
                              child: Center(
                                  child: Text(
                                "Post........                                               ",
                                style: TextStyle(fontSize: 17),
                              )),
                            ),
                          ),
                        ],
                      )
                      //     TextField(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => PostScreen()));
                      //   },
                      //   onChanged: (value) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => PostScreen()));
                      //   },
                      //   decoration: InputDecoration(
                      //       hintText:
                      //           "Post........                                               ",
                      //       hintStyle: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black,
                      //       ),
                      //       filled: true,
                      //       fillColor: Colors.white,
                      //       border: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.black),
                      //           borderRadius: BorderRadius.circular(50))),
                      // ),
                      ),
                  Container(
                      margin: EdgeInsets.only(
                        top: 5,
                      ),
                      color: Colors.teal[200],
                      height: MediaQuery.of(context).size.height * 0.005),
                  // Image.network(
                  //   'https://scontent.fcai20-3.fna.fbcdn.net/v/t39.30808-6/441454169_122176751228026055_2000996809477321238_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=5f2048&_nc_ohc=1_c1skx2J8sQ7kNvgHQ56Dd&_nc_ht=scontent.fcai20-3.fna&cb_e2o_trans=t&oh=00_AfAraeIC5b85hdx9Q43cKzmjwnCFoynRoxWelUaxF-ByLA&oe=664168FF',
                  // ),
                  Container(
                      color: Colors.teal[200],
                      height: MediaQuery.of(context).size.height * 0.005),
                  // Image.network(
                  //   'https://scontent.fcai20-2.fna.fbcdn.net/v/t39.30808-6/441963718_122176751288026055_3450364089623076644_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=5f2048&_nc_ohc=6oSjglz3DowQ7kNvgF90za8&_nc_ht=scontent.fcai20-2.fna&cb_e2o_trans=t&oh=00_AfAg3TXKO5qcV3LCHP8vS3GbsE1KDD0eI4kA-CR-xc78Xw&oe=66415575',
                  // ),
                  Container(
                      color: Colors.teal[200],
                      height: MediaQuery.of(context).size.height * 0.005),
                  // Image.network(
                  //   'https://scontent.fcai20-6.fna.fbcdn.net/v/t39.30808-6/441461836_122176751258026055_3749370986076182452_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=5f2048&_nc_ohc=-tiAPusYZsIQ7kNvgFXlu8p&_nc_ht=scontent.fcai20-6.fna&cb_e2o_trans=t&oh=00_AfBixS0c1BEmNd_tK4ADZWBbvjueIh8SW7dUmWTMi048VA&oe=66414DF1',
                  // )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
