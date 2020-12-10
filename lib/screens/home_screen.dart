import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:test_by_az/constants/color_branding.dart';
import 'package:test_by_az/constants/text_styling.dart';
import 'package:test_by_az/models/review_model.dart';
import 'package:test_by_az/models/service_model.dart';
import 'package:test_by_az/models/team_model.dart';
import 'package:test_by_az/services/fake_data.dart';

List<String> imgList = [
  "assets/images/barber3.jpg",
  "assets/images/barber2.jpg",
  "assets/images/barber1.jpg",
];

List<String> imgList2 = [
  "assets/images/barber2.jpg",
  "assets/images/barber3.jpg",
  "assets/images/barber1.jpg",
];

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  List<ServiceModel> serviceModelList;
  List<TeamModel> teamModelList;
  List<ReviewModel> reviewModelList;
  int _current = 0;

  @override
  void initState() {
    serviceModelList = FakeData().getServices();
    teamModelList = FakeData().getTeams();
    reviewModelList = FakeData().getReviews();
    super.initState();
  }

  final List<Widget> imageSliders = imgList
      .map((item) => Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1500.0),
                ],
              ),
            ),
          ))
      .toList();

  final List<Widget> imageSliders2 = imgList2
      .map((item) => Container(
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: 1000,
                    ),
                  ],
                ),
              ),
            ),
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Feather.chevron_left,
          color: AppColors.brown,
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Text(
          'Winchester',
          style: AppTextStyles.titleBrown28,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Feather.heart,
              color: AppColors.brown,
            ),
            tooltip: 'Show Snackbar',
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTopSlider(),
            Container(
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    _buildCard(),
                    _buildTeam(),
                  ],
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.0),
                    bottomLeft: Radius.circular(25.0),
                  ),
                ),
              ),
            ),
            _buildReviews(),
          ],
        ),
      ),
    );
  }

  _buildTopSlider() {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          padding:
              const EdgeInsets.only(right: 18.0, left: 18, bottom: 20, top: 20),
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 0.0,
          right: 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.map((url) {
              int index = imgList.indexOf(url);
              return Container(
                width: 30.0,
                height: _current == index ? 6.0 : 3.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: AppColors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  _buildCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        elevation: 9.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          children: [
            _buildTitle(),
            _buildServices(),
          ],
        ),
      ),
    );
  }

  _buildTitle() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Whinchester",
            style: AppTextStyles.titleBrown28,
          ),
          SizedBox(height: 5),
          Text(
            "Ожешко 39/1",
            style: AppTextStyles.subTitleBrown18,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(FontAwesome.star, color: AppColors.yellow),
              Text(
                "3.9",
                style: AppTextStyles.subTitleBrown18,
              ),
              Text(
                "Oтлично",
                style: AppTextStyles.subTitleBrown18,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 3,
                    bottom: 3,
                    left: 8,
                    right: 8,
                  ),
                  child: Text(
                    "Новинка",
                    style: AppTextStyles.textWhite13,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.pink,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 70),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: 200,
            padding: const EdgeInsets.only(
              top: 6,
              bottom: 6,
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              color: AppColors.brown,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Feather.clock,
                  color: AppColors.white,
                  size: 14.0,
                ),
                Text(
                  "Открыто  10:00 - 21:00",
                  style: AppTextStyles.textWhite12,
                ),
                Icon(
                  Feather.chevron_down,
                  color: AppColors.white,
                  size: 14.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildServices() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Услуги",
            style: AppTextStyles.titleBrown24,
          ),
          SizedBox(height: 10),
          ListView.builder(
            itemCount: serviceModelList.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              if (serviceModelList[index].imageUrl != null) {
                return Container(
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            items: imageSliders2,
                            options: CarouselOptions(
                                autoPlay: false,
                                enlargeCenterPage: false,
                                aspectRatio: 16 / 9,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList2.map((url) {
                                int index = imgList2.indexOf(url);
                                return Container(
                                  width: 30.0,
                                  height: _current == index ? 6.0 : 3.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: AppColors.white,
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      // Container(
                      //   height: 160,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage(
                      //         serviceModelList[index].imageUrl,
                      //       ),
                      //       fit: BoxFit.cover,
                      //     ),
                      //     color: AppColors.pink,
                      //     borderRadius: BorderRadius.all(
                      //       Radius.circular(15.0),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              serviceModelList[index].name,
                              style: AppTextStyles.subTitleBrown17,
                            ),
                            Text(
                              serviceModelList[index].description,
                              style: AppTextStyles.textBrown14,
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2ч - 2ч 15 мин",
                                  style: AppTextStyles.subTitleBrown18,
                                ),
                                Text(
                                  "${serviceModelList[index].price} USD",
                                  style: AppTextStyles.subTitleBoldBrown18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  serviceModelList[index].name,
                                  style: AppTextStyles.subTitleBrown17,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Feather.chevron_down,
                                  color: AppColors.brown,
                                  size: 18.0,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2ч - 2ч 15 мин",
                                  style: AppTextStyles.subTitleBrown18,
                                ),
                                Text(
                                  "${serviceModelList[index].price} USD",
                                  style: AppTextStyles.subTitleBoldBrown18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 25.0, left: 25, top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      "ВСЕ УСЛУГИ",
                      style: AppTextStyles.subTitleBrown17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildTeam() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 20),
          child: Text(
            "Команда",
            style: AppTextStyles.titleBrown24,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          padding: const EdgeInsets.only(
            top: 3,
            bottom: 3,
            left: 16,
          ),
          child: ListView.builder(
            itemCount: teamModelList.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              print("teamModelList[index].imageUrl " +
                  teamModelList[index].imageUrl.toString());
              return Container(
                width: 120,
                margin: EdgeInsets.only(right: 14),
                decoration: BoxDecoration(
                  color: AppColors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.3),
                      spreadRadius: 0.7,
                      blurRadius: 3,
                      offset: Offset(2, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            teamModelList[index].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        color: AppColors.pink,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 25.0, left: 25, top: 10, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            teamModelList[index].name,
                            style: AppTextStyles.subTitleBrown17,
                          ),
                          // SizedBox(height: 40),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(9),
                        child: Center(
                          child: Text(
                            "ЗАПИСАТЬСЯ",
                            style: AppTextStyles.textWhite12,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.brown,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }

  _buildReviews() {
    return Container(
      color: AppColors.grey,
      padding:
          const EdgeInsets.only(top: 50.0, left: 20, right: 20, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Отзывы",
            style: AppTextStyles.titleBrown24,
          ),
          Text(
            "Всего 69 отзыва",
            style: AppTextStyles.textBrown14,
          ),
          SizedBox(height: 20),
          ListView.builder(
            itemCount: reviewModelList.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              if (reviewModelList[index].imageUrl != null) {
                return Container(
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(reviewModelList[index].imageUrl),
                        ),
                        title: Text(reviewModelList[index].name,
                            style: AppTextStyles.subTitleBoldBrown18),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              reviewModelList[index].description,
                              style: AppTextStyles.textBrown14,
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "01.01.2020",
                                  style: AppTextStyles.textBrown14,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesome.star,
                                      color: AppColors.yellow,
                                      size: 14.0,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "${reviewModelList[index].rating} ",
                                      style: AppTextStyles.textBrown14,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "Отлично",
                                      style: AppTextStyles.textBrown14,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(bottom: 14),
                  decoration: BoxDecoration(
                    color: AppColors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 25.0, left: 25, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  reviewModelList[index].name,
                                  style: AppTextStyles.subTitleBrown17,
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Feather.chevron_down,
                                  color: AppColors.brown,
                                  size: 18.0,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "2ч - 2ч 15 мин",
                                  style: AppTextStyles.subTitleBrown18,
                                ),
                                Text(
                                  "${reviewModelList[index].rating} USD",
                                  style: AppTextStyles.subTitleBoldBrown18,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              }
            },
          ),
          Container(
            margin: EdgeInsets.only(bottom: 14),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 25.0, left: 25, top: 10, bottom: 10),
                  child: Center(
                    child: Text(
                      "ВСЕ ОТЗЫВЫ",
                      style: AppTextStyles.subTitleBrown17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(25.0),
                ),
              ),
              child: Container(
                height: 70,
                width: 200,
                padding: const EdgeInsets.all(9),
                child: Center(
                  child: Text(
                    "ЗАПИСАТЬСЯ",
                    style: AppTextStyles.textWhite16,
                  ),
                ),
                decoration: BoxDecoration(
                  color: AppColors.brown,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
