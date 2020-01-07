import 'package:messanger/src/models/call_model.dart';

class CallDataModel {
  final List<CallModel> calls;

  CallDataModel({this.calls});

  CallDataModel.fromJson(Map<String, dynamic> json)
      : calls = makeCalls(json['calls'] ?? []);

  static makeCalls(List<dynamic> calls) {
    return calls.map((call) => CallModel.fromJson(call)).toList();
  }
}
