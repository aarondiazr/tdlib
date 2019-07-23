part of '../tdapi.dart';

class Venue implements TdObject {
  Location location;
  String title;
  String address;
  String provider;
  String id;
  String type;

  /// Describes a venue.
  ///[location] Venue location; as defined by the sender .
  /// [title] Venue name; as defined by the sender .
  /// [address] Venue address; as defined by the sender .
  /// [provider] Provider of the venue database; as defined by the sender. Currently only "foursquare" needs to be supported.
  /// [id] Identifier of the venue in the provider database; as defined by the sender .
  /// [type] Type of the venue in the provider database; as defined by the sender
  Venue(
      {this.location,
      this.title,
      this.address,
      this.provider,
      this.id,
      this.type});

  /// Parse from a json
  Venue.fromJson(Map<String, dynamic> json) {
    this.location = Location.fromJson(json['location'] ?? <String, dynamic>{});
    this.title = json['title'];
    this.address = json['address'];
    this.provider = json['provider'];
    this.id = json['id'];
    this.type = json['type'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "location": this.location.toJson(),
      "title": this.title,
      "address": this.address,
      "provider": this.provider,
      "id": this.id,
      "type": this.type
    };
  }

  static const String CONSTRUCTOR = "venue";

  @override
  String getConstructor() => CONSTRUCTOR;
}
