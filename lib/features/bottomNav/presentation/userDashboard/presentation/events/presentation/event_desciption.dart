// ignore_for_file: deprecated_member_use

import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/controller/event_navigation.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/model/events_model.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/presentation/events.dart';
import 'package:SNP/features/bottomNav/presentation/userDashboard/presentation/events/widgets/feedPlayer/feed_player.dart';
import 'package:SNP/core/common/widgets/custom_loading.dart';
import 'package:SNP/core/utils/custom_date_formatter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class EventDescription extends StatefulWidget {
  final Events event;
  const EventDescription({super.key, required this.event});

  @override
  State<EventDescription> createState() => _EventDescriptionState();
}

class _EventDescriptionState extends State<EventDescription> {
  final eventNavigationController = Get.find<EventNavigation>();

  @override
  Widget build(BuildContext context) {
    return ConditionalWillPopScope(
      onWillPop: () async {
        eventNavigationController.navigatingFromSplashScreen.isFalse
            ? Get.back()
            : Get.offUntil(
                MaterialPageRoute(
                  builder: (context) => AllEvents(),
                ),
                (route) => false);
        ;
        return true;
      },
      shouldAddCallback: true,
      child: CustomLoader(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  eventNavigationController.navigatingFromSplashScreen.isFalse
                      ? Get.back()
                      : Get.offUntil(
                          MaterialPageRoute(
                            builder: (context) => AllEvents(),
                          ),
                          (route) => false);
                },
                icon: Icon(
                  Icons.navigate_before,
                  size: 35,
                )),
            automaticallyImplyLeading: false,
            title: Text(widget.event.category),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  CarouselSlider(
                    disableGesture: false,
                    options: CarouselOptions(
                        aspectRatio: 25 / 10, viewportFraction: 1),
                    items: widget.event.media.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration:
                                  BoxDecoration(color: Colors.grey.shade200),
                              child: i.type == 'image'
                                  ? Image.network(
                                      i.url,
                                      fit: BoxFit.cover,
                                    )
                                  : FeedPlayer(
                                      url: i.url,
                                      showControls: false,
                                    ));
                        },
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.event.name,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800),
                          ),
                          ReadMoreText(
                            widget.event.description,
                            trimMode: TrimMode.Line,
                            trimLines: 4,
                            colorClickableText: Colors.pink,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Text(
                            customDateTimeFormat(widget.event.dateTime),
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
