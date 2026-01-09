// lib/features/blogs/data/data_source/data_source.dart
import 'package:mycampusinfo_app/core/network/index.dart' show ResultFuture;
import 'package:mycampusinfo_app/features/blogs/data/entities/blog_model.dart';

abstract class BlogDataSource {
  ResultFuture<List<BlogModel>> getAllBlogs();

  ResultFuture<BlogModel?> getBlogById(String id);

  ResultFuture<BlogModel?> createBlog({
    required String title,
    required String highlight,
    required String description,
    required List<String> contributor,
  });
}
