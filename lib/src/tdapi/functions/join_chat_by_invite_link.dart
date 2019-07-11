part of '../tdapi.dart';

class JoinChatByInviteLink extends TLFunction {
  String inviteLink;
  dynamic extra;

  /// Uses an invite link to add the current user to the chat if possible. The new member will not be added until the chat state has been synchronized with the server.
  ///[inviteLink] Invite link to import; should begin with "https
  JoinChatByInviteLink({this.inviteLink});

  /// Parse from a json
  JoinChatByInviteLink.fromJson(Map<String, dynamic> json);

  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": CONSTRUCTOR,
      "invite_link": this.inviteLink,
      "@extra": this.extra
    };
  }

  static const String CONSTRUCTOR = "joinChatByInviteLink";

  @override
  String getConstructor() => CONSTRUCTOR;
}
