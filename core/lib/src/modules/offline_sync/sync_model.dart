import 'dart:convert';

import 'package:core/src/modules/offline_sync/sync_enum.dart';
import 'package:flutter/foundation.dart';

class SyncModel {
  final String key;
  final Map<String, dynamic> data;
  final int valueId;
  final SyncOperationEnum operation;

  SyncModel({
    required this.key,
    required this.data,
    required this.valueId,
    required this.operation,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'data': data,
      'valueId': valueId,
      'operation': operation.name,
    };
  }

  factory SyncModel.fromMap(Map<String, dynamic> map) {
    return SyncModel(
      key: map['key'],
      data: Map<String, dynamic>.from(map['data']),
      valueId: map['valueId'],
      operation: SyncOperationEnum.values.firstWhere((element) => element.name == map['operation']),
    );
  }
}
