import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workshopflutter/home_notifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeNotifier(context: context),
      child: Consumer<HomeNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/cat.jpg",
                  repeat: ImageRepeat.repeat,
                ),
              ),
              Positioned(
                top: 60,
                left: 16,
                right: 16,
                bottom: 80,
                child: ListView(
                  reverse: true,
                  children: value.list
                      .map((e) => Column(
                            crossAxisAlignment: e.posisi == "kiri"
                                ? CrossAxisAlignment.start
                                : CrossAxisAlignment.end,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                  color: e.posisi == "kiri"
                                      ? const Color.fromARGB(255, 255, 255, 255)
                                      : Color.fromARGB(255, 214, 160, 160),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      e.chat,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      e.createdDate,
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 8,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ), // dah jadi yang dibackground
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 60,
                  color: Color.fromARGB(255, 214, 160, 160),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: Image.asset(
                          "assets/profile.jpg",
                          fit: BoxFit.cover,
                          height: 40,
                          width: 40,
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text("Cha Eun Wo"),
                      Spacer(),
                      Icon(
                        Icons.videocam,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.call,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  // height: 60,
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(255, 214, 160, 160),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: null,
                          controller: value.chat,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () => value.submit(),
                              child: Icon(Icons.send),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.camera_alt),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(Icons.mic),
                      SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
