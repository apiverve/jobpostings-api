/// Response models for the Job Postings API.

/// API Response wrapper.
class JobpostingsResponse {
  final String status;
  final dynamic error;
  final JobpostingsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  JobpostingsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory JobpostingsResponse.fromJson(Map<String, dynamic> json) => JobpostingsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? JobpostingsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Job Postings API.

class JobpostingsData {
  String? company;
  num? boardTotal;
  bool? truncated;
  num? total;
  num? page;
  num? pages;
  num? count;
  List<JobpostingsDataJobsItem>? jobs;

  JobpostingsData({
    this.company,
    this.boardTotal,
    this.truncated,
    this.total,
    this.page,
    this.pages,
    this.count,
    this.jobs,
  });

  factory JobpostingsData.fromJson(Map<String, dynamic> json) => JobpostingsData(
      company: json['company'],
      boardTotal: json['boardTotal'],
      truncated: json['truncated'],
      total: json['total'],
      page: json['page'],
      pages: json['pages'],
      count: json['count'],
      jobs: (json['jobs'] as List?)?.map((e) => JobpostingsDataJobsItem.fromJson(e)).toList(),
    );
}

class JobpostingsDataJobsItem {
  String? id;
  String? title;
  String? department;
  dynamic team;
  String? location;
  List<String>? locations;
  bool? remote;
  String? workplaceType;
  dynamic employmentType;
  dynamic experienceLevel;
  String? postedAt;
  String? updatedAt;
  String? url;
  String? applyUrl;
  String? summary;
  String? description;
  JobpostingsDataJobsItemSalary? salary;

  JobpostingsDataJobsItem({
    this.id,
    this.title,
    this.department,
    this.team,
    this.location,
    this.locations,
    this.remote,
    this.workplaceType,
    this.employmentType,
    this.experienceLevel,
    this.postedAt,
    this.updatedAt,
    this.url,
    this.applyUrl,
    this.summary,
    this.description,
    this.salary,
  });

  factory JobpostingsDataJobsItem.fromJson(Map<String, dynamic> json) => JobpostingsDataJobsItem(
      id: json['id'],
      title: json['title'],
      department: json['department'],
      team: json['team'],
      location: json['location'],
      locations: (json['locations'] as List?)?.cast<String>(),
      remote: json['remote'],
      workplaceType: json['workplaceType'],
      employmentType: json['employmentType'],
      experienceLevel: json['experienceLevel'],
      postedAt: json['postedAt'],
      updatedAt: json['updatedAt'],
      url: json['url'],
      applyUrl: json['applyUrl'],
      summary: json['summary'],
      description: json['description'],
      salary: json['salary'] != null ? JobpostingsDataJobsItemSalary.fromJson(json['salary']) : null,
    );
}

class JobpostingsDataJobsItemSalary {
  dynamic min;
  dynamic max;
  dynamic currency;
  dynamic interval;
  dynamic summary;

  JobpostingsDataJobsItemSalary({
    this.min,
    this.max,
    this.currency,
    this.interval,
    this.summary,
  });

  factory JobpostingsDataJobsItemSalary.fromJson(Map<String, dynamic> json) => JobpostingsDataJobsItemSalary(
      min: json['min'],
      max: json['max'],
      currency: json['currency'],
      interval: json['interval'],
      summary: json['summary'],
    );
}

class JobpostingsRequest {
  String company;
  String? keyword;
  String? location;
  bool? remote;
  String? department;
  String? employmentType;
  String? postedSince;
  double? minSalary;
  int? page;

  JobpostingsRequest({
    required this.company,
    this.keyword,
    this.location,
    this.remote,
    this.department,
    this.employmentType,
    this.postedSince,
    this.minSalary,
    this.page,
  });

  Map<String, dynamic> toJson() => {
      'company': company,
      if (keyword != null) 'keyword': keyword,
      if (location != null) 'location': location,
      if (remote != null) 'remote': remote,
      if (department != null) 'department': department,
      if (employmentType != null) 'employmentType': employmentType,
      if (postedSince != null) 'postedSince': postedSince,
      if (minSalary != null) 'minSalary': minSalary,
      if (page != null) 'page': page,
    };
}
