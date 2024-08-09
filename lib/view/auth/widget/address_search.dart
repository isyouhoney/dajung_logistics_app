import 'package:bakery_app/viewmodels/search_place_service.dart';
import 'package:bakery_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddressSearch extends StatefulWidget {
  const AddressSearch({super.key, required this.storeName, required this.address, required this.x, required this.y});
  final ValueChanged<String> storeName;
  final ValueChanged<String> address;
  final ValueChanged<String> x;
  final ValueChanged<String> y;

  @override
  State<AddressSearch> createState() => _AddressSearchState();
}

class _AddressSearchState extends State<AddressSearch> {
  late TextEditingController addressController;

  @override
  void initState() {
    super.initState();
    addressController = TextEditingController();
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: Column(
        children: [
          Row(children: [
                  const Icon(Icons.location_on),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: CustomTextField(
                      onChanged: (value){
                        SearchPlaceService.to.searchPlace(value.trim());
                      },
                      hintText: '주소 또는 상호명 검색',
                      validator: (val) {
                        return null;
                      },
                      controller: addressController,
                      width: 100.w-55),
                  )
            ],
          ),
          Obx(()=>ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: SearchPlaceService.to.searchResults.length,
            itemBuilder: (context, index) {
              var result = SearchPlaceService.to.searchResults[index];
              return ListTile(
                title: Text(result['place_name']),
                subtitle: Text(result['address_name']),
                onTap: () {
                  addressController.text = result['place_name'];
                  widget.storeName(result['place_name']);
                  widget.address(result['address_name']);
                  widget.x(result['x']);
                  widget.y(result['y']);
                },
              );
            },
          ))
        ],
      ),
    );
  }
}
