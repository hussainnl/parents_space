import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _CourseState();
}

List name = [
  "Class Room A1",
  "Ask For Help",
  "Math teacher",
  "English teacher",
  "Arabic teacher",
  "Science teacher",
  "Tech teacher",
  "Friend parents",
];

class _CourseState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Chat"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .7837,
        child: ListView.builder(
          itemCount: name.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: const EdgeInsets.only(right: 5, left: 5),
              // leading: ClipRRect(
              //   borderRadius: BorderRadius.circular(50),
              //   child: Image.network(
              //       "https://scontent.fcai20-4.fna.fbcdn.net/v/t39.30808-6/376238128_122110793414026055_9069637272886975608_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeGM76H28G692BA9KibR5y4xdO9S6M23Lrd071LozbcutyeRzduwBABjQJtdytNcIbKepM2aimZM6DecjiL5tGBj&_nc_ohc=R4fdKpB7sjcQ7kNvgHjcsgr&_nc_ht=scontent.fcai20-4.fna&cb_e2o_trans=t&oh=00_AfCvZ6rfdkNUbC3uA75twICmyEqg-BFPoslp6XxSQ5Eq7A&oe=663D7839"),
              // ),
              title: Text(
                name[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(.7),
                ),
              ),
              subtitle: Text(
                name[index],
                style: const TextStyle(fontSize: 14),
              ),
            );
          },
        ),
      ),
    );
  }
}
