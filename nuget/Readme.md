Job Postings API
============

Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.


[![NuGet version](https://img.shields.io/nuget/v/APIVerve.API.JobPostings.svg)](https://www.nuget.org/packages/APIVerve.API.JobPostings)

This is a .NET wrapper for the [Job Postings API](https://apiverve.com/marketplace/jobpostings?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Installation

Using the .NET CLI:
```
dotnet add package APIVerve.API.JobPostings
```

Using the Package Manager:
```
nuget install APIVerve.API.JobPostings
```

Using the Package Manager Console:
```
Install-Package APIVerve.API.JobPostings
```

From within Visual Studio:

1. Open the Solution Explorer
2. Right-click on a project within your solution
3. Click on Manage NuGet Packages
4. Click on the Browse tab and search for "APIVerve.API.JobPostings"
5. Click on the APIVerve.API.JobPostings package, select the appropriate version in the right-tab and click Install

---

## Configuration

Before using the Job Postings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=nuget&utm_medium=referral&utm_content=readme)

---

## Quick Start

Here's a simple example to get you started quickly:

```csharp
using System;
using APIVerve.API.JobPostings;

class Program
{
    static async Task Main(string[] args)
    {
        // Initialize the API client
        var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new JobPostingsQueryOptions {
            Company = "airbnb",
            Keyword = "engineer",
            Location = "New York",
            Remote = true,
            Department = "Engineering",
            EmploymentType = "full-time",
            PostedSince = "7d",
            MinSalary = 100000,
            Page = 1
        };

        // Make the API call
        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                // Access response data using the strongly-typed ResponseObj properties
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Exception: {ex.Message}");
        }
    }
}
```

---

## Usage

The Job Postings API documentation is found here: [https://docs.apiverve.com/ref/jobpostings](https://docs.apiverve.com/ref/jobpostings?utm_source=nuget&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

###### Authentication
Job Postings API uses API Key-based authentication. When you create an instance of the API client, you can pass your API Key as a parameter.

```csharp
// Create an instance of the API client
var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");
```

---

## Usage Examples

### Basic Usage (Async/Await Pattern - Recommended)

The modern async/await pattern provides the best performance and code readability:

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.JobPostings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new JobPostingsQueryOptions {
            Company = "airbnb",
            Keyword = "engineer",
            Location = "New York",
            Remote = true,
            Department = "Engineering",
            EmploymentType = "full-time",
            PostedSince = "7d",
            MinSalary = 100000,
            Page = 1
        };

        var response = await apiClient.ExecuteAsync(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

### Synchronous Usage

If you need to use synchronous code, you can use the `Execute` method:

```csharp
using System;
using APIVerve.API.JobPostings;

public class Example
{
    public static void Main(string[] args)
    {
        var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new JobPostingsQueryOptions {
            Company = "airbnb",
            Keyword = "engineer",
            Location = "New York",
            Remote = true,
            Department = "Engineering",
            EmploymentType = "full-time",
            PostedSince = "7d",
            MinSalary = 100000,
            Page = 1
        };

        var response = apiClient.Execute(queryOptions);

        if (response.Error != null)
        {
            Console.WriteLine($"Error: {response.Error}");
        }
        else
        {
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
    }
}
```

---

## Error Handling

The API client provides comprehensive error handling. Here are some examples:

### Handling API Errors

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.JobPostings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

        var queryOptions = new JobPostingsQueryOptions {
            Company = "airbnb",
            Keyword = "engineer",
            Location = "New York",
            Remote = true,
            Department = "Engineering",
            EmploymentType = "full-time",
            PostedSince = "7d",
            MinSalary = 100000,
            Page = 1
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            // Check for API-level errors
            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
                Console.WriteLine($"Status: {response.Status}");
                return;
            }

            // Success - use the data
            Console.WriteLine("Request successful!");
            Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
        }
        catch (ArgumentException ex)
        {
            // Invalid API key or parameters
            Console.WriteLine($"Invalid argument: {ex.Message}");
        }
        catch (System.Net.Http.HttpRequestException ex)
        {
            // Network or HTTP errors
            Console.WriteLine($"Network error: {ex.Message}");
        }
        catch (Exception ex)
        {
            // Other errors
            Console.WriteLine($"Unexpected error: {ex.Message}");
        }
    }
}
```

### Comprehensive Error Handling with Retry Logic

```csharp
using System;
using System.Threading.Tasks;
using APIVerve.API.JobPostings;

public class Example
{
    public static async Task Main(string[] args)
    {
        var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

        // Configure retry behavior (max 3 retries)
        apiClient.SetMaxRetries(3);        // Retry up to 3 times (default: 0, max: 3)
        apiClient.SetRetryDelay(2000);     // Wait 2 seconds between retries

        var queryOptions = new JobPostingsQueryOptions {
            Company = "airbnb",
            Keyword = "engineer",
            Location = "New York",
            Remote = true,
            Department = "Engineering",
            EmploymentType = "full-time",
            PostedSince = "7d",
            MinSalary = 100000,
            Page = 1
        };

        try
        {
            var response = await apiClient.ExecuteAsync(queryOptions);

            if (response.Error != null)
            {
                Console.WriteLine($"API Error: {response.Error}");
            }
            else
            {
                Console.WriteLine("Success!");
                Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed after retries: {ex.Message}");
        }
    }
}
```

---

## Advanced Features

### Custom Headers

Add custom headers to your requests:

```csharp
var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

// Add custom headers
apiClient.AddCustomHeader("X-Custom-Header", "custom-value");
apiClient.AddCustomHeader("X-Request-ID", Guid.NewGuid().ToString());

var queryOptions = new JobPostingsQueryOptions {
    Company = "airbnb",
    Keyword = "engineer",
    Location = "New York",
    Remote = true,
    Department = "Engineering",
    EmploymentType = "full-time",
    PostedSince = "7d",
    MinSalary = 100000,
    Page = 1
};

var response = await apiClient.ExecuteAsync(queryOptions);

// Remove a header
apiClient.RemoveCustomHeader("X-Custom-Header");

// Clear all custom headers
apiClient.ClearCustomHeaders();
```

### Request Logging

Enable logging for debugging:

```csharp
var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]", isDebug: true);

// Or use a custom logger
apiClient.SetLogger(message =>
{
    Console.WriteLine($"[LOG] {DateTime.Now:yyyy-MM-dd HH:mm:ss} - {message}");
});

var queryOptions = new JobPostingsQueryOptions {
    Company = "airbnb",
    Keyword = "engineer",
    Location = "New York",
    Remote = true,
    Department = "Engineering",
    EmploymentType = "full-time",
    PostedSince = "7d",
    MinSalary = 100000,
    Page = 1
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Retry Configuration

Customize retry behavior for failed requests:

```csharp
var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]");

// Set retry options
apiClient.SetMaxRetries(3);           // Retry up to 3 times (default: 0, max: 3)
apiClient.SetRetryDelay(1500);        // Wait 1.5 seconds between retries (default: 1000ms)

var queryOptions = new JobPostingsQueryOptions {
    Company = "airbnb",
    Keyword = "engineer",
    Location = "New York",
    Remote = true,
    Department = "Engineering",
    EmploymentType = "full-time",
    PostedSince = "7d",
    MinSalary = 100000,
    Page = 1
};

var response = await apiClient.ExecuteAsync(queryOptions);
```

### Dispose Pattern

The API client implements `IDisposable` for proper resource cleanup:

```csharp
var queryOptions = new JobPostingsQueryOptions {
    Company = "airbnb",
    Keyword = "engineer",
    Location = "New York",
    Remote = true,
    Department = "Engineering",
    EmploymentType = "full-time",
    PostedSince = "7d",
    MinSalary = 100000,
    Page = 1
};

using (var apiClient = new JobPostingsAPIClient("[YOUR_API_KEY]"))
{
    var response = await apiClient.ExecuteAsync(queryOptions);
    Console.WriteLine(Newtonsoft.Json.JsonConvert.SerializeObject(response, Newtonsoft.Json.Formatting.Indented));
}
// HttpClient is automatically disposed here
```

---

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

---

## Customer Support

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=nuget&utm_medium=referral&utm_content=readme).

---

## Updates
Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=nuget&utm_medium=referral&utm_content=readme) and all legal documents and agreements.

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
