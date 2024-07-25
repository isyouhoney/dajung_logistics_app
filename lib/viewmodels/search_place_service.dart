import 'package:bakery_app/repositories/search_place_repository.dart';
import 'package:get/get.dart';

class SearchPlaceService extends GetxController {
  static SearchPlaceService get to => Get.find();
  final SearchPlaceRepository searchPlaceRepository = Get.find<SearchPlaceRepository>();
  final RxList<dynamic> searchResults = RxList<dynamic>();

  Future<List?> searchPlace(String query) async {
    final nameResults = await searchPlaceRepository.getPlaceByName(query);
    // final addrResults = await searchPlaceRepository.getPlaceByAddr(query);
    if (nameResults!=null && nameResults.isNotEmpty) {
      searchResults.assignAll(nameResults);
      return searchResults;
    }
  //   else if (addrResults!=null && addrResults.isNotEmpty){
  //     print('addrResults : $addrResults');
  //
  //     searchResults.assignAll(addrResults);
  //     return searchResults;
  // }
  //   else {
  //     print('장소 검색하기를 실패하였습니다.');
  //   }
  }

  void clear() {
    searchResults.clear();
  }

  // Future<List?> searchByAddr(String query) async {
  //   final results = await searchPlaceRepository.getPlaceByAddr(query);
  //   if (results != null) {
  //     searchResults.assignAll(results);
  //     return searchResults;
  //   } else {
  //     print('상호명으로 검색하기를 실패하였습니다.');
  //   }
  // }
}
