import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:workshopflutter/models/chat_new_model.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;
  final Gemini gemini = Gemini.instance;

  HomeNotifier({required this.context}) {
    // getData();
  }

  TextEditingController chat = TextEditingController();
  List<String> listChat = [];
  var no = 1;
  submit() {
    no++;
    ChatNewModel chats = ChatNewModel(
        id: no,
        posisi: "kanan",
        chat: chat.text,
        createdDate: DateTime.now().toString(),
        type: '"text',
        status: "receive");
    //list.add(chats);
    list = [chats, ...list];
    chat.clear();

    gemini.streamGenerateContent(chats.chat).listen((e) {
      ChatNewModel response = ChatNewModel(
          id: no + 1,
          posisi: "kiri",
          chat: e.content!.parts
                  ?.fold("", (before, after) => "$before ${after.text}") ??
              "",
          createdDate: DateTime.now().toString(),
          type: "text",
          status: "receive");
      list = [response, ...list];
      // chat.text = value;
      notifyListeners();
    });
  }

  List<ChatNewModel> list = [];
  getData() async {
    Dio dio = Dio();
    final response = await dio
        .get("https://tegaldev.metimes.id/chat-sample#downloadJSON=true");
    final data = jsonDecode(response.data);
    //print(data['data']);
    for (Map<String, dynamic> i in data['data']) {
      list.add(ChatNewModel.fromJson(i));
      // id: i['id'],
      // posisi: i['posisi'],
      // chat: i['chat'],
      // createdDate: i['createdDate'],
      // type: i['type'],
      // status: i['status']
      // ));
    }
    print(list.length);
    notifyListeners();
  }
}

class ChatModel {
  final int id;
  final String posisi;
  final String chat;
  final String createdDate;
  final String type;
  final String status;

  ChatModel(
      {required this.id,
      required this.posisi,
      required this.chat,
      required this.createdDate,
      required this.type,
      required this.status});
}
