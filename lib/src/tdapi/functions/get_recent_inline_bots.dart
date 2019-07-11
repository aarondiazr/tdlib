part of '../tdapi.dart';

class GetRecentInlineBots extends TLFunction {
  dynamic extra;

  /// Returns up to 20 recently used inline bots in the order of their last usage.
  ///
  GetRecentInlineBots();

  /// Parse from a json
  GetRecentInlineBots.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    return {"@type": CONSTRUCTOR, "@extra": this.extra};
  }

  static const String CONSTRUCTOR = "getRecentInlineBots";

  @override
  String getConstructor() => CONSTRUCTOR;
}
