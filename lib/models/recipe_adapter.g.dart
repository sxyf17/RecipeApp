// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeAdapter extends TypeAdapter<Recipe> {
  @override
  final int typeId = 1;

  @override
  Recipe read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Recipe(
      name: fields[0] as String,
      images: fields[1] as String,
      rating: fields[2] as double,
      totalTime: fields[3] as String,
      steps: (fields[4] as List).cast<String>(),
      ingredients: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Recipe obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.images)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.totalTime)
      ..writeByte(4)
      ..write(obj.steps)
      ..writeByte(5)
      ..write(obj.ingredients);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
