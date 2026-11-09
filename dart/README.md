# Job Postings API - Dart/Flutter Client

Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.

[![pub package](https://img.shields.io/pub/v/apiverve_jobpostings.svg)](https://pub.dev/packages/apiverve_jobpostings)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Job Postings API](https://apiverve.com/marketplace/jobpostings?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_jobpostings: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_jobpostings/apiverve_jobpostings.dart';

void main() async {
  final client = JobpostingsClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'company': 'airbnb',
      'keyword': 'engineer',
      'location': 'New York',
      'remote': true,
      'department': 'Engineering',
      'employmentType': 'full-time',
      'postedSince': '7d',
      'minSalary': 100000,
      'page': 1
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "company": "Airbnb",
    "boardTotal": 174,
    "truncated": false,
    "total": 174,
    "page": 1,
    "pages": 4,
    "count": 2,
    "jobs": [
      {
        "id": "8299386",
        "title": "Office Manager, China",
        "department": "People",
        "team": null,
        "location": "Beijing, China",
        "locations": [
          "Beijing, China"
        ],
        "remote": false,
        "workplaceType": "onsite",
        "employmentType": null,
        "experienceLevel": null,
        "postedAt": "2026-10-19T01:34:11.000Z",
        "updatedAt": "2026-10-19T01:34:11.000Z",
        "url": "https://careers.airbnb.com/positions/8299386?gh_jid=8299386",
        "applyUrl": "https://careers.airbnb.com/positions/8299386?gh_jid=8299386",
        "summary": "Airbnb was born in 2007 when two hosts welcomed three guests to their San Francisco home, and has since grown to over 5 million hosts who have welcomed over 2 billion guest arrivals in almost every country across the globe. Every day, hosts offer unique stays and experiences…",
        "description": "Airbnb was born in 2007 when two hosts welcomed three guests to their San Francisco home, and has since grown to over 5 million hosts who have welcomed over 2 billion guest arrivals in almost every country across the globe. Every day, hosts offer unique stays and experiences that make it possible for guests to connect with communities in a more authentic way.\n\nYour Location:\n\nThis position needs to be based in the Beijing, China office 5 days a week. No Visa/Relocation Support.\n\nThe Community you will join:\n\nThe Office Manager plays a critical role in delivering a seamless and welcoming office experience by coordinating daily office operations, supporting local leaders and employees, and…",
        "salary": {
          "min": null,
          "max": null,
          "currency": null,
          "interval": null,
          "summary": null
        }
      },
      {
        "id": "8299396",
        "title": "Head of Homes Supply, Thailand & Vietnam",
        "department": "Sales",
        "team": null,
        "location": "Bangkok, Thailand",
        "locations": [
          "Bangkok, Thailand",
          "Bangkok, Bangkok Metropolis, Thailand"
        ],
        "remote": true,
        "workplaceType": "remote",
        "employmentType": null,
        "experienceLevel": null,
        "postedAt": "2026-10-18T08:55:16.000Z",
        "updatedAt": "2026-10-18T08:55:16.000Z",
        "url": "https://careers.airbnb.com/positions/8299396?gh_jid=8299396",
        "applyUrl": "https://careers.airbnb.com/positions/8299396?gh_jid=8299396",
        "summary": "Airbnb was born in 2007 when two hosts welcomed three guests to their San Francisco home, and has since grown to over 5 million hosts who have welcomed over 2 billion guest arrivals in almost every country across the globe. Every day, hosts offer unique stays and experiences…",
        "description": "Airbnb was born in 2007 when two hosts welcomed three guests to their San Francisco home, and has since grown to over 5 million hosts who have welcomed over 2 billion guest arrivals in almost every country across the globe. Every day, hosts offer unique stays and experiences that make it possible for guests to connect with communities in a more authentic way.\n\nThe Community You Will Join\n\nThe Homes team grows Airbnb's destination business. We manage a competitive portfolio of accommodations that meets guest expectations for value, variety, and quality. We help all types of hosts grow their business through new products, partnerships, best practices, and innovation.\n\nThe Difference You Will…",
        "salary": {
          "min": null,
          "max": null,
          "currency": null,
          "interval": null,
          "summary": null
        }
      }
    ]
  }
}
```

## API Reference

- **API Home:** [Job Postings API](https://apiverve.com/marketplace/jobpostings?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/jobpostings](https://docs.apiverve.com/ref/jobpostings?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
