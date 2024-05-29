// To parse this JSON data, do
//
//     final bggSearch = bggSearchFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

BggSearch bggSearchFromJson(String str) => BggSearch.fromJson(json.decode(str));

String bggSearchToJson(BggSearch data) => json.encode(data.toJson());

class BggSearch {
  Items? items;

  BggSearch({
    this.items,
  });

  factory BggSearch.fromJson(Map<String, dynamic> json) => BggSearch(
        items: json["items"] == null ? null : Items.fromJson(json["items"]),
      );

  Map<String, dynamic> toJson() => {
        "items": items?.toJson(),
      };

  List<Item>? getItemList() {
    return items!.item;
  }

  String getNameAtIndex(int index) {
    return items!.item![index].name?.value ?? 'Failed to fetch name';
  }

  String getYearPublishedAtIndex(int index) {
    return items!.item![index].yearpublished?.value ??
        'Failed to fetch year published';
  }

  String getNameFollowedByYearPublishedAtIndex(int index) {
    String concatNameYear = getNameAtIndex(index);
    concatNameYear = '$concatNameYear (${getYearPublishedAtIndex(index)})';
    return concatNameYear;
  }
}

class Items {
  String? total;
  String? termsofuse;
  List<Item>? item;

  Items({
    this.total,
    this.termsofuse,
    this.item,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        total: json["@total"],
        termsofuse: json["@termsofuse"],
        item: json["item"] == null
            ? []
            : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@total": total,
        "@termsofuse": termsofuse,
        "item": item == null
            ? []
            : List<dynamic>.from(item!.map((x) => x.toJson())),
      };
}

class Item {
  ItemType? type;
  String? id;
  Name? name;
  Yearpublished? yearpublished;

  Item({
    this.type,
    this.id,
    this.name,
    this.yearpublished,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        type: itemTypeValues.map[json["@type"]]!,
        id: json["@id"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        yearpublished: json["yearpublished"] == null
            ? null
            : Yearpublished.fromJson(json["yearpublished"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": itemTypeValues.reverse[type],
        "@id": id,
        "name": name?.toJson(),
        "yearpublished": yearpublished?.toJson(),
      };
}

class Name {
  NameType? type;
  String? value;

  Name({
    this.type,
    this.value,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        type: nameTypeValues.map[json["@type"]],
        value: json["@value"],
      );

  Map<String, dynamic> toJson() => {
        "@type": nameTypeValues.reverse[type],
        "@value": value,
      };
}

enum NameType { PRIMARY, ALTERNATE }

final nameTypeValues = EnumValues({"primary": NameType.PRIMARY});

enum ItemType { BOARDGAME, BOARDGAMEEXPANSION, RPGITEM, VIDEOGAME }

final itemTypeValues = EnumValues({
  "boardgame": ItemType.BOARDGAME,
  "boardgameexpansion": ItemType.BOARDGAMEEXPANSION,
  "rpgitem": ItemType.RPGITEM,
  "videogame": ItemType.VIDEOGAME
});

class Yearpublished {
  String? value;

  Yearpublished({
    this.value,
  });

  factory Yearpublished.fromJson(Map<String, dynamic> json) => Yearpublished(
        value: json["@value"],
      );

  Map<String, dynamic> toJson() => {
        "@value": value,
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
