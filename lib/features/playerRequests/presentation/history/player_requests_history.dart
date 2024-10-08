import 'package:alibtisam/features/enrollment/models/user.dart';
import 'package:alibtisam/features/enrollment/views/pages/view_addmision_form.dart';
import 'package:alibtisam/core/common/widgets/custom_empty_icon.dart';
import 'package:alibtisam/core/theme/app_colors.dart';
import 'package:alibtisam/core/services/api_requests.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayersRequestHistory extends StatelessWidget {
  const PlayersRequestHistory({super.key});

  @override
  Widget build(BuildContext context) {
    print('-------->haha');
    print(ApiRequests().getMesurementHistory());

    return Scaffold(
      body: FutureBuilder<List<UserModel>?>(
        future: ApiRequests().getMesurementHistory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data!.length == 0
                ? CustomEmptyWidget()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            print('-----------> ${snapshot.data![index]}');
                            UserModel user = snapshot.data![index];
                            return Container(
                              margin: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: kAppGreyColor(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: ListTile(
                                onTap: () {
                                  Get.to(() =>
                                      ViewPlayerByUserModel(player: user));
                                },
                                title: Text(user.name!.capitalize!),
                                subtitle: Text(user.email!),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
          }
          return Center();
        },
      ),
    );
  }
}
