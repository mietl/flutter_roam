/*
  {
    "args": {},
    "headers": {
      "Accept": "application/json",
      "Accept-Encoding": "gzip, deflate",
      "Accept-Language": "zh-CN,zh;q=0.9",
      "Host": "httpbin.org",
      "Referer": "http://httpbin.org/",
      "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36",
      "X-Amzn-Trace-Id": "Root=1-65dadc5d-6ec4ae500c5293e55a9c98d4"
    },
    "origin": "157.254.20.4",
    "url": "http://httpbin.org/get"
  }
*/

class DartModel{
  Args? args;
  Headers? headers;
  String? origin;
  String? url;

  DartModel({this.args,this.origin,this.headers,this.url });


  DartModel.formJson(Map<String,dynamic> json){
    args = json['args'] != null? Args.fromJson(json['args']): null;
    headers = json['headers']!=null ? Headers.fromJson(json['headers']):null;

    origin = json['origin'];
    url = json['url'];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};

    if(args !=null){
      data['args'] = args!;
    }
    if(headers != null){
      data['headers'] = headers!.toJson();
    }
    data['origin'] = origin;
    data['url'] = url;
    return data;
  }
}

class Headers {
  String? accept;
  String? acceptEncoding;
  String? acceptLanguage;
  String? host;
  String? referer;
  String? userAgent;
  String? xAmznTraceId;

  Headers.fromJson(json){
    accept = json['Accept'];
    acceptEncoding = json['Accept-Encoding'];
    acceptLanguage = json['Accept-Language'];
    host = json['Host'];
    referer = json['Referer'];
    userAgent = json['User-Agent'];
    xAmznTraceId = json['XAmznTraceId'];
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = <String,dynamic>{};

    data['Accept'] = accept;
    data['AcceptEncoding'] = accept;
    data['AcceptLanguage'] = accept;
    data['Host'] = accept;
    data['Referer'] = accept;
    data['UserAgent'] = accept;
    data['XAmznTraceId'] = accept;

    return data;
  }
}

class Args {
  Args();

  Args.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}