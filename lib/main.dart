import 'package:flutter/material.dart';
import 'package:hotel_management_system/Pages/LaundryAndCleaning.dart';
import 'package:hotel_management_system/Pages/RoomService.dart';
import 'package:hotel_management_system/Pages/Service.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=> const RoomService(),
      "/Service":(context)=> const Service(),
      "/LaundryAndCleaning":(context)=> const LaundryAndCleaning(),
    },
  ));
}

