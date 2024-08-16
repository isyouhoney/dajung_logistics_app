import 'package:bakery_app/models/product.dart';
import 'package:bakery_app/repositories/production_repository.dart';
import 'package:get/get.dart';

class ProductionService extends GetxService {
  final ProductionRepository productionRepository = ProductionRepository();
  static ProductionService get to => Get.find();
  final RxString addItemCategory = '카테고리'.obs;
  final RxString addItemImage = ''.obs;
  RxList productionList = [].obs;

  Future<RxList?> fetchProduction(DateTime startDate, DateTime endDate) async {
    String startString = startDate.toString();
    String endString = endDate.toString();
    var fetchedProduction = await productionRepository.getProductions(startString, endString);
    if (fetchedProduction != null){
      productionList.value = fetchedProduction;
      return productionList;
    } else {
      print('생산목록을 불러오는데 실패했습니다.');
    }
  }

  Future<bool> postProduction(List<Product> products, String postDate) async {
    var postProduction = await productionRepository.postProduction(products, postDate);
    if (postProduction != null){
      return true;
    } else {
      print('일일 생산량을 입력 실패했습니다.');
      return false;
    }
  }
}