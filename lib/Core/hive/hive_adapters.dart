import 'package:hive_ce/hive.dart';
import '../models/cache_models.dart';
import '../models/user_model.dart';
import '../models/matches_model.dart';

@GenerateAdapters([
  AdapterSpec<UserModel>(),
  AdapterSpec<MatchModel>(),
  AdapterSpec<UserCacheModel>(),
  AdapterSpec<MatchCacheModel>(),
  AdapterSpec<Fixture>(),
  AdapterSpec<League>(),
  AdapterSpec<Teams>(),
  AdapterSpec<Goals>(),
  AdapterSpec<Score>(),
  AdapterSpec<Fulltime>(),
  AdapterSpec<Periods>(),
  AdapterSpec<Venue>(),
  AdapterSpec<Status>(),
  AdapterSpec<Home>(),
])
part 'hive_adapters.g.dart';
