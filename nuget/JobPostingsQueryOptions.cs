using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.JobPostings
{
    /// <summary>
    /// Query options for the Job Postings API
    /// </summary>
    public class JobPostingsQueryOptions
    {
        /// <summary>
        /// The company's career board name, usually the company name in lowercase, for example airbnb, stripe or palantir. Required unless url is given.
        /// </summary>
        [JsonProperty("company")]
        public string Company { get; set; }

        /// <summary>
        /// Return only jobs whose title, department or team contains every word given, for example engineer or product designer.
        /// </summary>
        [JsonProperty("keyword")]
        public string Keyword { get; set; }

        /// <summary>
        /// Return only jobs with a location containing this text, for example London, New York or Germany.
        /// </summary>
        [JsonProperty("location")]
        public string Location { get; set; }

        /// <summary>
        /// true returns only jobs open to remote work; false only jobs that are not.
        /// </summary>
        [JsonProperty("remote")]
        public bool? Remote { get; set; }

        /// <summary>
        /// Return only jobs whose department or team contains this text, for example Engineering or Sales.
        /// </summary>
        [JsonProperty("department")]
        public string Department { get; set; }

        /// <summary>
        /// Return only jobs of this employment type. Jobs whose board gives no employment type are kept, since many boards leave it blank; only jobs of another type are left out.
        /// </summary>
        [JsonProperty("employmentType")]
        public string EmploymentType { get; set; }

        /// <summary>
        /// Return only jobs first published at or after this date or date-time (ISO 8601, for example 2026-10-01), or within this age: a number followed by h, d or w, for example 12h, 7d or 2w. Jobs with no posting date are left out when this is set.
        /// </summary>
        [JsonProperty("postedSince")]
        public string PostedSince { get; set; }

        /// <summary>
        /// Return only jobs whose salary range reaches at least this amount, in the job's own currency and pay period: the top of the range is compared, or the bottom when no top is given. Jobs that publish no salary are left out when this is set.
        /// </summary>
        [JsonProperty("minSalary")]
        public double? MinSalary { get; set; }

        /// <summary>
        /// Page of results to return: 10 jobs per page on the free plan, 50 on paid plans.
        /// </summary>
        [JsonProperty("page")]
        public int? Page { get; set; }
    }
}
