// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      displayName: fields[0] as String?,
      email: fields[1] as String?,
      photoURL: fields[2] as String?,
      totalPoints: (fields[3] as num?)?.toInt(),
      uid: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.photoURL)
      ..writeByte(3)
      ..write(obj.totalPoints)
      ..writeByte(4)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatchModelAdapter extends TypeAdapter<MatchModel> {
  @override
  final typeId = 5;

  @override
  MatchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchModel(
      fixture: fields[0] as Fixture?,
      league: fields[1] as League?,
      teams: fields[2] as Teams?,
      goals: fields[3] as Goals?,
      score: fields[4] as Score?,
    );
  }

  @override
  void write(BinaryWriter writer, MatchModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fixture)
      ..writeByte(1)
      ..write(obj.league)
      ..writeByte(2)
      ..write(obj.teams)
      ..writeByte(3)
      ..write(obj.goals)
      ..writeByte(4)
      ..write(obj.score);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FixtureAdapter extends TypeAdapter<Fixture> {
  @override
  final typeId = 6;

  @override
  Fixture read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fixture(
      id: (fields[0] as num?)?.toInt(),
      referee: fields[1] as String?,
      timezone: fields[2] as String?,
      date: fields[3] as String?,
      timestamp: (fields[4] as num?)?.toInt(),
      periods: fields[5] as Periods?,
      venue: fields[6] as Venue?,
      status: fields[7] as Status?,
    );
  }

  @override
  void write(BinaryWriter writer, Fixture obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.referee)
      ..writeByte(2)
      ..write(obj.timezone)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.timestamp)
      ..writeByte(5)
      ..write(obj.periods)
      ..writeByte(6)
      ..write(obj.venue)
      ..writeByte(7)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FixtureAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LeagueAdapter extends TypeAdapter<League> {
  @override
  final typeId = 7;

  @override
  League read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return League(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      country: fields[2] as String?,
      logo: fields[3] as String?,
      flag: fields[4] as String?,
      season: (fields[5] as num?)?.toInt(),
      round: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, League obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.country)
      ..writeByte(3)
      ..write(obj.logo)
      ..writeByte(4)
      ..write(obj.flag)
      ..writeByte(5)
      ..write(obj.season)
      ..writeByte(6)
      ..write(obj.round);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeagueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TeamsAdapter extends TypeAdapter<Teams> {
  @override
  final typeId = 8;

  @override
  Teams read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Teams(home: fields[0] as Home?, away: fields[1] as Home?);
  }

  @override
  void write(BinaryWriter writer, Teams obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.home)
      ..writeByte(1)
      ..write(obj.away);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GoalsAdapter extends TypeAdapter<Goals> {
  @override
  final typeId = 9;

  @override
  Goals read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Goals(
      home: (fields[0] as num?)?.toInt(),
      away: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Goals obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.home)
      ..writeByte(1)
      ..write(obj.away);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoalsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ScoreAdapter extends TypeAdapter<Score> {
  @override
  final typeId = 10;

  @override
  Score read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Score(
      halftime: fields[0] as Goals?,
      fulltime: fields[1] as Fulltime?,
      extratime: fields[2] as Fulltime?,
      penalty: fields[3] as Fulltime?,
    );
  }

  @override
  void write(BinaryWriter writer, Score obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.halftime)
      ..writeByte(1)
      ..write(obj.fulltime)
      ..writeByte(2)
      ..write(obj.extratime)
      ..writeByte(3)
      ..write(obj.penalty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ScoreAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FulltimeAdapter extends TypeAdapter<Fulltime> {
  @override
  final typeId = 11;

  @override
  Fulltime read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fulltime(
      home: (fields[0] as num?)?.toInt(),
      away: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Fulltime obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.home)
      ..writeByte(1)
      ..write(obj.away);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FulltimeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PeriodsAdapter extends TypeAdapter<Periods> {
  @override
  final typeId = 12;

  @override
  Periods read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Periods(
      first: (fields[0] as num?)?.toInt(),
      second: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Periods obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.first)
      ..writeByte(1)
      ..write(obj.second);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PeriodsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class VenueAdapter extends TypeAdapter<Venue> {
  @override
  final typeId = 13;

  @override
  Venue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Venue(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      city: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Venue obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.city);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VenueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class StatusAdapter extends TypeAdapter<Status> {
  @override
  final typeId = 14;

  @override
  Status read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Status(
      long: fields[0] as String?,
      short: fields[1] as String?,
      elapsed: (fields[2] as num?)?.toInt(),
      extra: (fields[3] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, Status obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.long)
      ..writeByte(1)
      ..write(obj.short)
      ..writeByte(2)
      ..write(obj.elapsed)
      ..writeByte(3)
      ..write(obj.extra);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HomeAdapter extends TypeAdapter<Home> {
  @override
  final typeId = 15;

  @override
  Home read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Home(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      logo: fields[2] as String?,
      winner: fields[3] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Home obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.logo)
      ..writeByte(3)
      ..write(obj.winner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserCacheModelAdapter extends TypeAdapter<UserCacheModel> {
  @override
  final typeId = 18;

  @override
  UserCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheModel(
      data: (fields[0] as List).cast<UserModel>(),
      timestamp: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class MatchCacheModelAdapter extends TypeAdapter<MatchCacheModel> {
  @override
  final typeId = 19;

  @override
  MatchCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchCacheModel(
      data: (fields[0] as List).cast<MatchModel>(),
      timestamp: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MatchCacheModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
