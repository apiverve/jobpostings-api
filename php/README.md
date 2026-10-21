# Job Postings API - PHP Package

Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.

## Installation

Install via Composer:

```bash
composer require apiverve/jobpostings
```

## Getting Started

Get your API key at [APIVerve](https://apiverve.com)

### Basic Usage

```php
<?php

require_once 'vendor/autoload.php';

use APIVerve\Jobpostings\Client;

// Initialize the client
$client = new Client('YOUR_API_KEY');

// Make a request
$response = $client->execute([
    'company' => 'airbnb',
    'keyword' => 'engineer',
    'location' => 'New York',
    'remote' => true,
    'department' => 'Engineering',
    'employmentType' => 'full-time',
    'postedSince' => '7d',
    'minSalary' => 100000,
    'page' => 1
]);

// Print the response
print_r($response);
```


### Error Handling

```php
use APIVerve\Jobpostings\Client;
use APIVerve\Jobpostings\Exceptions\APIException;
use APIVerve\Jobpostings\Exceptions\ValidationException;

try {
    $response = $client->execute(['company' => 'airbnb', 'keyword' => 'engineer', 'location' => 'New York', 'remote' => true, 'department' => 'Engineering', 'employmentType' => 'full-time', 'postedSince' => '7d', 'minSalary' => 100000, 'page' => 1]);
    print_r($response['data']);
} catch (ValidationException $e) {
    echo "Validation error: " . implode(', ', $e->getErrors());
} catch (APIException $e) {
    echo "API error: " . $e->getMessage();
    echo "Status code: " . $e->getStatusCode();
}
```

### Debug Mode

```php
// Enable debug logging
$client = new Client(
    apiKey: 'YOUR_API_KEY',
    debug: true
);
```

## Example Response

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

## Requirements

- PHP 7.4 or higher
- Guzzle HTTP client

## Documentation

For more information, visit the [API Documentation](https://docs.apiverve.com/ref/jobpostings?utm_source=packagist&utm_medium=referral&utm_content=readme).

## Support

- Website: [https://apiverve.com/marketplace/jobpostings?utm_source=php&utm_medium=referral&utm_content=readme](https://apiverve.com/marketplace/jobpostings?utm_source=php&utm_medium=referral&utm_content=readme)
- Email: hello@apiverve.com

## License

This package is available under the [MIT License](LICENSE).
