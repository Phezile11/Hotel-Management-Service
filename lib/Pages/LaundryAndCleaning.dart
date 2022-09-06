import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:intl/intl.dart';

class LaundryAndCleaning extends StatefulWidget {
  const LaundryAndCleaning({Key? key}) : super(key: key);

  @override
  State<LaundryAndCleaning> createState() => _LaundryAndCleaningState();
}

class _LaundryAndCleaningState extends State<LaundryAndCleaning> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();
  final List<Map<String, dynamic>> _items = [
    {
      'value': 'laundry',
      'label': 'Laundry',
      'icon': Icon(Icons.local_laundry_service),
    },
    {
      'value': 'cleaning',
      'label': 'Cleaning',
      'icon': Icon(Icons.cleaning_services_sharp),
    },
  ];

  @override
  void initState() {
    dateinput.text = "Please select date"; //set the initial value of text field
    timeinput.text = "Please select time"; //set the initial value of text field
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laundry And Cleaning"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SelectFormField(
              type: SelectFormFieldType.dropdown,
              // or can be dialog
              initialValue: 'laundry',

              items: _items,
              decoration: const InputDecoration(
                suffixIcon: Icon(
                  Icons.arrow_drop_down,
                ),
                labelText: 'Select Service',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => print(val),
              onSaved: (val) => print(val),
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: dateinput,
              decoration: const InputDecoration(
                labelText: "Date",
                border: OutlineInputBorder(),
              ),
              readOnly: true,
              //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  print(
                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  print(
                      formattedDate); //formatted date output using intl package =>  2021-03-16
                  //you can implement different kind of Date Format here according to your requirement

                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {
                  print("Date is not selected");
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: timeinput,
              decoration: const InputDecoration(
                labelText: "Time",
                border: OutlineInputBorder(),
              ),
              readOnly: true,  //set it true, so that user will not able to edit text
              onTap: () async {
                TimeOfDay? pickedTime =  await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                if(pickedTime != null ){
                  print(pickedTime.format(context));   //output 10:51 PM
                  DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                  //converting to DateTime so that we can further format on different pattern.
                  print(parsedTime); //output 1970-01-01 22:53:00.000
                  String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                  print(formattedTime); //output 14:59:00
                  //DateFormat() is from intl package, you can format the time on any pattern you need.

                  setState(() {
                    timeinput.text = formattedTime; //set the value of text field.
                  });
                }else{
                  print("Time is not selected");
                }
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: "Room Number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text("Submit"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(
                      40), // fromHeight use double.infinity as width and 40 is the height
                ))
          ],
        ),
      ),
    );
  }
}
