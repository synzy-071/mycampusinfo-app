// features/chatbot/data/data_source/data_source.dart
import 'package:dartz/dartz.dart';
import 'package:mycampusinfo_app/core/index.dart';
import 'package:mycampusinfo_app/features/chatbot/data/entities/chatbot_question_model.dart';
import 'package:mycampusinfo_app/features/chatbot/data/entities/filter_id_model.dart';

abstract class ChatbotDataSource {
  ResultFuture<List<ChatbotQuestion>> getQuestions();
  ResultFuture<List<ChatbotQuestion>> getQuestionsByCategory(String category);
  ResultFuture<FilterIdsResult> filterByQuestion({required int questionId,required bool useAI,bool? useArea, bool? useCity});
  ResultFuture<FilterIdsResult> filterWithMultipleCriteria(Map<String, dynamic> filters,bool useAI);
}