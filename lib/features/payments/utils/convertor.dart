import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mycampusinfo_app/features/detailPages/admission-timeline/data/entities/index.dart';

import 'enum.dart';

class StringOrPaymentStatusConverter
    implements JsonConverter<PaymentStatus, String> {
  const StringOrPaymentStatusConverter();

  @override
  PaymentStatus fromJson(String json) {
    return PaymentStatusExt.fromValue(json);
  }

  @override
  String toJson(PaymentStatus object) {
    return object.label;
  }
}

class StringOrTimeLineConverter implements JsonConverter<TimeLine?, dynamic> {
  const StringOrTimeLineConverter();

  @override
  TimeLine? fromJson(dynamic json) {
    if (json is String) {
      return null;
    }
    if (json is Map<String, dynamic>) {
      return TimeLine.fromJson(json);
    }
    return null;
  }

  @override
  dynamic toJson(TimeLine? object) {
    if (object == null) {
      return null;
    }
    return object.toJson();
  }
}
