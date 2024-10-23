class GeminiModel {
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;

  GeminiModel({required this.candidates, required this.usageMetadata});

  factory GeminiModel.fromJson(Map<String, dynamic> m1) => GeminiModel(
        candidates: List<Candidates>.from(
            m1["candidates"].map((x) => Candidates.fromJson(x))),
        usageMetadata: UsageMetadata.fromJson(m1["usageMetadata"]),
      );

  Map<String, dynamic> toJson() => {
        "candidates": List<dynamic>.from(candidates!.map((x) => x.toJson())),
        "usageMetadata": usageMetadata!.toJson(),
      };
}

class Candidates {
  Content? content;
  String? finishReason;
  int? index;
  List<SafetyRatings>? safetyRatings;

  Candidates(
      {required this.content,
      required this.finishReason,
      required this.index,
      required this.safetyRatings});

  factory Candidates.fromJson(Map<String, dynamic> m1) => Candidates(
        content: Content.fromJson(m1["content"]),
        finishReason: m1["finishReason"],
        index: m1["index"],
        safetyRatings: List<SafetyRatings>.from(
          m1["safetyRatings"].map(
            (x) => SafetyRatings.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "content": content!.toJson(),
        "finishReason": finishReason,
        "index": index,
        "safetyRatings":
            List<dynamic>.from(safetyRatings!.map((x) => x.toJson())),
      };
}

class Content {
  List<Parts>? parts;
  String? role;

  Content({required this.parts, required this.role});

  factory Content.fromJson(Map<String, dynamic> m1) => Content(
        parts: List<Parts>.from(m1["parts"].map((x) => Parts.fromJson(x))),
        role: m1["role"],
      );

  Map<String, dynamic> toJson() =>{
    "parts": List<dynamic>.from(parts!.map((x) => x.toJson())),
    "role": role,
  };
}

class Parts {
  String? text;

  Parts({required this.text});

  factory Parts.fromJson(Map<String, dynamic> m1) => Parts(text: m1["text"]);

  Map<String, dynamic> toJson() => {
    "text": text,

  };
}

class SafetyRatings {
  String? category;
  String? probability;

  SafetyRatings({required this.category, required this.probability});

  factory SafetyRatings.fromJson(Map<String, dynamic> m1) =>
      SafetyRatings(category: m1["category"], probability: m1["probability"]);

  Map<String, dynamic> toJson()=> {
    "category": category,
    "probability": probability,

  };
}

class UsageMetadata {
  int? promptTokenCount;
  int? candidatesTokenCount;
  int? totalTokenCount;

  UsageMetadata(
      {required this.promptTokenCount,
      required this.candidatesTokenCount,
      required this.totalTokenCount});

  factory UsageMetadata.fromJson(Map<String, dynamic> m1) => UsageMetadata(
      promptTokenCount: m1["promptTokenCount"],
      candidatesTokenCount: m1["candidatesTokenCount"],
      totalTokenCount: m1["totalTokenCount"]);

  Map<String, dynamic> toJson() =>{
    "promptTokenCount": promptTokenCount,
    "candidatesTokenCount": candidatesTokenCount,
    "totalTokenCount": totalTokenCount,

  };
}
