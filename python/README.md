Job Postings API
============

Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.


[![PyPI version](https://img.shields.io/pypi/v/apiverve-jobpostings.svg)](https://pypi.org/project/apiverve-jobpostings/)

This is a Python wrapper for the [Job Postings API](https://apiverve.com/marketplace/jobpostings?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Installation

Using `pip`:

```bash
pip install apiverve-jobpostings
```

Using `pip3`:

```bash
pip3 install apiverve-jobpostings
```

---

## Configuration

Before using the Job Postings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=pypi&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient

# Initialize the client with your APIVerve API key
api = JobpostingsAPIClient("[YOUR_API_KEY]")

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

try:
    # Make the API call
    result = api.execute(query)

    # Print the result
    print(result)
except Exception as e:
    print(f"Error: {e}")
```

---

## Usage

The Job Postings API documentation is found here: [https://docs.apiverve.com/ref/jobpostings](https://docs.apiverve.com/ref/jobpostings?utm_source=pypi&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```python
# Import the client module
from apiverve_jobpostings.apiClient import JobpostingsAPIClient

# Initialize the client with your APIVerve API key
api = JobpostingsAPIClient("[YOUR_API_KEY]")
```

---

## Perform Request

Using the API client, you can perform requests to the API.

###### Define Query

```python
query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}
```

###### Simple Request

```python
# Make a request to the API
result = api.execute(query)

# Print the result
print(result)
```

###### Example Response

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

---

## Error Handling

The API client provides comprehensive error handling through the `JobpostingsAPIClientError` exception. Here are some examples:

### Basic Error Handling

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient, JobpostingsAPIClientError

api = JobpostingsAPIClient("[YOUR_API_KEY]")

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)
    print("Success!")
    print(result)
except JobpostingsAPIClientError as e:
    print(f"API Error: {e.message}")
    if e.status_code:
        print(f"Status Code: {e.status_code}")
    if e.response:
        print(f"Response: {e.response}")
```

### Handling Specific Error Types

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient, JobpostingsAPIClientError

api = JobpostingsAPIClient("[YOUR_API_KEY]")

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)

    # Check for successful response
    if result.get('status') == 'success':
        print("Request successful!")
        print(result.get('data'))
    else:
        print(f"API returned an error: {result.get('error')}")

except JobpostingsAPIClientError as e:
    # Handle API client errors
    if e.status_code == 401:
        print("Unauthorized: Invalid API key")
    elif e.status_code == 429:
        print("Rate limit exceeded")
    elif e.status_code >= 500:
        print("Server error - please try again later")
    else:
        print(f"API error: {e.message}")
except Exception as e:
    # Handle unexpected errors
    print(f"Unexpected error: {str(e)}")
```

### Using Context Manager (Recommended)

The client supports the context manager protocol for automatic resource cleanup:

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient, JobpostingsAPIClientError

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

# Using context manager ensures proper cleanup
with JobpostingsAPIClient("[YOUR_API_KEY]") as api:
    try:
        result = api.execute(query)
        print(result)
    except JobpostingsAPIClientError as e:
        print(f"Error: {e.message}")
# Session is automatically closed here
```

---

## Advanced Features

### Debug Mode

Enable debug logging to see detailed request and response information:

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient

# Enable debug mode
api = JobpostingsAPIClient("[YOUR_API_KEY]", debug=True)

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

# Debug information will be printed to console
result = api.execute(query)
```

### Manual Session Management

If you need to manually manage the session lifecycle:

```python
from apiverve_jobpostings.apiClient import JobpostingsAPIClient

api = JobpostingsAPIClient("[YOUR_API_KEY]")

query = {
    "company": "airbnb",
    "keyword": "engineer",
    "location": "New York",
    "remote": true,
    "department": "Engineering",
    "employmentType": "full-time",
    "postedSince": "7d",
    "minSalary": 100000,
    "page": 1
}

try:
    result = api.execute(query)
    print(result)
finally:
    # Manually close the session when done
    api.close()
```

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=pypi&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=pypi&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
