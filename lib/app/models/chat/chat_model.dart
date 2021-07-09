import 'package:json_annotation/json_annotation.dart';

part 'chat_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Chat {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int chat_id;
  @JsonKey(required: false, disallowNullValue: false)
  String nome;
  @JsonKey(required: false, disallowNullValue: false)
  String lastMessage;
  @JsonKey(required: false, disallowNullValue: false)
  int verify;
  @JsonKey(required: false, disallowNullValue: false)
  String data;
  @JsonKey(required: false, disallowNullValue: false)
  String horas;

  Chat({
    // ignore: non_constant_identifier_names
    chat_id,
    nome,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);
}
