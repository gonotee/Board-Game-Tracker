// To parse this JSON data, do
//
//     final bggItem = bggItemFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

BggItem bggItemFromJson(String str) => BggItem.fromJson(json.decode(str));

String bggItemToJson(BggItem data) => json.encode(data.toJson());

class BggItem {
  Items? items;

  BggItem({
    this.items,
  });

  factory BggItem.fromJson(Map<String, dynamic> json) => BggItem(
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "items": items?.toJson(),
      };

  bool hasThumbnail() {
    if (items!.item!.thumbnail!.empty != null) {
      return true;
    } else {
      return false;
    }
  }

  String getName() {
    return items!.item!.name?.value ?? 'Failed to fetch name';
  }

  String getId() {
    return items!.item!.id ?? 'Failed to fetch id';
  }

  String getDescription() {
    return sanitizeString(
        items!.item!.description?.empty ?? 'Failed to fetch description');
  }

  String getImage() {
    return items!.item!.image?.empty ?? 'Failed to fetch image';
  }

  /// This function sanitizes the provided string and removes any unicode or ASCII
  String sanitizeString(String str) {
    str = str.replaceAll('&#10', '');
    str = str.replaceAll(';', ' ');
    return str;
  }
}

class Items {
  String? termsofuse;
  Item? item;

  Items({
    this.termsofuse,
    this.item,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        termsofuse: json["@termsofuse"],
        item: json["item"] == null ? null : Item.fromJson(json["item"]),
      );

  Map<String, dynamic> toJson() => {
        "@termsofuse": termsofuse,
        "item": item?.toJson(),
      };
}

class Item {
  String? type;
  String? id;
  Description? thumbnail;
  Description? image;
  Name? name;
  Description? description;
  Maxplayers? yearpublished;
  Maxplayers? minplayers;
  Maxplayers? maxplayers;
  List<Poll>? poll;
  Maxplayers? playingtime;
  Maxplayers? minplaytime;
  Maxplayers? maxplaytime;
  Maxplayers? minage;
  List<Link>? link;

  Item({
    this.type,
    this.id,
    this.thumbnail,
    this.image,
    this.name,
    this.description,
    this.yearpublished,
    this.minplayers,
    this.maxplayers,
    this.poll,
    this.playingtime,
    this.minplaytime,
    this.maxplaytime,
    this.minage,
    this.link,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: json["@type"],
        id: json["@id"],
        thumbnail: json["thumbnail"] == null
            ? null
            : Description.fromJson(json["thumbnail"]),
        image:
            json["image"] == null ? null : Description.fromJson(json["image"]),
        name: json["name"] == null
            ? null
            : json["name"] is List<dynamic>
                ? Name.fromJson(json["name"][0])
                : Name.fromJson(json["name"]),
        description: json["description"] == null
            ? null
            : Description.fromJson(json["description"]),
        yearpublished: json["yearpublished"] == null
            ? null
            : Maxplayers.fromJson(json["yearpublished"]),
        minplayers: json["minplayers"] == null
            ? null
            : Maxplayers.fromJson(json["minplayers"]),
        maxplayers: json["maxplayers"] == null
            ? null
            : Maxplayers.fromJson(json["maxplayers"]),
        poll: json["poll"] == null
            ? []
            : List<Poll>.from(json["poll"]!.map((x) => Poll.fromJson(x))),
        playingtime: json["playingtime"] == null
            ? null
            : Maxplayers.fromJson(json["playingtime"]),
        minplaytime: json["minplaytime"] == null
            ? null
            : Maxplayers.fromJson(json["minplaytime"]),
        maxplaytime: json["maxplaytime"] == null
            ? null
            : Maxplayers.fromJson(json["maxplaytime"]),
        minage:
            json["minage"] == null ? null : Maxplayers.fromJson(json["minage"]),
        link: json["link"] == null
            ? []
            : List<Link>.from(json["link"]!.map((x) => Link.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "@id": id,
        "thumbnail": thumbnail?.toJson(),
        "image": image?.toJson(),
        "name": name?.toJson(),
        "description": description?.toJson(),
        "yearpublished": yearpublished?.toJson(),
        "minplayers": minplayers?.toJson(),
        "maxplayers": maxplayers?.toJson(),
        "poll": poll == null
            ? []
            : List<dynamic>.from(poll!.map((x) => x.toJson())),
        "playingtime": playingtime?.toJson(),
        "minplaytime": minplaytime?.toJson(),
        "maxplaytime": maxplaytime?.toJson(),
        "minage": minage?.toJson(),
        "link": link == null
            ? []
            : List<dynamic>.from(link!.map((x) => x.toJson())),
      };
}

class Description {
  String? empty;

  Description({
    this.empty,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        empty: json["\u0024"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty,
      };
}

class Link {
  LinkType? type;
  String? id;
  String? value;

  Link({
    this.type,
    this.id,
    this.value,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        type: linkTypeValues.map[json["@type"]]!,
        id: json["@id"],
        value: json["@value"],
      );

  Map<String, dynamic> toJson() => {
        "@type": linkTypeValues.reverse[type],
        "@id": id,
        "@value": value,
      };
}

enum LinkType {
  BOARDGAMEACCESSORY,
  BOARDGAMEARTIST,
  BOARDGAMECATEGORY,
  BOARDGAMEDESIGNER,
  BOARDGAMEEXPANSION,
  BOARDGAMEFAMILY,
  BOARDGAMEIMPLEMENTATION,
  BOARDGAMEINTEGRATION,
  BOARDGAMEMECHANIC,
  BOARDGAMEPUBLISHER
}

final linkTypeValues = EnumValues({
  "boardgameaccessory": LinkType.BOARDGAMEACCESSORY,
  "boardgameartist": LinkType.BOARDGAMEARTIST,
  "boardgamecategory": LinkType.BOARDGAMECATEGORY,
  "boardgamedesigner": LinkType.BOARDGAMEDESIGNER,
  "boardgameexpansion": LinkType.BOARDGAMEEXPANSION,
  "boardgamefamily": LinkType.BOARDGAMEFAMILY,
  "boardgameimplementation": LinkType.BOARDGAMEIMPLEMENTATION,
  "boardgameintegration": LinkType.BOARDGAMEINTEGRATION,
  "boardgamemechanic": LinkType.BOARDGAMEMECHANIC,
  "boardgamepublisher": LinkType.BOARDGAMEPUBLISHER
});

class Maxplayers {
  String? value;

  Maxplayers({
    this.value,
  });

  factory Maxplayers.fromJson(Map<String, dynamic> json) => Maxplayers(
        value: json["@value"],
      );

  Map<String, dynamic> toJson() => {
        "@value": value,
      };
}

class Name {
  NameType? type;
  String? sortindex;
  String? value;

  Name({
    this.type,
    this.sortindex,
    this.value,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        type: nameTypeValues.map[json["@type"]]!,
        sortindex: json["@sortindex"],
        value: json["@value"],
      );

  Map<String, dynamic> toJson() => {
        "@type": nameTypeValues.reverse[type],
        "@sortindex": sortindex,
        "@value": value,
      };
}

enum NameType { ALTERNATE, PRIMARY }

final nameTypeValues =
    EnumValues({"alternate": NameType.ALTERNATE, "primary": NameType.PRIMARY});

class Poll {
  String? name;
  String? title;
  String? totalvotes;
  dynamic results;

  Poll({
    this.name,
    this.title,
    this.totalvotes,
    this.results,
  });

  factory Poll.fromJson(Map<String, dynamic> json) => Poll(
        name: json["@name"],
        title: json["@title"],
        totalvotes: json["@totalvotes"],
        results: json["results"],
      );

  Map<String, dynamic> toJson() => {
        "@name": name,
        "@title": title,
        "@totalvotes": totalvotes,
        "results": results,
      };
}

class PurpleResult {
  String? numplayers;
  List<ResultResult>? result;

  PurpleResult({
    this.numplayers,
    this.result,
  });

  factory PurpleResult.fromJson(Map<String, dynamic> json) => PurpleResult(
        numplayers: json["@numplayers"],
        result: json["result"] == null
            ? []
            : List<ResultResult>.from(
                json["result"]!.map((x) => ResultResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@numplayers": numplayers,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class ResultResult {
  Value? value;
  String? numvotes;

  ResultResult({
    this.value,
    this.numvotes,
  });

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
        value: valueValues.map[json["@value"]]!,
        numvotes: json["@numvotes"],
      );

  Map<String, dynamic> toJson() => {
        "@value": valueValues.reverse[value],
        "@numvotes": numvotes,
      };
}

enum Value { BEST, NOT_RECOMMENDED, RECOMMENDED }

final valueValues = EnumValues({
  "Best": Value.BEST,
  "Not Recommended": Value.NOT_RECOMMENDED,
  "Recommended": Value.RECOMMENDED
});

class ResultsClass {
  List<FluffyResult>? result;

  ResultsClass({
    this.result,
  });

  factory ResultsClass.fromJson(Map<String, dynamic> json) => ResultsClass(
        result: json["result"] == null
            ? []
            : List<FluffyResult>.from(
                json["result"]!.map((x) => FluffyResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class FluffyResult {
  String? value;
  String? numvotes;
  String? level;

  FluffyResult({
    this.value,
    this.numvotes,
    this.level,
  });

  factory FluffyResult.fromJson(Map<String, dynamic> json) => FluffyResult(
        value: json["@value"],
        numvotes: json["@numvotes"],
        level: json["@level"],
      );

  Map<String, dynamic> toJson() => {
        "@value": value,
        "@numvotes": numvotes,
        "@level": level,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
