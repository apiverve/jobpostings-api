# Job Postings API

Job Postings is a jobs API that returns the open positions on a company's public career board. Every job comes back in the same shape: title, department, team, locations, remote and workplace type, employment type, posting date and apply link. Filter by keyword, location, department, employment type, posting date or remote. Paid plans add the full job description and salary ranges where the company publishes them.

[![npm version](https://img.shields.io/npm/v/@apiverve/jobpostings.svg)](https://www.npmjs.com/package/@apiverve/jobpostings)

This is a JavaScript wrapper for the [Job Postings API](https://apiverve.com/marketplace/jobpostings?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Installation

Using npm:
```shell
npm install @apiverve/jobpostings
```

Using yarn:
```shell
yarn add @apiverve/jobpostings
```

---

## Configuration

Before using the Job Postings API client, you have to setup your account and obtain your API Key.
You can get it by signing up at [https://apiverve.com](https://apiverve.com?utm_source=npm&utm_medium=referral&utm_content=readme)

---

## Quick Start

[Get started with the Quick Start Guide](https://docs.apiverve.com/quickstart?utm_source=npm&utm_medium=referral&utm_content=readme)

The Job Postings API documentation is found here: [https://docs.apiverve.com/ref/jobpostings](https://docs.apiverve.com/ref/jobpostings?utm_source=npm&utm_medium=referral&utm_content=readme).
You can find parameters, example responses, and status codes documented here.

### Setup

```javascript
const jobpostingsAPI = require('@apiverve/jobpostings');
const api = new jobpostingsAPI({
    api_key: '[YOUR_API_KEY]'
});
```

---

## Usage

---

### Perform Request

Using the API is simple. All you have to do is make a request. The API will return a response with the data you requested.

```javascript
var query = {
  company: "airbnb",
  keyword: "engineer",
  location: "New York",
  remote: true,
  department: "Engineering",
  employmentType: "full-time",
  postedSince: "7d",
  minSalary: 100000,
  page: 1
};

api.execute(query, function (error, data) {
    if (error) {
        return console.error(error);
    } else {
        console.log(data);
    }
});
```

---

### Using Promises

You can also use promises to make requests. The API returns a promise that you can use to handle the response.

```javascript
var query = {
  company: "airbnb",
  keyword: "engineer",
  location: "New York",
  remote: true,
  department: "Engineering",
  employmentType: "full-time",
  postedSince: "7d",
  minSalary: 100000,
  page: 1
};

api.execute(query)
    .then(data => {
        console.log(data);
    })
    .catch(error => {
        console.error(error);
    });
```

---

### Using Async/Await

You can also use async/await to make requests. The API returns a promise that you can use to handle the response.

```javascript
async function makeRequest() {
    var query = {
  company: "airbnb",
  keyword: "engineer",
  location: "New York",
  remote: true,
  department: "Engineering",
  employmentType: "full-time",
  postedSince: "7d",
  minSalary: 100000,
  page: 1
};

    try {
        const data = await api.execute(query);
        console.log(data);
    } catch (error) {
        console.error(error);
    }
}
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

Need any assistance? [Get in touch with Customer Support](https://apiverve.com/contact?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## Updates

Stay up to date by following [@apiverveHQ](https://twitter.com/apiverveHQ) on Twitter.

---

## Legal

All usage of the APIVerve website, API, and services is subject to the [APIVerve Terms of Service](https://apiverve.com/terms?utm_source=npm&utm_medium=referral&utm_content=readme) and [Privacy Policy](https://apiverve.com/privacy?utm_source=npm&utm_medium=referral&utm_content=readme).

---

## License
Licensed under the MIT License (MIT)

Copyright (&copy;) 2026 APIVerve, and EvlarSoft LLC

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
