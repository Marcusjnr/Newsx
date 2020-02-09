import 'dart:convert';

NewsModel worldNewsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String worldNewsModelToJson(NewsModel data) => json.encode(data.toJson());

class NewsModel {
  NewsResponse response;

  NewsModel({
    this.response,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
    response: NewsResponse.fromJson(json["response"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response.toJson(),
  };
}

class NewsResponse {
  String status;
  String userTier;
  int total;
  int startIndex;
  int pageSize;
  int currentPage;
  int pages;
  Tion edition;
  Tion section;
  List<Result> results;

  NewsResponse({
    this.status,
    this.userTier,
    this.total,
    this.startIndex,
    this.pageSize,
    this.currentPage,
    this.pages,
    this.edition,
    this.section,
    this.results,
  });

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    status: json["status"],
    userTier: json["userTier"],
    total: json["total"],
    startIndex: json["startIndex"],
    pageSize: json["pageSize"],
    currentPage: json["currentPage"],
    pages: json["pages"],
    edition: Tion.fromJson(json["edition"]),
    section: Tion.fromJson(json["section"]),
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "userTier": userTier,
    "total": total,
    "startIndex": startIndex,
    "pageSize": pageSize,
    "currentPage": currentPage,
    "pages": pages,
    "edition": edition.toJson(),
    "section": section.toJson(),
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Tion {
  String id;
  String webTitle;
  String webUrl;
  String apiUrl;
  String code;
  List<Tion> editions;

  Tion({
    this.id,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.code,
    this.editions,
  });

  factory Tion.fromJson(Map<String, dynamic> json) => Tion(
    id: json["id"],
    webTitle: json["webTitle"],
    webUrl: json["webUrl"],
    apiUrl: json["apiUrl"],
    code: json["code"] == null ? null : json["code"],
    editions: json["editions"] == null ? null : List<Tion>.from(json["editions"].map((x) => Tion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "webTitle": webTitle,
    "webUrl": webUrl,
    "apiUrl": apiUrl,
    "code": code == null ? null : code,
    "editions": editions == null ? null : List<dynamic>.from(editions.map((x) => x.toJson())),
  };
}

class Result {
  String id;
  String type;
  String sectionId;
  String sectionName;
  DateTime webPublicationDate;
  String webTitle;
  String webUrl;
  String apiUrl;
  Fields fields;
  bool isHosted;
  String pillarId;
  String pillarName;

  Result({
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.webPublicationDate,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.fields,
    this.isHosted,
    this.pillarId,
    this.pillarName,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    type: json["type"],
    sectionId: json["sectionId"],
    sectionName: json["sectionName"],
    webPublicationDate: DateTime.parse(json["webPublicationDate"]),
    webTitle: json["webTitle"],
    webUrl: json["webUrl"],
    apiUrl: json["apiUrl"],
    fields: Fields.fromJson(json["fields"]),
    isHosted: json["isHosted"],
    pillarId: json["pillarId"],
    pillarName: json["pillarName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "sectionId": sectionId,
    "sectionName": sectionName,
    "webPublicationDate": webPublicationDate.toIso8601String(),
    "webTitle": webTitle,
    "webUrl": webUrl,
    "apiUrl": apiUrl,
    "fields": fields.toJson(),
    "isHosted": isHosted,
    "pillarId": pillarId,
    "pillarName": pillarName,
  };
}

class Fields {
  String headline;
  String body;
  String thumbnail;

  Fields({
    this.headline,
    this.body,
    this.thumbnail,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    headline: json["headline"],
    body: json["body"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "headline": headline,
    "body": body,
    "thumbnail": thumbnail,
  };
}
