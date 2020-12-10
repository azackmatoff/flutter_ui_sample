import 'package:flutter/material.dart';
import 'package:test_by_az/models/review_model.dart';
import 'package:test_by_az/models/service_model.dart';
import 'package:test_by_az/models/team_model.dart';

class FakeData {
  List<ServiceModel> getServices() {
    List<ServiceModel> serviceModelList = List<ServiceModel>();
    ServiceModel serviceModel = ServiceModel();

    //1
    serviceModel.name = "Service name 1";
    serviceModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    serviceModel.imageUrl = "assets/images/barber1.jpg";
    serviceModel.price = 151;
    serviceModelList.add(serviceModel);

    //2
    serviceModel = ServiceModel();
    serviceModel.name = "Service name 2";
    serviceModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    // serviceModel.imageUrl = "assets/images/barber2.jpg";
    serviceModel.price = 152;
    serviceModelList.add(serviceModel);

    //3
    serviceModel = ServiceModel();
    serviceModel.name = "Service name 3";
    serviceModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    // serviceModel.imageUrl = "assets/images/barber3.jpg";
    serviceModel.price = 153;
    serviceModelList.add(serviceModel);

    serviceModel = ServiceModel();

    return serviceModelList;
  }

  List<TeamModel> getTeams() {
    List<TeamModel> teamModelList = List<TeamModel>();
    TeamModel teamModel = TeamModel();

    //1
    teamModel.name = "Name 1";
    teamModel.imageUrl = "assets/images/team1.jpg";
    teamModelList.add(teamModel);

    //2
    teamModel = TeamModel();
    teamModel.name = "Name 2";
    teamModel.imageUrl = "assets/images/team2.jpg";
    teamModelList.add(teamModel);

    //3
    teamModel = TeamModel();
    teamModel.name = "Name 3";
    teamModel.imageUrl = "assets/images/team3.jpg";
    teamModelList.add(teamModel);

    return teamModelList;
  }

  List<ReviewModel> getReviews() {
    List<ReviewModel> reviewModelList = List<ReviewModel>();
    ReviewModel reviewModel = ReviewModel();

    //1
    reviewModel.name = "Name 1";
    reviewModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    reviewModel.imageUrl = "assets/images/team1.jpg";
    reviewModel.rating = 4.6;
    reviewModelList.add(reviewModel);

    //2
    reviewModel = ReviewModel();
    reviewModel.name = "Name 2";
    reviewModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    reviewModel.imageUrl = "assets/images/team2.jpg";
    reviewModel.rating = 5.0;
    reviewModelList.add(reviewModel);

    //3
    reviewModel = ReviewModel();
    reviewModel.name = "Name 3";
    reviewModel.description =
        "Lorem ipsum is a dummy text used to replace text in "
        "some areas just for the purpose of an example. "
        "It can be used in publishing and graphic design.";
    reviewModel.imageUrl = "assets/images/team3.jpg";
    reviewModel.rating = 4.0;
    reviewModelList.add(reviewModel);

    return reviewModelList;
  }
}
