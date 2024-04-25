import 'package:flutter/material.dart';
import 'package:flutter_roam/api/home_api.dart';
import 'package:flutter_roam/models/home/long_for.dart';
import 'package:flutter_roam/models/home/roam_image.dart';
import 'package:flutter_roam/pages/search_page.dart';
import 'package:flutter_roam/util/extended.dart';
import 'package:flutter_roam/widgets/carousel_card.dart';
import 'package:flutter_roam/models/home/categories.dart';
import 'package:flutter_roam/widgets/image_gallery.dart';
import 'package:flutter_roam/widgets/loading_box.dart';

import '../util/assets_image.dart';
import '../widgets/grid_card.dart';
import '../widgets/category_nav_bar.dart';

import '../models/home/roam_image.dart';

import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> with AutomaticKeepAliveClientMixin{
  double _appbarOpacity = 0;
  double showAppbarPos = 140;

  bool loadingIndicator = false;

  final List<RoamImage> imgList = List.generate(4, (index){
    var src = 'https://api.yimian.xyz/img?type=moe?T=$index';
    return RoamImage(src,url: src);
  });

  List<HomeCategories> categories = [];

  LongFor? entryLongFor;

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9f9),
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 72,
        title: searchBar(context),
        backgroundColor: Theme.of(context).colorScheme.onPrimary.withOpacity(_appbarOpacity)
      ),
      body: _buildView(),
    );
  }

  Widget searchBar(context){
    return MaterialButton(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(_appbarOpacity),
        height: 50,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        disabledElevation: 0,
        highlightElevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(28))
        ),
        onPressed: (){
          Get.to(const SearchPage());
          // Navigator.push(context, MaterialPageRoute(builder:(context)=>const SearchPage()));
        },
        onLongPress: (){
          
        },
        child: Row(
        children: [
          InkWell(
            // borderRadius: BorderRadius.circular(14),
            onTap: (){

            },
            child: Icon(
              Icons.search,
              size: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(child: Text(
              '漫游云野',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge)
          ),
          const SizedBox(width: 14),
          GestureDetector(
            onTap: (){
      
            },
            child: ClipOval(
              child: Image.asset(AssetsImage.avater,width: 32,height: 32)
            ),
          )
        ],
      ),
    );
  }

  _buildView() {
     return LoadingBox(
       loading: loadingIndicator,
       child: NotificationListener<ScrollNotification>(
         onNotification: (ScrollNotification notification){
           if(notification is ScrollUpdateNotification &&
               notification.depth == 0){
             _observeScroll(notification.metrics.pixels);
           }
           return true;
         },
         child: RefreshIndicator(
           color: Colors.red,
           onRefresh: _onPullDownRefresh,
           child: ListView(
             padding: const EdgeInsets.fromLTRB(14,0,14,14),
             children: [
               CarouselCard(imgList:imgList),
               SizedBox(height: 7.px),
               if(entryLongFor!=null) ImageGallery(entryLongFor: entryLongFor!),
               SizedBox(height: 7.px),
               GridCard(),
               SizedBox(height: 7.px),
               CategoryNavBar(navList:categories),
               // ...List.generate(1000, (index) => const ListTile(title: Text('测试'),))
             ],
           ),
         ),
       ),
     );
  }


  Future<void> _onPullDownRefresh() async{
    getInitData();
  }
  @override
  bool get wantKeepAlive => true;

  void _observeScroll(double pixels) {
    var opacity = pixels / showAppbarPos;
    if(opacity<0){
      opacity = 0;
    }else if(opacity > 1){
      opacity = 1;
    }
    setState(() {
      _appbarOpacity = opacity;
    });
  }

  void getInitData() async {
    setState(() {
      loadingIndicator = true;
    });

    try {
      List results = await Future.wait([
        HomeApi.requestEntryLongFor(),
        HomeApi.requestCategories(),
      ]);

      entryLongFor = results[0];
      categories = results[1];
    } catch (error) {
      // 处理错误情况
    } finally {
      setState(() {
        loadingIndicator = false;
      });
    }
  }
}
