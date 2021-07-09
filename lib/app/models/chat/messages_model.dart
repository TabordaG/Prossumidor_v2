import 'package:json_annotation/json_annotation.dart';

part 'messages_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Messages {
  @JsonKey(required: false, disallowNullValue: false)
  // ignore: non_constant_identifier_names
  int messages_id;
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

  Messages({
    // ignore: non_constant_identifier_names
    this.messages_id,
    
  });

  factory Messages.fromJson(Map<String, dynamic> json) => _$MessagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesToJson(this);
}
