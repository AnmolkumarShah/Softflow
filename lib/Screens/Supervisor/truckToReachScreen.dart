import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:softflow_app/Helpers/shimmerLoader.dart';
import 'package:softflow_app/Models/do_model.dart';
import 'package:softflow_app/Models/user_model.dart';
import 'package:softflow_app/Providers/main_provider.dart';
import '../../Widgets/tileWidget.dart';

class TruckToReachScreen extends StatefulWidget {
  static const routeName = "/truckToReachScreen";

  @override
  _TruckToReachScreenState createState() => _TruckToReachScreenState();
}

class _TruckToReachScreenState extends State<TruckToReachScreen> {
  handleVehReachedUpdate(bool value, receivedDo) async {}

  Widget build(BuildContext context) {
    User currentUser = Provider.of<MainProvider>(context, listen: false).user;
    return Scaffold(
        appBar: new AppBar(
          title: Text("Trucks To Reach"),
        ),
        body: FutureBuilder(
          future: DO.supervisorAllDO("""
        
        select * from domast where acc_id in (${currentUser.acc_id}, 
            ${currentUser.acc_id1}, ${currentUser.acc_id2}) and Veh_reached
             = 'false' and broker != -1 and truckid != -1 
            order by do_dt desc   
        """),
          // and br_cd = ${currentUser.deptCd}
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LoadingListPage();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              final List<DO> data =
                  (snapshot.data as Map<String, dynamic>)['data'];
              if (data.length < 1) {
                return Center(
                  child: Chip(label: Text("No Trucks Are Coming...")),
                );
              }
              return ListView.builder(
                itemBuilder: (context, index) => TileWidget(
                  co: currentUser.co,
                  receivedDo: data[index],
                  userId: currentUser.acc_id,
                  isDispatch: false,
                ),
                itemCount: data.length,
              );
            }
            if (snapshot.hasError) {
              return Text("");
            }
            return Text("");
          },
        ));
  }
}
