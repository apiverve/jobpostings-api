"""
Job Postings API - Basic Usage Example

This example demonstrates the basic usage of the Job Postings API.
API Documentation: https://docs.apiverve.com/ref/jobpostings
"""

import os
import requests
import json

API_KEY = os.getenv('APIVERVE_API_KEY', 'YOUR_API_KEY_HERE')
API_URL = 'https://api.apiverve.com/v1/jobpostings'

def call_jobpostings_api():
    """
    Make a GET request to the Job Postings API
    """
    try:
        # Query parameters
        params &#x3D; {&#x27;company&#x27;: &#x27;airbnb&#x27;, &#x27;keyword&#x27;: &#x27;engineer&#x27;, &#x27;location&#x27;: &#x27;New York&#x27;, &#x27;remote&#x27;: true, &#x27;department&#x27;: &#x27;Engineering&#x27;, &#x27;employmentType&#x27;: &#x27;full-time&#x27;, &#x27;postedSince&#x27;: &#x27;7d&#x27;, &#x27;page&#x27;: 1}

        headers = {
            'x-api-key': API_KEY
        }

        response = requests.get(API_URL, headers=headers, params=params)

        # Raise exception for HTTP errors
        response.raise_for_status()

        data = response.json()

        # Check API response status
        if data.get('status') == 'ok':
            print('✓ Success!')
            print('Response data:', json.dumps(data['data'], indent=2))
            return data['data']
        else:
            print('✗ API Error:', data.get('error', 'Unknown error'))
            return None

    except requests.exceptions.RequestException as e:
        print(f'✗ Request failed: {e}')
        return None

if __name__ == '__main__':
    print('📤 Calling Job Postings API...\n')

    result = call_jobpostings_api()

    if result:
        print('\n📊 Final Result:')
        print(json.dumps(result, indent=2))
    else:
        print('\n✗ API call failed')
