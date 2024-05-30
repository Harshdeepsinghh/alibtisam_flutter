import 'package:alibtisam_flutter/features/bottomNav/controller/user.dart';
import 'package:alibtisam_flutter/features/bottomNav/model/chats_list.dart';
import 'package:alibtisam_flutter/features/bottomNav/model/user.dart';
import 'package:alibtisam_flutter/features/bottomNav/presentation/userDashboard/presentation/enrollment/view_addmision_form.dart';
import 'package:alibtisam_flutter/helper/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAbout extends StatefulWidget {
  final String image;
  final Chat chat;
  final String name;
  const ChatAbout(
      {super.key, required this.image, required this.chat, required this.name});

  @override
  State<ChatAbout> createState() => _ChatAboutState();
}

class _ChatAboutState extends State<ChatAbout> {
  final UserController userController = Get.find<UserController>();
  checkUser() {
    if (!widget.chat.isGroup!) {
      for (var participant in widget.chat.participants!) {
        if (participant.id != userController.user!.id) {
          if (participant.role == 'INTERNAL USER') {
            return ViewPlayerByUserModel(player: participant);
          }
          return Scaffold(body: ViewCoachProfile(user: participant));
        }
      }
    }
    return ViewTeamProfile(widget: widget);
  }

  @override
  Widget build(BuildContext context) {
    return checkUser();
  }
}

class ViewTeamProfile extends StatelessWidget {
  const ViewTeamProfile({
    super.key,
    required this.widget,
  });

  final ChatAbout widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            collapsedHeight: 150,
            stretch: true,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                    ...List.generate(widget.chat.participants!.length,
                        (int index) {
                      return GestureDetector(
                        onTap: () {
                          if (widget.chat.participants![index].role ==
                              "COACH") {
                            Get.to(() => ViewCoachProfile(
                                  user: widget.chat.participants![index],
                                ));
                          } else {
                            Get.to(() => ViewPlayerByUserModel(
                                player: widget.chat.participants![index]));
                          }
                        },
                        child: kCustomListTile(
                            key: "name".tr,
                            value: widget.chat.participants![index].name),
                      );
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

  Container kCustomListTile({required String key, required dynamic value}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: kAppGreyColor(), borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(key),
        subtitle: Text(
          value.toString().capitalize!,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

class ViewCoachProfile extends StatelessWidget {
  const ViewCoachProfile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            collapsedHeight: 150,
            stretch: true,
            pinned: true,
            flexibleSpace: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.network(
                user.pic,
                fit: BoxFit.cover,
                height: 400,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.userName,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 20),
                      ),
                      kCustomListTile(key: "name".tr, value: user.name),
                      kCustomListTile(key: "email".tr, value: user.email),
                      kCustomListTile(key: "gender".tr, value: user.gender),
                    ]),
              ),
            ),
          )
        ],
      )),
    );
  }

  Container kCustomListTile({required String key, required dynamic value}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: kAppGreyColor(), borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(key),
        subtitle: Text(
          value.toString().capitalize!,
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
