// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameStatus {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStatus);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus()';
}


}

/// @nodoc
class $GameStatusCopyWith<$Res>  {
$GameStatusCopyWith(GameStatus _, $Res Function(GameStatus) __);
}


/// Adds pattern-matching-related methods to [GameStatus].
extension GameStatusPatterns on GameStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Ongoing value)?  ongoing,TResult Function( _Draw value)?  draw,TResult Function( _Winner value)?  winner,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ongoing() when ongoing != null:
return ongoing(_that);case _Draw() when draw != null:
return draw(_that);case _Winner() when winner != null:
return winner(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Ongoing value)  ongoing,required TResult Function( _Draw value)  draw,required TResult Function( _Winner value)  winner,}){
final _that = this;
switch (_that) {
case _Ongoing():
return ongoing(_that);case _Draw():
return draw(_that);case _Winner():
return winner(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Ongoing value)?  ongoing,TResult? Function( _Draw value)?  draw,TResult? Function( _Winner value)?  winner,}){
final _that = this;
switch (_that) {
case _Ongoing() when ongoing != null:
return ongoing(_that);case _Draw() when draw != null:
return draw(_that);case _Winner() when winner != null:
return winner(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  ongoing,TResult Function()?  draw,TResult Function( Player winner,  List<int> winningLine)?  winner,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ongoing() when ongoing != null:
return ongoing();case _Draw() when draw != null:
return draw();case _Winner() when winner != null:
return winner(_that.winner,_that.winningLine);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  ongoing,required TResult Function()  draw,required TResult Function( Player winner,  List<int> winningLine)  winner,}) {final _that = this;
switch (_that) {
case _Ongoing():
return ongoing();case _Draw():
return draw();case _Winner():
return winner(_that.winner,_that.winningLine);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  ongoing,TResult? Function()?  draw,TResult? Function( Player winner,  List<int> winningLine)?  winner,}) {final _that = this;
switch (_that) {
case _Ongoing() when ongoing != null:
return ongoing();case _Draw() when draw != null:
return draw();case _Winner() when winner != null:
return winner(_that.winner,_that.winningLine);case _:
  return null;

}
}

}

/// @nodoc


class _Ongoing implements GameStatus {
  const _Ongoing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ongoing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.ongoing()';
}


}




/// @nodoc


class _Draw implements GameStatus {
  const _Draw();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Draw);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameStatus.draw()';
}


}




/// @nodoc


class _Winner implements GameStatus {
  const _Winner({required this.winner, required final  List<int> winningLine}): _winningLine = winningLine;
  

 final  Player winner;
 final  List<int> _winningLine;
 List<int> get winningLine {
  if (_winningLine is EqualUnmodifiableListView) return _winningLine;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_winningLine);
}


/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WinnerCopyWith<_Winner> get copyWith => __$WinnerCopyWithImpl<_Winner>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Winner&&(identical(other.winner, winner) || other.winner == winner)&&const DeepCollectionEquality().equals(other._winningLine, _winningLine));
}


@override
int get hashCode => Object.hash(runtimeType,winner,const DeepCollectionEquality().hash(_winningLine));

@override
String toString() {
  return 'GameStatus.winner(winner: $winner, winningLine: $winningLine)';
}


}

/// @nodoc
abstract mixin class _$WinnerCopyWith<$Res> implements $GameStatusCopyWith<$Res> {
  factory _$WinnerCopyWith(_Winner value, $Res Function(_Winner) _then) = __$WinnerCopyWithImpl;
@useResult
$Res call({
 Player winner, List<int> winningLine
});




}
/// @nodoc
class __$WinnerCopyWithImpl<$Res>
    implements _$WinnerCopyWith<$Res> {
  __$WinnerCopyWithImpl(this._self, this._then);

  final _Winner _self;
  final $Res Function(_Winner) _then;

/// Create a copy of GameStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? winner = null,Object? winningLine = null,}) {
  return _then(_Winner(
winner: null == winner ? _self.winner : winner // ignore: cast_nullable_to_non_nullable
as Player,winningLine: null == winningLine ? _self._winningLine : winningLine // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}

// dart format on
