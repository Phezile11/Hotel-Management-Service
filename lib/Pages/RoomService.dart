import 'package:flutter/material.dart';
import 'package:hotel_management_system/Pages/ServiceCard.dart';

class RoomService extends StatefulWidget {
  const RoomService({Key? key}) : super(key: key);

  @override
  State<RoomService> createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {

  void handleCard(int index) {
    String ServiceName = Services[index].name;

    switch (ServiceName) {
      case "Order Food":
        {

          Navigator.pushNamed(context, "/Service",arguments: ServiceName);
          print(ServiceName);

        }
        break;
      case "Maintenance":
        {
          Navigator.pushNamed(context, "/Service",arguments: ServiceName);
          print(ServiceName);
        }
        break;
      case "Cleaning And Laundry":
        {
          Navigator.pushNamed(context, "/LaundryAndCleaning");
          print(ServiceName);
        }
        break;
      default:
        {
          return;
        }
    }
  }

  List<ServiceCard> Services = [
    ServiceCard(name: "Order Food", icon: Icons.fastfood),
    ServiceCard(name: "Maintenance", icon: Icons.car_repair),
    ServiceCard(
        name: "Cleaning And Laundry", icon: Icons.cleaning_services_sharp),
    ServiceCard(name: "Nearby Attractions ", icon: Icons.place),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Room Service",
            style: TextStyle(),
          ),
        ),
      ),
      body: Container(
        child: Container(
          child:Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 15.0,
              children: List.generate(
               Services.length,
                    (index) => SizedBox(
                  height: 100.0,
                  child: InkWell(
                    onTap: () {
                      handleCard(index);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Center(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 60.0,
                                child: Icon(
                                  Services[index].icon,
                                  size: 60.0,
                                  color: const Color(0xff31AFB4),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(
                                Services[index].name,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ).toList(),
            ),
          )

        ),
      ),
    );
  }
}


// You can pass any object to the arguments parameter.

// In this example, create a class that contains both

// a customizable title and message.



