import 'package:bakery_app/repositories/production_repository.dart';
import 'package:get/get.dart';

class ProductionService extends GetxService {
  final ProductionRepository productionRepository = ProductionRepository();
  static ProductionService get to => Get.find();
  final RxString addItemCategory = '카테고리'.obs;
  final RxString addItemImage = ''.obs;
  RxList ProductionList = [].obs;

  Future<RxList?> fetchProduction() async {
    var fetchedProduction = await productionRepository.getProductions();
    if (fetchedProduction != null){
      ProductionList.value = fetchedProduction;
      return ProductionList;
    } else {
      print('생산목록을 불러오는데 실패했습니다.');
    }
  }
  Future<void> postProduction(List products) async {
    var postProduction = await productionRepository.postProduction(products);
    if (postProduction != null){
      print(postProduction);
    } else {
      print('일일 생산량을 입력 실패했습니다.');
    }
  }
}