// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'commit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Commit _$CommitFromJson(Map<String, dynamic> json) {
  return _Commit.fromJson(json);
}

/// @nodoc
mixin _$Commit {
  String get sha => throw _privateConstructorUsedError;
  CommitData get commit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommitCopyWith<Commit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitCopyWith<$Res> {
  factory $CommitCopyWith(Commit value, $Res Function(Commit) then) =
      _$CommitCopyWithImpl<$Res, Commit>;
  @useResult
  $Res call({String sha, CommitData commit});

  $CommitDataCopyWith<$Res> get commit;
}

/// @nodoc
class _$CommitCopyWithImpl<$Res, $Val extends Commit>
    implements $CommitCopyWith<$Res> {
  _$CommitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sha = null,
    Object? commit = null,
  }) {
    return _then(_value.copyWith(
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      commit: null == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as CommitData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommitDataCopyWith<$Res> get commit {
    return $CommitDataCopyWith<$Res>(_value.commit, (value) {
      return _then(_value.copyWith(commit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitImplCopyWith<$Res> implements $CommitCopyWith<$Res> {
  factory _$$CommitImplCopyWith(
          _$CommitImpl value, $Res Function(_$CommitImpl) then) =
      __$$CommitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sha, CommitData commit});

  @override
  $CommitDataCopyWith<$Res> get commit;
}

/// @nodoc
class __$$CommitImplCopyWithImpl<$Res>
    extends _$CommitCopyWithImpl<$Res, _$CommitImpl>
    implements _$$CommitImplCopyWith<$Res> {
  __$$CommitImplCopyWithImpl(
      _$CommitImpl _value, $Res Function(_$CommitImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sha = null,
    Object? commit = null,
  }) {
    return _then(_$CommitImpl(
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      commit: null == commit
          ? _value.commit
          : commit // ignore: cast_nullable_to_non_nullable
              as CommitData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommitImpl implements _Commit {
  _$CommitImpl({required this.sha, required this.commit});

  factory _$CommitImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitImplFromJson(json);

  @override
  final String sha;
  @override
  final CommitData commit;

  @override
  String toString() {
    return 'Commit(sha: $sha, commit: $commit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitImpl &&
            (identical(other.sha, sha) || other.sha == sha) &&
            (identical(other.commit, commit) || other.commit == commit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, sha, commit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitImplCopyWith<_$CommitImpl> get copyWith =>
      __$$CommitImplCopyWithImpl<_$CommitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitImplToJson(
      this,
    );
  }
}

abstract class _Commit implements Commit {
  factory _Commit(
      {required final String sha,
      required final CommitData commit}) = _$CommitImpl;

  factory _Commit.fromJson(Map<String, dynamic> json) = _$CommitImpl.fromJson;

  @override
  String get sha;
  @override
  CommitData get commit;
  @override
  @JsonKey(ignore: true)
  _$$CommitImplCopyWith<_$CommitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommitData _$CommitDataFromJson(Map<String, dynamic> json) {
  return _CommitData.fromJson(json);
}

/// @nodoc
mixin _$CommitData {
  Committer get committer => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommitDataCopyWith<CommitData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitDataCopyWith<$Res> {
  factory $CommitDataCopyWith(
          CommitData value, $Res Function(CommitData) then) =
      _$CommitDataCopyWithImpl<$Res, CommitData>;
  @useResult
  $Res call({Committer committer, String message});

  $CommitterCopyWith<$Res> get committer;
}

/// @nodoc
class _$CommitDataCopyWithImpl<$Res, $Val extends CommitData>
    implements $CommitDataCopyWith<$Res> {
  _$CommitDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committer = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      committer: null == committer
          ? _value.committer
          : committer // ignore: cast_nullable_to_non_nullable
              as Committer,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CommitterCopyWith<$Res> get committer {
    return $CommitterCopyWith<$Res>(_value.committer, (value) {
      return _then(_value.copyWith(committer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CommitDataImplCopyWith<$Res>
    implements $CommitDataCopyWith<$Res> {
  factory _$$CommitDataImplCopyWith(
          _$CommitDataImpl value, $Res Function(_$CommitDataImpl) then) =
      __$$CommitDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Committer committer, String message});

  @override
  $CommitterCopyWith<$Res> get committer;
}

/// @nodoc
class __$$CommitDataImplCopyWithImpl<$Res>
    extends _$CommitDataCopyWithImpl<$Res, _$CommitDataImpl>
    implements _$$CommitDataImplCopyWith<$Res> {
  __$$CommitDataImplCopyWithImpl(
      _$CommitDataImpl _value, $Res Function(_$CommitDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? committer = null,
    Object? message = null,
  }) {
    return _then(_$CommitDataImpl(
      committer: null == committer
          ? _value.committer
          : committer // ignore: cast_nullable_to_non_nullable
              as Committer,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommitDataImpl implements _CommitData {
  _$CommitDataImpl({required this.committer, required this.message});

  factory _$CommitDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitDataImplFromJson(json);

  @override
  final Committer committer;
  @override
  final String message;

  @override
  String toString() {
    return 'CommitData(committer: $committer, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitDataImpl &&
            (identical(other.committer, committer) ||
                other.committer == committer) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, committer, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitDataImplCopyWith<_$CommitDataImpl> get copyWith =>
      __$$CommitDataImplCopyWithImpl<_$CommitDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitDataImplToJson(
      this,
    );
  }
}

abstract class _CommitData implements CommitData {
  factory _CommitData(
      {required final Committer committer,
      required final String message}) = _$CommitDataImpl;

  factory _CommitData.fromJson(Map<String, dynamic> json) =
      _$CommitDataImpl.fromJson;

  @override
  Committer get committer;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$CommitDataImplCopyWith<_$CommitDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Committer _$CommitterFromJson(Map<String, dynamic> json) {
  return _Committer.fromJson(json);
}

/// @nodoc
mixin _$Committer {
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommitterCopyWith<Committer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommitterCopyWith<$Res> {
  factory $CommitterCopyWith(Committer value, $Res Function(Committer) then) =
      _$CommitterCopyWithImpl<$Res, Committer>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class _$CommitterCopyWithImpl<$Res, $Val extends Committer>
    implements $CommitterCopyWith<$Res> {
  _$CommitterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommitterImplCopyWith<$Res>
    implements $CommitterCopyWith<$Res> {
  factory _$$CommitterImplCopyWith(
          _$CommitterImpl value, $Res Function(_$CommitterImpl) then) =
      __$$CommitterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$CommitterImplCopyWithImpl<$Res>
    extends _$CommitterCopyWithImpl<$Res, _$CommitterImpl>
    implements _$$CommitterImplCopyWith<$Res> {
  __$$CommitterImplCopyWithImpl(
      _$CommitterImpl _value, $Res Function(_$CommitterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$CommitterImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommitterImpl extends _Committer {
  _$CommitterImpl({required this.date}) : super._();

  factory _$CommitterImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommitterImplFromJson(json);

  @override
  final String date;

  @override
  String toString() {
    return 'Committer(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommitterImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommitterImplCopyWith<_$CommitterImpl> get copyWith =>
      __$$CommitterImplCopyWithImpl<_$CommitterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommitterImplToJson(
      this,
    );
  }
}

abstract class _Committer extends Committer {
  factory _Committer({required final String date}) = _$CommitterImpl;
  _Committer._() : super._();

  factory _Committer.fromJson(Map<String, dynamic> json) =
      _$CommitterImpl.fromJson;

  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$CommitterImplCopyWith<_$CommitterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
