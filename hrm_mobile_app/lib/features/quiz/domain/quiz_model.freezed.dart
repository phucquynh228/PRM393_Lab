// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quiz_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuestionModel {

 String get questionText; List<String> get options; int get correctAnswerIndex;
/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuestionModelCopyWith<QuestionModel> get copyWith => _$QuestionModelCopyWithImpl<QuestionModel>(this as QuestionModel, _$identity);

  /// Serializes this QuestionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuestionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuestionModel&&(identical(other.questionText, _this.questionText) || other.questionText == _this.questionText)&&const DeepCollectionEquality().equals(other.options, _this.options)&&(identical(other.correctAnswerIndex, _this.correctAnswerIndex) || other.correctAnswerIndex == _this.correctAnswerIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuestionModel;
  return Object.hash(runtimeType,_this.questionText,const DeepCollectionEquality().hash(_this.options),_this.correctAnswerIndex);
}

@override
String toString() {
  final _this = this as QuestionModel;
  return 'QuestionModel(questionText: ${_this.questionText}, options: ${_this.options}, correctAnswerIndex: ${_this.correctAnswerIndex})';
}


}

/// @nodoc
abstract mixin class $QuestionModelCopyWith<$Res>  {
  factory $QuestionModelCopyWith(QuestionModel value, $Res Function(QuestionModel) _then) = _$QuestionModelCopyWithImpl;
@useResult
$Res call({
 String questionText, List<String> options, int correctAnswerIndex
});




}
/// @nodoc
class _$QuestionModelCopyWithImpl<$Res>
    implements $QuestionModelCopyWith<$Res> {
  _$QuestionModelCopyWithImpl(this._self, this._then);

  final QuestionModel _self;
  final $Res Function(QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionText = null,Object? options = null,Object? correctAnswerIndex = null,}) {
  return _then(QuestionModel(
questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuestionModel].
extension QuestionModelPatterns on QuestionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuestionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuestionModel value)  $default,){
final _that = this;
switch (_that) {
case _QuestionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuestionModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String questionText,  List<String> options,  int correctAnswerIndex)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.questionText,_that.options,_that.correctAnswerIndex);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String questionText,  List<String> options,  int correctAnswerIndex)  $default,) {final _that = this;
switch (_that) {
case _QuestionModel():
return $default(_that.questionText,_that.options,_that.correctAnswerIndex);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String questionText,  List<String> options,  int correctAnswerIndex)?  $default,) {final _that = this;
switch (_that) {
case _QuestionModel() when $default != null:
return $default(_that.questionText,_that.options,_that.correctAnswerIndex);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuestionModel implements QuestionModel {
  const _QuestionModel({required this.questionText, required  List<String> options, required this.correctAnswerIndex}): _options = options;
  factory _QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);

@override final  String questionText;
 final  List<String> _options;
@override List<String> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  int correctAnswerIndex;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuestionModelCopyWith<_QuestionModel> get copyWith => __$QuestionModelCopyWithImpl<_QuestionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuestionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuestionModel&&(identical(other.questionText, questionText) || other.questionText == questionText)&&const DeepCollectionEquality().equals(other.options, _options)&&(identical(other.correctAnswerIndex, correctAnswerIndex) || other.correctAnswerIndex == correctAnswerIndex));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,questionText,const DeepCollectionEquality().hash(_options),correctAnswerIndex);
}

@override
String toString() {
    return 'QuestionModel(questionText: $questionText, options: $options, correctAnswerIndex: $correctAnswerIndex)';
}


}

/// @nodoc
abstract mixin class _$QuestionModelCopyWith<$Res> implements $QuestionModelCopyWith<$Res> {
  factory _$QuestionModelCopyWith(_QuestionModel value, $Res Function(_QuestionModel) _then) = __$QuestionModelCopyWithImpl;
@override @useResult
$Res call({
 String questionText, List<String> options, int correctAnswerIndex
});




}
/// @nodoc
class __$QuestionModelCopyWithImpl<$Res>
    implements _$QuestionModelCopyWith<$Res> {
  __$QuestionModelCopyWithImpl(this._self, this._then);

  final _QuestionModel _self;
  final $Res Function(_QuestionModel) _then;

/// Create a copy of QuestionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionText = null,Object? options = null,Object? correctAnswerIndex = null,}) {
  return _then(_QuestionModel(
questionText: null == questionText ? _self.questionText : questionText // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<String>,correctAnswerIndex: null == correctAnswerIndex ? _self.correctAnswerIndex : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$QuizModel {

 String get id; String get title; int get durationMinutes; List<QuestionModel> get questions;
/// Create a copy of QuizModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizModelCopyWith<QuizModel> get copyWith => _$QuizModelCopyWithImpl<QuizModel>(this as QuizModel, _$identity);

  /// Serializes this QuizModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.durationMinutes, _this.durationMinutes) || other.durationMinutes == _this.durationMinutes)&&const DeepCollectionEquality().equals(other.questions, _this.questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.durationMinutes,const DeepCollectionEquality().hash(_this.questions));
}

@override
String toString() {
  final _this = this as QuizModel;
  return 'QuizModel(id: ${_this.id}, title: ${_this.title}, durationMinutes: ${_this.durationMinutes}, questions: ${_this.questions})';
}


}

/// @nodoc
abstract mixin class $QuizModelCopyWith<$Res>  {
  factory $QuizModelCopyWith(QuizModel value, $Res Function(QuizModel) _then) = _$QuizModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, int durationMinutes, List<QuestionModel> questions
});




}
/// @nodoc
class _$QuizModelCopyWithImpl<$Res>
    implements $QuizModelCopyWith<$Res> {
  _$QuizModelCopyWithImpl(this._self, this._then);

  final QuizModel _self;
  final $Res Function(QuizModel) _then;

/// Create a copy of QuizModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? durationMinutes = null,Object? questions = null,}) {
  return _then(QuizModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizModel].
extension QuizModelPatterns on QuizModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int durationMinutes,  List<QuestionModel> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizModel() when $default != null:
return $default(_that.id,_that.title,_that.durationMinutes,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int durationMinutes,  List<QuestionModel> questions)  $default,) {final _that = this;
switch (_that) {
case _QuizModel():
return $default(_that.id,_that.title,_that.durationMinutes,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int durationMinutes,  List<QuestionModel> questions)?  $default,) {final _that = this;
switch (_that) {
case _QuizModel() when $default != null:
return $default(_that.id,_that.title,_that.durationMinutes,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizModel implements QuizModel {
  const _QuizModel({required this.id, required this.title, required this.durationMinutes, required  List<QuestionModel> questions}): _questions = questions;
  factory _QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  int durationMinutes;
 final  List<QuestionModel> _questions;
@override List<QuestionModel> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of QuizModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizModelCopyWith<_QuizModel> get copyWith => __$QuizModelCopyWithImpl<_QuizModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&const DeepCollectionEquality().equals(other.questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,durationMinutes,const DeepCollectionEquality().hash(_questions));
}

@override
String toString() {
    return 'QuizModel(id: $id, title: $title, durationMinutes: $durationMinutes, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$QuizModelCopyWith<$Res> implements $QuizModelCopyWith<$Res> {
  factory _$QuizModelCopyWith(_QuizModel value, $Res Function(_QuizModel) _then) = __$QuizModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int durationMinutes, List<QuestionModel> questions
});




}
/// @nodoc
class __$QuizModelCopyWithImpl<$Res>
    implements _$QuizModelCopyWith<$Res> {
  __$QuizModelCopyWithImpl(this._self, this._then);

  final _QuizModel _self;
  final $Res Function(_QuizModel) _then;

/// Create a copy of QuizModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? durationMinutes = null,Object? questions = null,}) {
  return _then(_QuizModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<QuestionModel>,
  ));
}


}


/// @nodoc
mixin _$QuizResultModel {

 String get id; String get userId; String get quizId; int get score; DateTime get takenAt;
/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuizResultModelCopyWith<QuizResultModel> get copyWith => _$QuizResultModelCopyWithImpl<QuizResultModel>(this as QuizResultModel, _$identity);

  /// Serializes this QuizResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as QuizResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuizResultModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.quizId, _this.quizId) || other.quizId == _this.quizId)&&(identical(other.score, _this.score) || other.score == _this.score)&&(identical(other.takenAt, _this.takenAt) || other.takenAt == _this.takenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as QuizResultModel;
  return Object.hash(runtimeType,_this.id,_this.userId,_this.quizId,_this.score,_this.takenAt);
}

@override
String toString() {
  final _this = this as QuizResultModel;
  return 'QuizResultModel(id: ${_this.id}, userId: ${_this.userId}, quizId: ${_this.quizId}, score: ${_this.score}, takenAt: ${_this.takenAt})';
}


}

/// @nodoc
abstract mixin class $QuizResultModelCopyWith<$Res>  {
  factory $QuizResultModelCopyWith(QuizResultModel value, $Res Function(QuizResultModel) _then) = _$QuizResultModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String quizId, int score, DateTime takenAt
});




}
/// @nodoc
class _$QuizResultModelCopyWithImpl<$Res>
    implements $QuizResultModelCopyWith<$Res> {
  _$QuizResultModelCopyWithImpl(this._self, this._then);

  final QuizResultModel _self;
  final $Res Function(QuizResultModel) _then;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? quizId = null,Object? score = null,Object? takenAt = null,}) {
  return _then(QuizResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [QuizResultModel].
extension QuizResultModelPatterns on QuizResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuizResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuizResultModel value)  $default,){
final _that = this;
switch (_that) {
case _QuizResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuizResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String quizId,  int score,  DateTime takenAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
return $default(_that.id,_that.userId,_that.quizId,_that.score,_that.takenAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String quizId,  int score,  DateTime takenAt)  $default,) {final _that = this;
switch (_that) {
case _QuizResultModel():
return $default(_that.id,_that.userId,_that.quizId,_that.score,_that.takenAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String quizId,  int score,  DateTime takenAt)?  $default,) {final _that = this;
switch (_that) {
case _QuizResultModel() when $default != null:
return $default(_that.id,_that.userId,_that.quizId,_that.score,_that.takenAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuizResultModel implements QuizResultModel {
  const _QuizResultModel({required this.id, required this.userId, required this.quizId, required this.score, required this.takenAt});
  factory _QuizResultModel.fromJson(Map<String, dynamic> json) => _$QuizResultModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String quizId;
@override final  int score;
@override final  DateTime takenAt;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuizResultModelCopyWith<_QuizResultModel> get copyWith => __$QuizResultModelCopyWithImpl<_QuizResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuizResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuizResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.quizId, quizId) || other.quizId == quizId)&&(identical(other.score, score) || other.score == score)&&(identical(other.takenAt, takenAt) || other.takenAt == takenAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,userId,quizId,score,takenAt);
}

@override
String toString() {
    return 'QuizResultModel(id: $id, userId: $userId, quizId: $quizId, score: $score, takenAt: $takenAt)';
}


}

/// @nodoc
abstract mixin class _$QuizResultModelCopyWith<$Res> implements $QuizResultModelCopyWith<$Res> {
  factory _$QuizResultModelCopyWith(_QuizResultModel value, $Res Function(_QuizResultModel) _then) = __$QuizResultModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String quizId, int score, DateTime takenAt
});




}
/// @nodoc
class __$QuizResultModelCopyWithImpl<$Res>
    implements _$QuizResultModelCopyWith<$Res> {
  __$QuizResultModelCopyWithImpl(this._self, this._then);

  final _QuizResultModel _self;
  final $Res Function(_QuizResultModel) _then;

/// Create a copy of QuizResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? quizId = null,Object? score = null,Object? takenAt = null,}) {
  return _then(_QuizResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,quizId: null == quizId ? _self.quizId : quizId // ignore: cast_nullable_to_non_nullable
as String,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,takenAt: null == takenAt ? _self.takenAt : takenAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
