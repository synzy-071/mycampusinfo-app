// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'eligibility_criteria.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EligibilityCriteria {

 String? get admissionLevel; String? get ageCriteria; String? get otherInfo;
/// Create a copy of EligibilityCriteria
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityCriteriaCopyWith<EligibilityCriteria> get copyWith => _$EligibilityCriteriaCopyWithImpl<EligibilityCriteria>(this as EligibilityCriteria, _$identity);

  /// Serializes this EligibilityCriteria to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibilityCriteria&&(identical(other.admissionLevel, admissionLevel) || other.admissionLevel == admissionLevel)&&(identical(other.ageCriteria, ageCriteria) || other.ageCriteria == ageCriteria)&&(identical(other.otherInfo, otherInfo) || other.otherInfo == otherInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionLevel,ageCriteria,otherInfo);

@override
String toString() {
  return 'EligibilityCriteria(admissionLevel: $admissionLevel, ageCriteria: $ageCriteria, otherInfo: $otherInfo)';
}


}

/// @nodoc
abstract mixin class $EligibilityCriteriaCopyWith<$Res>  {
  factory $EligibilityCriteriaCopyWith(EligibilityCriteria value, $Res Function(EligibilityCriteria) _then) = _$EligibilityCriteriaCopyWithImpl;
@useResult
$Res call({
 String? admissionLevel, String? ageCriteria, String? otherInfo
});




}
/// @nodoc
class _$EligibilityCriteriaCopyWithImpl<$Res>
    implements $EligibilityCriteriaCopyWith<$Res> {
  _$EligibilityCriteriaCopyWithImpl(this._self, this._then);

  final EligibilityCriteria _self;
  final $Res Function(EligibilityCriteria) _then;

/// Create a copy of EligibilityCriteria
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? admissionLevel = freezed,Object? ageCriteria = freezed,Object? otherInfo = freezed,}) {
  return _then(_self.copyWith(
admissionLevel: freezed == admissionLevel ? _self.admissionLevel : admissionLevel // ignore: cast_nullable_to_non_nullable
as String?,ageCriteria: freezed == ageCriteria ? _self.ageCriteria : ageCriteria // ignore: cast_nullable_to_non_nullable
as String?,otherInfo: freezed == otherInfo ? _self.otherInfo : otherInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibilityCriteria].
extension EligibilityCriteriaPatterns on EligibilityCriteria {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EligibilityCriteria value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EligibilityCriteria() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EligibilityCriteria value)  $default,){
final _that = this;
switch (_that) {
case _EligibilityCriteria():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EligibilityCriteria value)?  $default,){
final _that = this;
switch (_that) {
case _EligibilityCriteria() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? admissionLevel,  String? ageCriteria,  String? otherInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EligibilityCriteria() when $default != null:
return $default(_that.admissionLevel,_that.ageCriteria,_that.otherInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? admissionLevel,  String? ageCriteria,  String? otherInfo)  $default,) {final _that = this;
switch (_that) {
case _EligibilityCriteria():
return $default(_that.admissionLevel,_that.ageCriteria,_that.otherInfo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? admissionLevel,  String? ageCriteria,  String? otherInfo)?  $default,) {final _that = this;
switch (_that) {
case _EligibilityCriteria() when $default != null:
return $default(_that.admissionLevel,_that.ageCriteria,_that.otherInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EligibilityCriteria implements EligibilityCriteria {
  const _EligibilityCriteria({this.admissionLevel, this.ageCriteria, this.otherInfo});
  factory _EligibilityCriteria.fromJson(Map<String, dynamic> json) => _$EligibilityCriteriaFromJson(json);

@override final  String? admissionLevel;
@override final  String? ageCriteria;
@override final  String? otherInfo;

/// Create a copy of EligibilityCriteria
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibilityCriteriaCopyWith<_EligibilityCriteria> get copyWith => __$EligibilityCriteriaCopyWithImpl<_EligibilityCriteria>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EligibilityCriteriaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EligibilityCriteria&&(identical(other.admissionLevel, admissionLevel) || other.admissionLevel == admissionLevel)&&(identical(other.ageCriteria, ageCriteria) || other.ageCriteria == ageCriteria)&&(identical(other.otherInfo, otherInfo) || other.otherInfo == otherInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,admissionLevel,ageCriteria,otherInfo);

@override
String toString() {
  return 'EligibilityCriteria(admissionLevel: $admissionLevel, ageCriteria: $ageCriteria, otherInfo: $otherInfo)';
}


}

/// @nodoc
abstract mixin class _$EligibilityCriteriaCopyWith<$Res> implements $EligibilityCriteriaCopyWith<$Res> {
  factory _$EligibilityCriteriaCopyWith(_EligibilityCriteria value, $Res Function(_EligibilityCriteria) _then) = __$EligibilityCriteriaCopyWithImpl;
@override @useResult
$Res call({
 String? admissionLevel, String? ageCriteria, String? otherInfo
});




}
/// @nodoc
class __$EligibilityCriteriaCopyWithImpl<$Res>
    implements _$EligibilityCriteriaCopyWith<$Res> {
  __$EligibilityCriteriaCopyWithImpl(this._self, this._then);

  final _EligibilityCriteria _self;
  final $Res Function(_EligibilityCriteria) _then;

/// Create a copy of EligibilityCriteria
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? admissionLevel = freezed,Object? ageCriteria = freezed,Object? otherInfo = freezed,}) {
  return _then(_EligibilityCriteria(
admissionLevel: freezed == admissionLevel ? _self.admissionLevel : admissionLevel // ignore: cast_nullable_to_non_nullable
as String?,ageCriteria: freezed == ageCriteria ? _self.ageCriteria : ageCriteria // ignore: cast_nullable_to_non_nullable
as String?,otherInfo: freezed == otherInfo ? _self.otherInfo : otherInfo // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
