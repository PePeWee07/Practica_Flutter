import 'package:random_user_bloc/user/infrastrucutre/models/radom_user.dart';

class RandomData {
  final List<RandomUser> results;
  final Info info;

  RandomData({required this.results, required this.info});

  factory RandomData.fromJson(Map<String, dynamic> json) => RandomData(
    results: List<RandomUser>.from(json["results"].map((x) => RandomUser.fromJson(x))),
    info: Info.fromJson(json["info"]),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "info": info.toJson(),
  };
}

class Info {
  final String seed;
  final int results;
  final int page;
  final String version;

  Info({
    required this.seed,
    required this.results,
    required this.page,
    required this.version,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
    seed: json["seed"],
    results: json["results"],
    page: json["page"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "seed": seed,
    "results": results,
    "page": page,
    "version": version,
  };
}

