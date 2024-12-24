

class UserActivityMOdel {
  List<Categories>? categories;

  UserActivityMOdel({this.categories});

  UserActivityMOdel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }
}
class Categories {
  String? categoryName;
  List<Services>? services;

  Categories({this.categoryName, this.services});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryName = json['categoryName'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }
}

class Services {
  String? serviceName;
  List<String>? events;

  Services({this.serviceName, this.events});

  Services.fromJson(Map<String, dynamic> json) {
    serviceName = json['serviceName'];
    events = json['events'].cast<String>();
  }
}