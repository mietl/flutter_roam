import 'package:flutter/material.dart';
import 'package:flutter_roam/api/search_api.dart';
import 'package:flutter_roam/models/search/suggest_result.dart';

class SearchPage extends StatefulWidget {
  final String? defaultHintWord;

  const SearchPage({super.key,this.defaultHintWord});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool showClearIcon = true;

  List<Suggest> suggestsList = [];
  TextEditingController searchController = TextEditingController();


  AppBar _appBar(context){
    return AppBar(
      shape: const UnderlineInputBorder(
        borderSide: BorderSide( color:Color(0xFFD5D2EF)),
      ),
      title: Row(
        children: [
          Expanded(child:
            Row(
              children: [
                Expanded(
                    child:TextField(
                      onChanged: onSearchInputChanged,
                      autofocus: true,
                      controller: searchController,
                      style: const TextStyle(fontSize: 17),
                      onEditingComplete:(){
                        // onSearchKeyword
                        search(searchController.text);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.defaultHintWord,
                        suffixIcon: Offstage(
                          offstage: !showClearIcon,
                          child: IconButton(
                            icon: const Icon(Icons.close_rounded),
                            onPressed: () {
                              searchController.clear();
                              setState(() {
                                showClearIcon = false;
                              });
                            },
                          ),
                        )
                      ),
                    )
                )
              ],
            ),
          ),
          SizedBox(
            width: 70,
            child: IconButton(
              onPressed: (){

              },
              icon: const Icon(Icons.search_rounded),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ListView.builder(
          itemCount: suggestsList.length,
          itemBuilder: (BuildContext context,int i){
            return _buildListTile(suggestsList[i]);
          }
      )
    );
  }

  String toPrice(int? price){
    return price!=0?'¥$price起':'';
  }

  _highlightWord(String? text){
    String keyword = searchController.text.toLowerCase();

    if(text == null || text.isEmpty){
      return const Text('');
    }

    text = text.toLowerCase();

    List<String> arr = text.split(keyword);

    List<TextSpan> spans = [];

    for(int i = 0; i< arr.length;i++){
      if(i!=0){
        spans.add(TextSpan(
          text: keyword,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFFff9645)
          )
        ));
      }

      spans.add(TextSpan(
        text: arr[i],
        style: const TextStyle(
           fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0xFF424242)
        )
      ));
    }
  
    return RichText(text: TextSpan(
      children: spans
    ));
  }

  _buildListTile(Suggest item){
    return ListTile(
      title: _highlightWord(item.itemName),
      subtitle: Text(toPrice(item.unitPrice),style: const TextStyle(
        fontSize: 12,
        color: Color(0xFFE59E99)
      )),
      trailing: Text(item.itemTypeShowName ?? '',style: const TextStyle(fontSize: 13,color: Color(0xFF666666))),
    );
  }

  onSearchInputChanged(keyword) async {
    // 输入过快时，应当取消上次请求
    // http不支持终止请求 https://github.com/dart-lang/http/issues/424
    if(keyword.trim().isNotEmpty){
      final suggestsResult = await SearchApi.searchKeywordSuggests(keyword);
      // 解决当输入过快时，响应先后是不确定，导致输入和显示当内容不一致
      if(suggestsResult.keyword==keyword){
        // 输入的内容与响应内容对应时，才设置
        setState(() {
          suggestsList = suggestsResult.suggests;
        });
      }
    }

    setState(() {
      showClearIcon = keyword.isNotEmpty;
    });
  }
}

void search(value) {

}
