// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      question: json['question'] as String,
      answers: (json['answers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      questionImageUrl: json['questionImageUrl'] as String?,
      correctAnswer: json['correctAnswer'] as String,
      score: json['score'] as int,
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
      'questionImageUrl': instance.questionImageUrl,
      'correctAnswer': instance.correctAnswer,
      'score': instance.score,
    };
