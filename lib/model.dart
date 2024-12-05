import 'dart:convert';

class ApiResponse {
  final int code;
  final String message;
  final ResponseObject responseObject;

  ApiResponse({
    required this.code,
    required this.message,
    required this.responseObject,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      message: json['message'],
      responseObject: ResponseObject.fromJson(json['responseObject']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'responseObject': responseObject.toJson(),
    };
  }
}

class ResponseObject {
  final List<ContentShelf> contentShelfs;

  ResponseObject({required this.contentShelfs});

  factory ResponseObject.fromJson(Map<String, dynamic> json) {
    return ResponseObject(
      contentShelfs: (json['contentShelfs'] as List)
          .map((item) => ContentShelf.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentShelfs': contentShelfs.map((shelf) => shelf.toJson()).toList(),
    };
  }
}

class ContentShelf {
  final String? subTitle;
  final String title;
  final String type;
  final ViewMore? viewMore;
  final List<Item>? items;
  final String? coverUrl;

  ContentShelf({
    this.subTitle,
    required this.title,
    required this.type,
    this.viewMore,
    this.items,
    this.coverUrl,
  });

  factory ContentShelf.fromJson(Map<String, dynamic> json) {
    return ContentShelf(
      subTitle: json['subTitle'],
      title: json['title'],
      type: json['type'],
      viewMore: json['viewMore'] != null
          ? ViewMore.fromJson(json['viewMore'])
          : null,
      items: json['items'] != null
          ? (json['items'] as List).map((item) => Item.fromJson(item)).toList()
          : null,
      coverUrl: json['coverUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'subTitle': subTitle,
      'title': title,
      'type': type,
      'viewMore': viewMore?.toJson(),
      'items': items?.map((item) => item.toJson()).toList(),
      'coverUrl': coverUrl,
    };
  }
}

class ViewMore {
  final String contentUrl;
  final bool enabled;

  ViewMore({required this.contentUrl, required this.enabled});

  factory ViewMore.fromJson(Map<String, dynamic> json) {
    return ViewMore(
      contentUrl: json['contentUrl'],
      enabled: json['enabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'contentUrl': contentUrl,
      'enabled': enabled,
    };
  }
}

class Item {
  final String? coverUrl;
  final int id;
  final String? subTitle;
  final String? title;
  final String? type;
  final String? album;
  final String? artist;
  final int? conditions;
  final String? contentUrl;
  final String? numOfListener;
  final int? numOfSong;
  final int? statusTag;

  Item({
    this.coverUrl,
    required this.id,
    this.subTitle,
    this.title,
    this.type,
    this.album,
    this.artist,
    this.conditions,
    this.contentUrl,
    this.numOfListener,
    this.numOfSong,
    this.statusTag,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      coverUrl: json['coverUrl'],
      id: json['id'],
      subTitle: json['subTitle'],
      title: json['title'],
      type: json['type'],
      album: json['album'],
      artist: json['artist'],
      conditions: json['conditions'],
      contentUrl: json['contentUrl'],
      numOfListener: json['numOfListener'],
      numOfSong: json['numOfSong'],
      statusTag: json['statusTag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coverUrl': coverUrl,
      'id': id,
      'subTitle': subTitle,
      'title': title,
      'type': type,
      'album': album,
      'artist': artist,
      'conditions': conditions,
      'contentUrl': contentUrl,
      'numOfListener': numOfListener,
      'numOfSong': numOfSong,
      'statusTag': statusTag,
    };
  }
}
