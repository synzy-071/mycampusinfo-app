// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timeline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimeLine {

 DateTime? get admissionStartDate; DateTime? get admissionEndDate; String? get status; List<String>? get documentsRequired; EligibilityCriteria? get eligibility; num? get applicationFee;@JsonKey(name: '_id') String? get sId;
/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeLineCopyWith<TimeLine> get copyWith => _$TimeLineCopyWithImpl<TimeLine>(this as TimeLine, _$identity);

  /// Serializes this TimeLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeLine&&(identical(other.admissionStartDate, admissionStartDate) || other.admissionStartDate == admissionStartDate)&&(identical(other.admissionEndDate, admissionEndDate) || other.admissionEndDate == admissionEndDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.documentsRequired, documentsRequired)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.applicationFee, applicationFee) || other.applicationFee == applicationFee)&&(identical(other.sId, sId) || other.sId == sId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionStartDate,admissionEndDate,status,const DeepCollectionEquality().hash(documentsRequired),eligibility,applicationFee,sId);

@override
String toString() {
  return 'TimeLine(admissionStartDate: $admissionStartDate, admissionEndDate: $admissionEndDate, status: $status, documentsRequired: $documentsRequired, eligibility: $eligibility, applicationFee: $applicationFee, sId: $sId)';
}


}

/// @nodoc
abstract mixin class $TimeLineCopyWith<$Res>  {
  factory $TimeLineCopyWith(TimeLine value, $Res Function(TimeLine) _then) = _$TimeLineCopyWithImpl;
@useResult
$Res call({
 DateTime? admissionStartDate, DateTime? admissionEndDate, String? status, List<String>? documentsRequired, EligibilityCriteria? eligibility, num? applicationFee,@JsonKey(name: '_id') String? sId
});


$EligibilityCriteriaCopyWith<$Res>? get eligibility;

}
/// @nodoc
class _$TimeLineCopyWithImpl<$Res>
    implements $TimeLineCopyWith<$Res> {
  _$TimeLineCopyWithImpl(this._self, this._then);

  final TimeLine _self;
  final $Res Function(TimeLine) _then;

/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admissionStartDate = freezed,Object? admissionEndDate = freezed,Object? status = freezed,Object? documentsRequired = freezed,Object? eligibility = freezed,Object? applicationFee = freezed,Object? sId = freezed,}) {
  return _then(_self.copyWith(
admissionStartDate: freezed == admissionStartDate ? _self.admissionStartDate : admissionStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,admissionEndDate: freezed == admissionEndDate ? _self.admissionEndDate : admissionEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,documentsRequired: freezed == documentsRequired ? _self.documentsRequired : documentsRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as EligibilityCriteria?,applicationFee: freezed == applicationFee ? _self.applicationFee : applicationFee // ignore: cast_nullable_to_non_nullable
as num?,sId: freezed == sId ? _self.sId : sId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EligibilityCriteriaCopyWith<$Res>? get eligibility {
    if (_self.eligibility == null) {
    return null;
  }

  return $EligibilityCriteriaCopyWith<$Res>(_self.eligibility!, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimeLine].
extension TimeLinePatterns on TimeLine {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimeLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimeLine() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimeLine value)  $default,){
final _that = this;
switch (_that) {
case _TimeLine():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimeLine value)?  $default,){
final _that = this;
switch (_that) {
case _TimeLine() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? admissionStartDate,  DateTime? admissionEndDate,  String? status,  List<String>? documentsRequired,  EligibilityCriteria? eligibility,  num? applicationFee, @JsonKey(name: '_id')  String? sId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimeLine() when $default != null:
return $default(_that.admissionStartDate,_that.admissionEndDate,_that.status,_that.documentsRequired,_that.eligibility,_that.applicationFee,_that.sId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? admissionStartDate,  DateTime? admissionEndDate,  String? status,  List<String>? documentsRequired,  EligibilityCriteria? eligibility,  num? applicationFee, @JsonKey(name: '_id')  String? sId)  $default,) {final _that = this;
switch (_that) {
case _TimeLine():
return $default(_that.admissionStartDate,_that.admissionEndDate,_that.status,_that.documentsRequired,_that.eligibility,_that.applicationFee,_that.sId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? admissionStartDate,  DateTime? admissionEndDate,  String? status,  List<String>? documentsRequired,  EligibilityCriteria? eligibility,  num? applicationFee, @JsonKey(name: '_id')  String? sId)?  $default,) {final _that = this;
switch (_that) {
case _TimeLine() when $default != null:
return $default(_that.admissionStartDate,_that.admissionEndDate,_that.status,_that.documentsRequired,_that.eligibility,_that.applicationFee,_that.sId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimeLine implements TimeLine {
  const _TimeLine({this.admissionStartDate, this.admissionEndDate, this.status, final  List<String>? documentsRequired, this.eligibility, this.applicationFee, @JsonKey(name: '_id') this.sId}): _documentsRequired = documentsRequired;
  factory _TimeLine.fromJson(Map<String, dynamic> json) => _$TimeLineFromJson(json);

@override final  DateTime? admissionStartDate;
@override final  DateTime? admissionEndDate;
@override final  String? status;
 final  List<String>? _documentsRequired;
@override List<String>? get documentsRequired {
  final value = _documentsRequired;
  if (value == null) return null;
  if (_documentsRequired is EqualUnmodifiableListView) return _documentsRequired;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  EligibilityCriteria? eligibility;
@override final  num? applicationFee;
@override@JsonKey(name: '_id') final  String? sId;

/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeLineCopyWith<_TimeLine> get copyWith => __$TimeLineCopyWithImpl<_TimeLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimeLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimeLine&&(identical(other.admissionStartDate, admissionStartDate) || other.admissionStartDate == admissionStartDate)&&(identical(other.admissionEndDate, admissionEndDate) || other.admissionEndDate == admissionEndDate)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._documentsRequired, _documentsRequired)&&(identical(other.eligibility, eligibility) || other.eligibility == eligibility)&&(identical(other.applicationFee, applicationFee) || other.applicationFee == applicationFee)&&(identical(other.sId, sId) || other.sId == sId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionStartDate,admissionEndDate,status,const DeepCollectionEquality().hash(_documentsRequired),eligibility,applicationFee,sId);

@override
String toString() {
  return 'TimeLine(admissionStartDate: $admissionStartDate, admissionEndDate: $admissionEndDate, status: $status, documentsRequired: $documentsRequired, eligibility: $eligibility, applicationFee: $applicationFee, sId: $sId)';
}


}

/// @nodoc
abstract mixin class _$TimeLineCopyWith<$Res> implements $TimeLineCopyWith<$Res> {
  factory _$TimeLineCopyWith(_TimeLine value, $Res Function(_TimeLine) _then) = __$TimeLineCopyWithImpl;
@override @useResult
$Res call({
 DateTime? admissionStartDate, DateTime? admissionEndDate, String? status, List<String>? documentsRequired, EligibilityCriteria? eligibility, num? applicationFee,@JsonKey(name: '_id') String? sId
});


@override $EligibilityCriteriaCopyWith<$Res>? get eligibility;

}
/// @nodoc
class __$TimeLineCopyWithImpl<$Res>
    implements _$TimeLineCopyWith<$Res> {
  __$TimeLineCopyWithImpl(this._self, this._then);

  final _TimeLine _self;
  final $Res Function(_TimeLine) _then;

/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admissionStartDate = freezed,Object? admissionEndDate = freezed,Object? status = freezed,Object? documentsRequired = freezed,Object? eligibility = freezed,Object? applicationFee = freezed,Object? sId = freezed,}) {
  return _then(_TimeLine(
admissionStartDate: freezed == admissionStartDate ? _self.admissionStartDate : admissionStartDate // ignore: cast_nullable_to_non_nullable
as DateTime?,admissionEndDate: freezed == admissionEndDate ? _self.admissionEndDate : admissionEndDate // ignore: cast_nullable_to_non_nullable
as DateTime?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,documentsRequired: freezed == documentsRequired ? _self._documentsRequired : documentsRequired // ignore: cast_nullable_to_non_nullable
as List<String>?,eligibility: freezed == eligibility ? _self.eligibility : eligibility // ignore: cast_nullable_to_non_nullable
as EligibilityCriteria?,applicationFee: freezed == applicationFee ? _self.applicationFee : applicationFee // ignore: cast_nullable_to_non_nullable
as num?,sId: freezed == sId ? _self.sId : sId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TimeLine
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EligibilityCriteriaCopyWith<$Res>? get eligibility {
    if (_self.eligibility == null) {
    return null;
  }

  return $EligibilityCriteriaCopyWith<$Res>(_self.eligibility!, (value) {
    return _then(_self.copyWith(eligibility: value));
  });
}
}

// dart format on
