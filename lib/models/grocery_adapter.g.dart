// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grocery_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroceryListAdapter extends TypeAdapter<GroceryList> {
  @override
  final int typeId = 2;

  @override
  GroceryList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroceryList(
      name: fields[0] as String,
      ingredients: (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroceryList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroceryListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
