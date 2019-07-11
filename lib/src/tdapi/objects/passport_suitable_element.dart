part of '../tdapi.dart';

class PassportSuitableElement implements TLObject {
  var type;
  bool isSelfieRequired;
  bool isTranslationRequired;
  bool isNativeNameRequired;

  /// Contains information about a Telegram Passport element that was requested by a service.
  ///[type] Type of the element .
  /// [isSelfieRequired] True, if a selfie is required with the identity document.
  /// [isTranslationRequired] True, if a certified English translation is required with the document .
  /// [isNativeNameRequired] True, if personal details must include the user's name in the language of their country of residence
  PassportSuitableElement(
      {this.type,
      this.isSelfieRequired,
      this.isTranslationRequired,
      this.isNativeNameRequired});

  /// Parse from a json
  PassportSuitableElement.fromJson(Map<String, dynamic> json) {
    this.type =
        PassportElementType.fromJson(json['type'] ?? <String, dynamic>{});
    this.isSelfieRequired = json['is_selfie_required'];
    this.isTranslationRequired = json['is_translation_required'];
    this.isNativeNameRequired = json['is_native_name_required'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "type": this.type.toJson(),
      "is_selfie_required": this.isSelfieRequired,
      "is_translation_required": this.isTranslationRequired,
      "is_native_name_required": this.isNativeNameRequired
    };
  }

  static const String CONSTRUCTOR = "passportSuitableElement";

  @override
  String getConstructor() => CONSTRUCTOR;
}
