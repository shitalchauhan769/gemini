
import 'dart:convert';

GeminiModel geminiModelFromJson(String str) => GeminiModel.fromJson(json.decode(str));

String geminiModelToJson(GeminiModel data) => json.encode(data.toJson());
class GeminiModel {
  List<Candidates>? candidates;
  UsageMetadata? usageMetadata;

  GeminiModel({required this.candidates,required this.usageMetadata});

  factory GeminiModel.fromJson(Map<String, dynamic> json) => GeminiModel(
    candidates: List<Candidates>.from(json["candidates"].map((x) => Candidates.fromJson(x))),
    usageMetadata: UsageMetadata.fromJson(json["usageMetadata"]),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.candidates != null) {
      data['candidates'] = this.candidates!.map((v) => v.toJson()).toList();
    }
    if (this.usageMetadata != null) {
      data['usageMetadata'] = this.usageMetadata!.toJson();
    }
    return data;
  }
}

class Candidates {
  Content? content;
  String? finishReason;
  int? index;
  List<SafetyRatings>? safetyRatings;

  Candidates({ required this.content,required this.finishReason,required this.index,required this.safetyRatings});

  factory Candidates.fromJson(Map<String, dynamic> m1) => Candidates(
    content: Content.fromJson(m1["content"]),
    finishReason: m1["finishReason"],
    index: m1["index"],
    safetyRatings: List<SafetyRatings>.from(m1["safetyRatings"].map((x) => SafetyRatings.fromJson(x))),
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.toJson();
    }
    data['finishReason'] = this.finishReason;
    data['index'] = this.index;
    if (this.safetyRatings != null) {
      data['safetyRatings'] =
          this.safetyRatings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  List<Parts>? parts;
  String? role;

  Content({required this.parts,required this.role});

  factory Content.fromJson(Map<String, dynamic> m1) => Content(
    parts: List<Parts>.from(m1["parts"].map((x) => Parts.fromJson(x))),
    role: m1["role"],
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parts != null) {
      data['parts'] = this.parts!.map((v) => v.toJson()).toList();
    }
    data['role'] = this.role;
    return data;
  }
}

class Parts {
  String? text;

  Parts({required this.text});

 factory Parts.fromJson(Map<String, dynamic> m1) =>Parts(text: m1["text"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class SafetyRatings {
  String? category;
  String? probability;

  SafetyRatings({required this.category, required this.probability});

 factory SafetyRatings.fromJson(Map<String, dynamic> m1) =>SafetyRatings(category:m1["category"] ,probability:m1["probability"] );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['probability'] = this.probability;
    return data;
  }
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promptTokenCount'] = this.promptTokenCount;
    data['candidatesTokenCount'] = this.candidatesTokenCount;
    data['totalTokenCount'] = this.totalTokenCount;
    return data;
  }
}
