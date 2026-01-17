// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admission-model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdmissionTimeline {

 String? get id; String? get collegeId; List<TimeLine>? get timelines;
/// Create a copy of AdmissionTimeline
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdmissionTimelineCopyWith<AdmissionTimeline> get copyWith => _$AdmissionTimelineCopyWithImpl<AdmissionTimeline>(this as AdmissionTimeline, _$identity);

  /// Serializes this AdmissionTimeline to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdmissionTimeline&&(identical(other.id, id) || other.id == id)&&(identical(other.collegeId, collegeId) || other.collegeId == collegeId)&&const DeepCollectionEquality().equals(other.timelines, timelines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,collegeId,const DeepCollectionEquality().hash(timelines));

@override
String toString() {
  return 'AdmissionTimeline(id: $id, collegeId: $collegeId, timelines: $timelines)';
}


}

/// @nodoc
abstract mixin class $AdmissionTimelineCopyWith<$Res>  {
  factory $AdmissionTimelineCopyWith(AdmissionTimeline value, $Res Function(AdmissionTimeline) _then) = _$AdmissionTimelineCopyWithImpl;
@useResult
$Res call({
 String? id, String? collegeId, List<TimeLine>? timelines
});




}
/// @nodoc
class _$AdmissionTimelineCopyWithImpl<$Res>
    implements $AdmissionTimelineCopyWith<$Res> {
  _$AdmissionTimelineCopyWithImpl(this._self, this._then);

  final AdmissionTimeline _self;
  final $Res Function(AdmissionTimeline) _then;

/// Create a copy of AdmissionTimeline
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? collegeId = freezed,Object? timelines = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,collegeId: freezed == collegeId ? _self.collegeId : collegeId // ignore: cast_nullable_to_non_nullable
as String?,timelines: freezed == timelines ? _self.timelines : timelines // ignore: cast_nullable_to_non_nullable
as List<TimeLine>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdmissionTimeline].
extension AdmissionTimelinePatterns on AdmissionTimeline {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdmissionTimeline value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdmissionTimeline() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdmissionTimeline value)  $default,){
final _that = this;
switch (_that) {
case _AdmissionTimeline():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdmissionTimeline value)?  $default,){
final _that = this;
switch (_that) {
case _AdmissionTimeline() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? collegeId,  List<TimeLine>? timelines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdmissionTimeline() when $default != null:
return $default(_that.id,_that.collegeId,_that.timelines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? collegeId,  List<TimeLine>? timelines)  $default,) {final _that = this;
switch (_that) {
case _AdmissionTimeline():
return $default(_that.id,_that.collegeId,_that.timelines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? collegeId,  List<TimeLine>? timelines)?  $default,) {final _that = this;
switch (_that) {
case _AdmissionTimeline() when $default != null:
return $default(_that.id,_that.collegeId,_that.timelines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdmissionTimeline implements AdmissionTimeline {
  const _AdmissionTimeline({this.id, this.collegeId, final  List<TimeLine>? timelines}): _timelines = timelines;
  factory _AdmissionTimeline.fromJson(Map<String, dynamic> json) => _$AdmissionTimelineFromJson(json);

@override final  String? id;
@override final  String? collegeId;
 final  List<TimeLine>? _timelines;
@override List<TimeLine>? get timelines {
  final value = _timelines;
  if (value == null) return null;
  if (_timelines is EqualUnmodifiableListView) return _timelines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AdmissionTimeline
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdmissionTimelineCopyWith<_AdmissionTimeline> get copyWith => __$AdmissionTimelineCopyWithImpl<_AdmissionTimeline>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdmissionTimelineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdmissionTimeline&&(identical(other.id, id) || other.id == id)&&(identical(other.collegeId, collegeId) || other.collegeId == collegeId)&&const DeepCollectionEquality().equals(other._timelines, _timelines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,collegeId,const DeepCollectionEquality().hash(_timelines));

@override
String toString() {
  return 'AdmissionTimeline(id: $id, collegeId: $collegeId, timelines: $timelines)';
}


}

/// @nodoc
abstract mixin class _$AdmissionTimelineCopyWith<$Res> implements $AdmissionTimelineCopyWith<$Res> {
  factory _$AdmissionTimelineCopyWith(_AdmissionTimeline value, $Res Function(_AdmissionTimeline) _then) = __$AdmissionTimelineCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? collegeId, List<TimeLine>? timelines
});




}
/// @nodoc
class __$AdmissionTimelineCopyWithImpl<$Res>
    implements _$AdmissionTimelineCopyWith<$Res> {
  __$AdmissionTimelineCopyWithImpl(this._self, this._then);

  final _AdmissionTimeline _self;
  final $Res Function(_AdmissionTimeline) _then;

/// Create a copy of AdmissionTimeline
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? collegeId = freezed,Object? timelines = freezed,}) {
  return _then(_AdmissionTimeline(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,collegeId: freezed == collegeId ? _self.collegeId : collegeId // ignore: cast_nullable_to_non_nullable
as String?,timelines: freezed == timelines ? _self._timelines : timelines // ignore: cast_nullable_to_non_nullable
as List<TimeLine>?,
  ));
}


}

// dart format on
