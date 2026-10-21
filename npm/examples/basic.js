/**
 * Basic Example - Job Postings API
 *
 * This example demonstrates how to use the Job Postings API.
 * Make sure to set your API key in the .env file or replace '[YOUR_API_KEY]' below.
 */

require('dotenv').config();
const jobpostingsAPI = require('../index.js');

// Initialize the API client
const api = new jobpostingsAPI({
    api_key: process.env.API_KEY || '[YOUR_API_KEY]'
});

// Example query
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

// Make the API request using callback
console.log('Making request to Job Postings API...\n');

api.execute(query, function (error, data) {
    if (error) {
        console.error('Error occurred:');
        if (error.error) {
            console.error('Message:', error.error);
            console.error('Status:', error.status);
        } else {
            console.error(JSON.stringify(error, null, 2));
        }
        return;
    }

    console.log('Response:');
    console.log(JSON.stringify(data, null, 2));
});
