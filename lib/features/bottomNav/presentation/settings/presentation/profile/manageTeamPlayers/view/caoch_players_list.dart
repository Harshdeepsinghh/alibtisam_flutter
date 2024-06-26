import 'package:SNP/features/bottomNav/model/team.dart';
import 'package:SNP/features/bottomNav/presentation/settings/presentation/profile/manageTeamPlayers/view/player_data.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/statistics/controller/monitoring.dart';
import 'package:SNP/core/common/widgets/custom_empty_icon.dart';
import 'package:SNP/core/common/widgets/custom_loading.dart';
import 'package:SNP/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachPlayersListForProfile extends StatefulWidget {
  final List<PlayersModel> players;
  const CoachPlayersListForProfile({
    super.key,
    required this.players,
  });

  @override
  State<CoachPlayersListForProfile> createState() =>
      _CoachPlayersListForProfileState();
}

class _CoachPlayersListForProfileState
    extends State<CoachPlayersListForProfile> {
  final monitoringController = Get.find<MonitoringController>();
  @override
  Widget build(BuildContext context) {
    return CustomLoader(
      child: Scaffold(
          appBar: AppBar(
            title: Text("players".tr),
          ),
          body: widget.players.length == 0
              ? CustomEmptyWidget()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.players.length,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  mainAxisExtent: 250,
                                  maxCrossAxisExtent: 220),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(() => PlayerDataForProfile(
                                    player: widget.players[index].playerId))!;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: kAppGreyColor(),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          widget.players[index].playerId.pic,
                                          fit: BoxFit.cover,
                                          height: 200,
                                          width: double.infinity,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(widget.players[index].playerId.name
                                          .capitalize!),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "PlayerId: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 0),
                                          ),
                                          Text(
                                            widget.players[index].playerId.pId,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 0),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
