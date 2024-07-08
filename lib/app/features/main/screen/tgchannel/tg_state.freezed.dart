// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tg_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TgState {
  List<WhatIsItModel> get items => throw _privateConstructorUsedError;
  WhatIsItModel? get selectedItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TgStateCopyWith<TgState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TgStateCopyWith<$Res> {
  factory $TgStateCopyWith(TgState value, $Res Function(TgState) then) =
      _$TgStateCopyWithImpl<$Res, TgState>;
  @useResult
  $Res call({List<WhatIsItModel> items, WhatIsItModel? selectedItem});

  $WhatIsItModelCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class _$TgStateCopyWithImpl<$Res, $Val extends TgState>
    implements $TgStateCopyWith<$Res> {
  _$TgStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItem = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WhatIsItModel>,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as WhatIsItModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WhatIsItModelCopyWith<$Res>? get selectedItem {
    if (_value.selectedItem == null) {
      return null;
    }

    return $WhatIsItModelCopyWith<$Res>(_value.selectedItem!, (value) {
      return _then(_value.copyWith(selectedItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TgStateImplCopyWith<$Res> implements $TgStateCopyWith<$Res> {
  factory _$$TgStateImplCopyWith(
          _$TgStateImpl value, $Res Function(_$TgStateImpl) then) =
      __$$TgStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<WhatIsItModel> items, WhatIsItModel? selectedItem});

  @override
  $WhatIsItModelCopyWith<$Res>? get selectedItem;
}

/// @nodoc
class __$$TgStateImplCopyWithImpl<$Res>
    extends _$TgStateCopyWithImpl<$Res, _$TgStateImpl>
    implements _$$TgStateImplCopyWith<$Res> {
  __$$TgStateImplCopyWithImpl(
      _$TgStateImpl _value, $Res Function(_$TgStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? selectedItem = freezed,
  }) {
    return _then(_$TgStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WhatIsItModel>,
      selectedItem: freezed == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as WhatIsItModel?,
    ));
  }
}

/// @nodoc

class _$TgStateImpl extends _TgState {
  _$TgStateImpl(
      {required final List<WhatIsItModel> items, required this.selectedItem})
      : _items = items,
        super._();

  final List<WhatIsItModel> _items;
  @override
  List<WhatIsItModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final WhatIsItModel? selectedItem;

  @override
  String toString() {
    return 'TgState(items: $items, selectedItem: $selectedItem)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TgStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), selectedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TgStateImplCopyWith<_$TgStateImpl> get copyWith =>
      __$$TgStateImplCopyWithImpl<_$TgStateImpl>(this, _$identity);
}

abstract class _TgState extends TgState {
  factory _TgState(
      {required final List<WhatIsItModel> items,
      required final WhatIsItModel? selectedItem}) = _$TgStateImpl;
  _TgState._() : super._();

  @override
  List<WhatIsItModel> get items;
  @override
  WhatIsItModel? get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$TgStateImplCopyWith<_$TgStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
