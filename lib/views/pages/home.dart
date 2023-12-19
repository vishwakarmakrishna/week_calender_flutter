import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:interview_app/extensions/drop_shadow.dart';
import 'package:interview_app/resources/assets.gen.dart';
import 'package:interview_app/resources/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 2;
  GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Assets.icons.leadingIcon2lUseHighEmphasis.svg().applyDropShadow,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.leadingIcon1.svg().applyDropShadow,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Badge.count(
              count: 2,
              child: Assets.icons.trailingIcon1.svg().applyDropShadow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Assets.icons.maxresdefault.image().applyDropShadow,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
        ),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              bodyHeader(),
              const SizedBox(height: 16),
              ...bodyMain(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottombar(),
    );
  }

  Widget bodyMainCard1() {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      clipBehavior: Clip.none,
      width: width - 32,
      height: 265,
      decoration: BoxDecoration(
        color: ColorManager.lightBlue,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Assets.icons.ordersIllustrationImage.svg(
                width: width / 2 - 48,
              ),
              MaterialButton(
                color: ColorManager.lightOrange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                child: Text(
                  "Orders",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 100,
                      width: width / 2 - 32,
                      decoration: BoxDecoration(
                          color: ColorManager.lightOrange,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ]),
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "You have ",
                          style: TextStyle(
                            color: ColorManager.white,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                              text: "3",
                              style: TextStyle(
                                fontSize: 21,
                                color: ColorManager.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: " active orders from",
                              style: TextStyle(
                                color: ColorManager.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(0, 16),
                      child: Stack(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffEC4039),
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              color: ColorManager.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Assets.icons.vg6wj89v.provider(),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffEC4039),
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              color: ColorManager.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Assets.icons.dhkzbpfi.provider(),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xffEC4039),
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                              color: ColorManager.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Assets.icons.x3xoxkp9.provider(),
                              ),
                            ),
                          ),
                        ]
                            .asMap()
                            .entries
                            .map(
                              (e) => Transform.translate(
                                offset: Offset((e.key - 1) * 25.0, 0),
                                child: e.value,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16 + 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          height: 90,
                          width: width / 2 - 64,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.black.withOpacity(0.1),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ]),
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "02",
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: ColorManager.navyBlue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const TextSpan(
                                  text: " Pending",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff5F7096),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: " Orders from",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorManager.navyBlue,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, 16),
                          child: Stack(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffEC4039),
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                  color: ColorManager.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Assets.icons.ntu2aa26.provider(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffEC4039),
                                    width: 2,
                                  ),
                                  shape: BoxShape.circle,
                                  color: ColorManager.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Assets.icons.c41d68bt.provider(),
                                  ),
                                ),
                              ),
                            ]
                                .asMap()
                                .entries
                                .map(
                                  (e) => Transform.translate(
                                    offset: Offset((e.key - 0.5) * 25.0, 0),
                                    child: e.value,
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyMainCard2() {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      clipBehavior: Clip.none,
      width: width - 32,
      height: 295,
      decoration: BoxDecoration(
        color: ColorManager.vibrantYellow,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Assets.icons.subscriptionsIllustrationImage.svg(
                width: width / 2 - 64,
              ),
              MaterialButton(
                color: ColorManager.vibrantBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                child: Text(
                  "Orders",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 16),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Stack(
              children: [
                Positioned(
                  top: 105,
                  left: 30,
                  right: 10,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 20,
                      bottom: 10,
                    ),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "10",
                            style: TextStyle(
                              fontSize: 24,
                              color: ColorManager.navyBlue,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const TextSpan(
                            text: " Active",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff5F7096),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: " Subscriptions",
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorManager.navyBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 180,
                  left: 40,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "119",
                            style: TextStyle(
                              fontSize: 24,
                              color: ColorManager.navyBlue,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const TextSpan(
                            text: " Pending",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff5F7096),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: " Deliveries",
                            style: TextStyle(
                              fontSize: 12,
                              color: ColorManager.navyBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 100,
                        width: width / 2 - 32,
                        decoration: BoxDecoration(
                            color: ColorManager.vibrantBlue,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]),
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "You have ",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                              TextSpan(
                                text: "3",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: " active orders from",
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, 16),
                        child: Stack(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.vibrantBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.vg6wj89v.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.vibrantBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.dhkzbpfi.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.vibrantBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.x3xoxkp9.provider(),
                                ),
                              ),
                            ),
                          ]
                              .asMap()
                              .entries
                              .map(
                                (e) => Transform.translate(
                                  offset: Offset((e.key - 1) * 25.0, 0),
                                  child: e.value,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 16 + 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyMainCard3() {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(top: 16),
      clipBehavior: Clip.none,
      width: width - 32,
      decoration: BoxDecoration(
        color: ColorManager.lightGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
      ),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.circle,
                ),
                child: Assets.icons.customersIllustrationImage.svg(
                  width: width / 2 - 64,
                ),
              ),
              MaterialButton(
                color: ColorManager.vibrantPink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: () {},
                child: Text(
                  "View Customers",
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 105,
                  left: 60,
                  right: -10,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: ColorManager.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]),
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "1.8%",
                                style: TextStyle(
                                  fontSize: 23,
                                  color: ColorManager.navyBlue,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Assets.icons.upArrow.svg(),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          child: Assets.icons.chartPng.image(),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 180,
                  left: 20,
                  right: 20,
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]),
                        padding: const EdgeInsets.all(10),
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "10",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: ColorManager.navyBlue,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              const TextSpan(
                                text: " Active",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color(0xff5F7096),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: " Customers",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: ColorManager.navyBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, 0),
                        child: Stack(
                          children: [
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.ntu2aa26.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.ntu2aa26.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.c41d68bt.provider(),
                                ),
                              ),
                            ),
                          ]
                              .asMap()
                              .entries
                              .map(
                                (e) => Transform.translate(
                                  offset: Offset((e.key) * 20.0, 0),
                                  child: Badge(
                                      backgroundColor: const Color(0xff12B828),
                                      alignment: Alignment.bottomRight,
                                      child: e.value),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 100,
                        width: width / 2 - 32,
                        decoration: BoxDecoration(
                            color: ColorManager.vibrantPink,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ]),
                        padding: const EdgeInsets.all(8.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "15",
                                style: TextStyle(
                                  fontSize: 21,
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: " New customers",
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Transform.translate(
                        offset: const Offset(0, 16),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.vg6wj89v.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.dhkzbpfi.provider(),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ColorManager.lightBlue,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Assets.icons.x3xoxkp9.provider(),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 10,
                              ),
                              height: 17.5,
                              width: 17.5,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.white,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: ColorManager.black,
                              ),
                            ),
                          ]
                              .asMap()
                              .entries
                              .map(
                                (e) => Transform.translate(
                                  offset: Offset((e.key - 1) * 25.0, 0),
                                  child: e.value,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 16 + 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget bodyCalender() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Calender Header
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "January,23 2021",
                    style: TextStyle(
                      color: ColorManager.navyBlue,
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Today",
                    style: TextStyle(
                      color: ColorManager.navyBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Timeline",
                      style: TextStyle(
                        color: ColorManager.navyBlue,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Icon(
                      Icons.arrow_drop_down,
                      color: ColorManager.navyBlue,
                      size: 18,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: ColorManager.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Assets.icons.group911.svg(),
                    const SizedBox(width: 8),
                    Text(
                      "Jan, 2021",
                      style: TextStyle(
                        color: ColorManager.navyBlue,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Week Switch List Calender
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ("MON", "20"),
              ("TUE", "21"),
              ("WED", "22"),
              ("THU", "23"),
              ("FRI", "24"),
              ("SAT", "25"),
              ("SUN", "26"),
            ]
                .asMap()
                .entries
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 16,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          e.value.$1,
                          style: TextStyle(
                            color: e.value.$1 != "THU"
                                ? const Color(0xffC5D6FC)
                                : const Color(0xff008080),
                            fontSize: 14,
                            fontWeight: e.value.$1 != "THU"
                                ? FontWeight.w300
                                : FontWeight.w400,
                          ),
                        ),
                        Text(
                          e.value.$2,
                          style: TextStyle(
                            color: e.value.$1 != "THU"
                                ? const Color(0xffC5D6FC)
                                : const Color(0xff008080),
                            fontSize: 14,
                            fontWeight: e.value.$1 != "THU"
                                ? FontWeight.w300
                                : FontWeight.w400,
                          ),
                        ),
                        if (e.value.$1 == "THU")
                          const Text(
                            "\u2022",
                            style: TextStyle(
                              color: Color(0xff008080),
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        // New Order Card
        Container(
          height: 150,
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: ColorManager.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "New order created",
                      style: TextStyle(
                        color: ColorManager.navyBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(
                      "New order created with Order",
                      style: TextStyle(
                        color: Color(0xff4C4C4C),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "09:00 AM",
                      style: TextStyle(
                        color: ColorManager.lightOrange,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Assets.icons.icArrowNarrowUp.svg(),
                  ],
                ),
              ),
              Assets.icons.newOrder.svg(),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> bodyMain() {
    return <Widget>[
      SizedBox(
        height: 265,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            bodyMainCard1(),
            bodyMainCard2(),
            bodyMainCard3(),
          ]
              .asMap()
              .entries
              .map((e) => Padding(
                    padding: EdgeInsets.only(right: e.key == 2 ? 0 : 16),
                    child: e.value,
                  ))
              .toList(),
        ),
      ),
      const SizedBox(height: 32),
      bodyCalender(),
    ];
  }

  Widget bodyHeader() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: "Welcome, ",
                  style: TextStyle(
                    color: ColorManager.navyBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: "Mypcot !!",
                      style: TextStyle(
                        color: ColorManager.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "here is your dashboard...",
                style: TextStyle(
                  color: ColorManager.navyBlue,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.group918.svg())
            .applyDropShadow,
      ],
    );
  }

  Widget bottombar() {
    return IgnorePointer(
      child: CurvedNavigationBar(
        key: bottomNavigationKey,
        index: _page,
        height: 60.0,
        items: <Widget>[
          MyButtomNavBarItem(
            title: "Home",
            icon: Assets.icons.group910.svg(),
          ),
          MyButtomNavBarItem(
            title: "Customers",
            icon: Assets.icons.group912.svg(),
          ),
          Icon(
            Icons.add,
            size: 30,
            color: _page != 2 ? ColorManager.navyBlue : ColorManager.white,
          ),
          MyButtomNavBarItem(
            title: "Khata",
            icon: Assets.icons.group913.svg(),
          ),
          MyButtomNavBarItem(
            title: "Orders",
            icon: Assets.icons.group914.svg(),
          ),
        ],
        color: ColorManager.white,
        buttonBackgroundColor:
            _page == 2 ? ColorManager.navyBlue : ColorManager.white,
        backgroundColor: ColorManager.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}

class MyButtomNavBarItem extends StatelessWidget {
  const MyButtomNavBarItem({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        Text(
          title,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
