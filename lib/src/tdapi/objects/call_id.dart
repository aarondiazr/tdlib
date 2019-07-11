part of '../tdapi.dart';

class CallId implements TLObject {
  int id;
  dynamic extra;

  /// Contains the call identifier.
  ///[id] Call identifier
  CallId({this.id});

  /// Parse from a json
  CallId.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.extra = json['@extra'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {"@type": CONSTRUCTOR, "id": this.id};
  }

  static const String CONSTRUCTOR = "callId";

  @override
  String getConstructor() => CONSTRUCTOR;
}
