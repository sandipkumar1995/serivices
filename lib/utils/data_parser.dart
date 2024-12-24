import 'dart:convert';

import '../model/category.dart';




 getUniqueEvents( UserActivityMOdel userActivityMOdel) {
  Map<String,int> uniqueElements = {};
  for(var category in userActivityMOdel.categories!){
    for(var services in category.services!){
      for(var events in services.events!){
        uniqueElements[events]=(uniqueElements[events]?? 0)+1;
      }
    }
  }
  return uniqueElements;
} // in this method we are listing event and service count for particular event

Map<String, List<String>> getServicesByEventCategory(
    String event, UserActivityMOdel userActivityMOdel) {
  Map<String, List<String>> servicesByEventCategory = {};

  for (var category in userActivityMOdel.categories ?? []) {

    List<String> servicesName = [];

    for (var service in category.services ?? []) {
      if (service.events?.contains(event) ?? false) {
        servicesName.add(service.serviceName ?? 'Unknown Service');
      }
    }

    if (servicesName.isNotEmpty) {
      servicesByEventCategory[category.categoryName ?? 'Unknown Category'] =
          servicesName;
    }
  } // in this method we are listing number of service names for selected event

  return servicesByEventCategory;
}

List<String> getEventsForService(String serviceName, UserActivityMOdel userActivityMOdel)
{
  for (var category in userActivityMOdel.categories!) {
    for (var service in category.services!) {
      if (service.serviceName == serviceName) {
        return service.events!;
      }
    }
  }
  return []; // in this method we are gating events names for selected services
}



