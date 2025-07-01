// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'randomizer_state_notifier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RandomizerState implements DiagnosticableTreeMixin {

 int get min; int get max; int? get generatedNumber;
/// Create a copy of RandomizerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomizerStateCopyWith<RandomizerState> get copyWith => _$RandomizerStateCopyWithImpl<RandomizerState>(this as RandomizerState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RandomizerState'))
    ..add(DiagnosticsProperty('min', min))..add(DiagnosticsProperty('max', max))..add(DiagnosticsProperty('generatedNumber', generatedNumber));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomizerState&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.generatedNumber, generatedNumber) || other.generatedNumber == generatedNumber));
}


@override
int get hashCode => Object.hash(runtimeType,min,max,generatedNumber);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RandomizerState(min: $min, max: $max, generatedNumber: $generatedNumber)';
}


}

/// @nodoc
abstract mixin class $RandomizerStateCopyWith<$Res>  {
  factory $RandomizerStateCopyWith(RandomizerState value, $Res Function(RandomizerState) _then) = _$RandomizerStateCopyWithImpl;
@useResult
$Res call({
 int min, int max, int? generatedNumber
});




}
/// @nodoc
class _$RandomizerStateCopyWithImpl<$Res>
    implements $RandomizerStateCopyWith<$Res> {
  _$RandomizerStateCopyWithImpl(this._self, this._then);

  final RandomizerState _self;
  final $Res Function(RandomizerState) _then;

/// Create a copy of RandomizerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? min = null,Object? max = null,Object? generatedNumber = freezed,}) {
  return _then(_self.copyWith(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,generatedNumber: freezed == generatedNumber ? _self.generatedNumber : generatedNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc


class _RandomizerState extends RandomizerState with DiagnosticableTreeMixin {
  const _RandomizerState({this.min = 0, this.max = 0, this.generatedNumber}): super._();
  

@override@JsonKey() final  int min;
@override@JsonKey() final  int max;
@override final  int? generatedNumber;

/// Create a copy of RandomizerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomizerStateCopyWith<_RandomizerState> get copyWith => __$RandomizerStateCopyWithImpl<_RandomizerState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RandomizerState'))
    ..add(DiagnosticsProperty('min', min))..add(DiagnosticsProperty('max', max))..add(DiagnosticsProperty('generatedNumber', generatedNumber));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomizerState&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max)&&(identical(other.generatedNumber, generatedNumber) || other.generatedNumber == generatedNumber));
}


@override
int get hashCode => Object.hash(runtimeType,min,max,generatedNumber);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RandomizerState(min: $min, max: $max, generatedNumber: $generatedNumber)';
}


}

/// @nodoc
abstract mixin class _$RandomizerStateCopyWith<$Res> implements $RandomizerStateCopyWith<$Res> {
  factory _$RandomizerStateCopyWith(_RandomizerState value, $Res Function(_RandomizerState) _then) = __$RandomizerStateCopyWithImpl;
@override @useResult
$Res call({
 int min, int max, int? generatedNumber
});




}
/// @nodoc
class __$RandomizerStateCopyWithImpl<$Res>
    implements _$RandomizerStateCopyWith<$Res> {
  __$RandomizerStateCopyWithImpl(this._self, this._then);

  final _RandomizerState _self;
  final $Res Function(_RandomizerState) _then;

/// Create a copy of RandomizerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? min = null,Object? max = null,Object? generatedNumber = freezed,}) {
  return _then(_RandomizerState(
min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: null == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int,generatedNumber: freezed == generatedNumber ? _self.generatedNumber : generatedNumber // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
