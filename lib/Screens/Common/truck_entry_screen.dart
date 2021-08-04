import 'package:flutter/material.dart';

class TruckEntryScreen extends StatefulWidget {
  static const routeName = "/truck-entry-screen";

  @override
  _TruckEntryScreenState createState() => _TruckEntryScreenState();
}

class _TruckEntryScreenState extends State<TruckEntryScreen> {
  handleSearch(String value) {
    // List<DO> temp = items
    //     .where(
    //       (element) =>
    //           (element.do_no.toLowerCase().contains(value.toLowerCase()) ||
    //               element.consignee
    //                   .toLowerCase()
    //                   .contains(value.toLowerCase()) ||
    //               element.toplc.toLowerCase().contains(value.toLowerCase()) ||
    //               element.frmplc.toLowerCase().contains(value.toLowerCase())) &&
    //           (dateFormatFromDataBase(element.do_dt)
    //                   .isAfter(selectedDate.subtract(Duration(days: 4))) &&
    //               dateFormatFromDataBase(element.do_dt)
    //                   .isBefore(selectedDate.add(Duration(days: 1)))),
    //     )
    //     .toList();
    // setState(() {
    //   toShowItems = temp;
    // });
  }

  getAndSet() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Truck Entry"),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => handleSearch(value),
              initialValue: "",
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search Party',
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => getAndSet(),
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Something"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}