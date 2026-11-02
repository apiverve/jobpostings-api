import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

/// Validation rule for a parameter.
class ValidationRule {
  final String type;
  final bool required;
  final num? min;
  final num? max;
  final int? minLength;
  final int? maxLength;
  final String? format;
  final List<String>? enumValues;

  const ValidationRule({
    required this.type,
    required this.required,
    this.min,
    this.max,
    this.minLength,
    this.maxLength,
    this.format,
    this.enumValues,
  });
}

/// Exception thrown when parameter validation fails.
class JobpostingsValidationException implements Exception {
  final List<String> errors;

  JobpostingsValidationException(this.errors);

  @override
  String toString() => 'JobpostingsValidationException: ${errors.join("; ")}';
}

/// Format validation patterns.
final _formatPatterns = {
  'email': RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$'),
  'url': RegExp(r'^https?://.+'),
  'ip': RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}$'),
  'date': RegExp(r'^\d{4}-\d{2}-\d{2}$'),
  'hexColor': RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'),
};

/// Job Postings API client.
///
/// For more information, visit: https://apiverve.com/marketplace/jobpostings?utm_source=dart&utm_medium=referral&utm_content=readme
///
/// Parameters:
/// * [company] (required) - The company's career board name, usually the company name in lowercase, for example airbnb, stripe or palantir. Required unless url is given. [maxLength: 100]
/// * [keyword] - Return only jobs whose title, department or team contains every word given, for example engineer or product designer. [maxLength: 100]
/// * [location] - Return only jobs with a location containing this text, for example London, New York or Germany. [maxLength: 100]
/// * [remote] - true returns only jobs open to remote work; false only jobs that are not.
/// * [department] - Return only jobs whose department or team contains this text, for example Engineering or Sales. [maxLength: 100]
/// * [employmentType] - Return only jobs of this employment type. Jobs whose board gives no employment type are kept, since many boards leave it blank; only jobs of another type are left out.
/// * [postedSince] - Return only jobs first published at or after this date or date-time (ISO 8601, for example 2026-10-01), or within this age: a number followed by h, d or w, for example 12h, 7d or 2w. Jobs with no posting date are left out when this is set. [maxLength: 30]
/// * [minSalary] - Return only jobs whose salary range reaches at least this amount, in the job's own currency and pay period: the top of the range is compared, or the bottom when no top is given. Jobs that publish no salary are left out when this is set. [min: 0]
/// * [page] - Page of results to return: 10 jobs per page on the free plan, 50 on paid plans. [min: 1, max: 200]
class JobpostingsClient {
  final String apiKey;
  final String baseUrl;
  final http.Client _httpClient;

  /// Validation rules for parameters.
  static final Map<String, ValidationRule> _validationRules = <String, ValidationRule>{
    'company': ValidationRule(type: 'string', required: true, maxLength: 100),
    'keyword': ValidationRule(type: 'string', required: false, maxLength: 100),
    'location': ValidationRule(type: 'string', required: false, maxLength: 100),
    'remote': ValidationRule(type: 'boolean', required: false),
    'department': ValidationRule(type: 'string', required: false, maxLength: 100),
    'employmentType': ValidationRule(type: 'string', required: false),
    'postedSince': ValidationRule(type: 'string', required: false, maxLength: 30),
    'minSalary': ValidationRule(type: 'number', required: false, min: 0),
    'page': ValidationRule(type: 'integer', required: false, min: 1, max: 200),
  };

  JobpostingsClient(this.apiKey, {
    this.baseUrl = 'https://api.apiverve.com/v1/jobpostings',
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// Validates parameters against defined rules.
  /// Throws [JobpostingsValidationException] if validation fails.
  void _validateParams(Map<String, dynamic> params) {
    final errors = <String>[];

    for (final entry in _validationRules.entries) {
      final paramName = entry.key;
      final rule = entry.value;
      final value = params[paramName];

      // Check required
      if (rule.required && (value == null || (value is String && value.isEmpty))) {
        errors.add('Required parameter [$paramName] is missing');
        continue;
      }

      if (value == null) continue;

      // Type-specific validation
      if (rule.type == 'integer' || rule.type == 'number') {
        final numValue = value is num ? value : num.tryParse(value.toString());
        if (numValue == null) {
          errors.add('Parameter [$paramName] must be a valid ${rule.type}');
          continue;
        }
        if (rule.min != null && numValue < rule.min!) {
          errors.add('Parameter [$paramName] must be at least ${rule.min}');
        }
        if (rule.max != null && numValue > rule.max!) {
          errors.add('Parameter [$paramName] must be at most ${rule.max}');
        }
      } else if (rule.type == 'string' && value is String) {
        if (rule.minLength != null && value.length < rule.minLength!) {
          errors.add('Parameter [$paramName] must be at least ${rule.minLength} characters');
        }
        if (rule.maxLength != null && value.length > rule.maxLength!) {
          errors.add('Parameter [$paramName] must be at most ${rule.maxLength} characters');
        }
        if (rule.format != null && _formatPatterns.containsKey(rule.format)) {
          if (!_formatPatterns[rule.format]!.hasMatch(value)) {
            errors.add('Parameter [$paramName] must be a valid ${rule.format}');
          }
        }
      }

      // Enum validation
      if (rule.enumValues != null && rule.enumValues!.isNotEmpty) {
        if (!rule.enumValues!.contains(value.toString())) {
          errors.add('Parameter [$paramName] must be one of: ${rule.enumValues!.join(", ")}');
        }
      }
    }

    if (errors.isNotEmpty) {
      throw JobpostingsValidationException(errors);
    }
  }

  /// Execute a request to the Job Postings API.
  ///
  /// Parameters are validated before sending the request.
  Future<JobpostingsResponse> execute(Map<String, dynamic> params) async {
    // Validate parameters
    _validateParams(params);
    if (apiKey.isEmpty) {
      throw JobpostingsException('API key is required. Get your API key at: https://apiverve.com');
    }

    try {
      final uri = Uri.parse(baseUrl).replace(
        queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
      );

      final response = await _httpClient.get(
        uri,
        headers: {
          'x-api-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        return JobpostingsResponse.fromJson(json);
      } else if (response.statusCode == 401) {
        throw JobpostingsException('Invalid API key');
      } else if (response.statusCode == 404) {
        throw JobpostingsException('Resource not found');
      } else {
        throw JobpostingsException('API error: ${response.statusCode}');
      }
    } catch (e) {
      if (e is JobpostingsException) rethrow;
      throw JobpostingsException('Request failed: $e');
    }
  }


  /// Close the HTTP client.
  void close() {
    _httpClient.close();
  }
}

/// Exception thrown by the Job Postings API client.
class JobpostingsException implements Exception {
  final String message;

  JobpostingsException(this.message);

  @override
  String toString() => 'JobpostingsException: $message';
}
