import 'package:flutter/material.dart';
import 'package:flutter_roam/models/country/house_space.dart';
import 'package:flutter_roam/pages/country_tab/controller.dart';
import 'package:flutter_roam/widgets/house_card_item.dart';
import 'package:flutter_roam/widgets/loading_box.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class CountryTabPage extends StatefulWidget {
  final String cid;
  const CountryTabPage(this.cid,{super.key});

  @override
  State<CountryTabPage> createState() => _CountryTabPageState();
}

class _CountryTabPageState extends State<CountryTabPage> with AutomaticKeepAliveClientMixin {
  late CountryTabController controller;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return GetX<CountryController>(
    //   builder: (controller){
    //     return LoadingBox(
    //         loading: controller.loading.value,
    //         child: RefreshIndicator(
    //           onRefresh: controller.onRefresh,
    //           child: houseView(),
    //         )
    //     );
    //   },
    //   init: countryController,
    // );

    return Obx(() => LoadingBox(
        loading: controller.loading.value,
        child: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: houseView(),
        )
    ));
  }



  @override
  void initState() {
    controller = Get.put(CountryTabController(widget.cid),tag: widget.cid);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  houseView() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 14),
      child: MasonryGridView.count(
        controller: controller.scrollController,
        crossAxisCount: 2,
        crossAxisSpacing: 7,
        mainAxisSpacing: 7,
        itemCount: controller.houseList.length,
        itemBuilder: (context,index){
          HouseSpace item = controller.houseList[index];
          return HouseCardItem(item.discoveryContentType??3,item.data!);
        },
      ),
    );
  }

}
