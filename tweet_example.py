import base64
import hashlib
import hmac
import json
import time
import uuid
from urllib.parse import quote, urlencode

import requests

# Twitter API credentialspy
CONSUMER_KEY = "KebJ7nY7FPcsiMuUkjhMXTUMf"
CONSUMER_SECRET = "zJDH1jlx9WWMT2ekRuYaABX1Zb8JMBpKo2mdn4FaNCYAtBdnKo"
ACCESS_TOKEN = "1859607209115619328-R9oNXSPOfI3oMYw1IQOcdIFROOJMKM"
ACCESS_TOKEN_SECRET = "cxI6j6nG3bNcm1qYUflMKSmSKC5nlVrgKWQJ3r7P4kL0B"

def generate_oauth_signature(method, url, params, consumer_secret, token_secret):
    """Generate OAuth 1.0a signature."""
    # Sort parameters alphabetically
    sorted_params = sorted(params.items())
    
    # Create parameter string
    param_string = '&'.join([f"{quote(str(k), safe='')}={quote(str(v), safe='')}" for k, v in sorted_params])
    
    # Create signature base string
    signature_base = f"{method}&{quote(url, safe='')}&{quote(param_string, safe='')}"
    
    # Create signing key
    signing_key = f"{quote(consumer_secret, safe='')}&{quote(token_secret or '', safe='')}"
    
    # Generate signature
    signature = base64.b64encode(
        hmac.new(
            signing_key.encode('utf-8'),
            signature_base.encode('utf-8'),
            hashlib.sha1
        ).digest()
    ).decode('utf-8')

    print(signature)
    
    return signature

def create_oauth_header(method, url, params, consumer_key, consumer_secret, access_token, access_token_secret):
    """Create OAuth 1.0a authorization header."""
    # OAuth parameters
    oauth_params = {
        'oauth_consumer_key': consumer_key,
        'oauth_nonce': str(uuid.uuid4()),
        'oauth_signature_method': 'HMAC-SHA1',
        'oauth_timestamp': str(int(time.time())),
        'oauth_token': access_token,
        'oauth_version': '1.0'
    }
    
    # Generate signature
    oauth_params['oauth_signature'] = generate_oauth_signature(
        method, url, oauth_params, consumer_secret, access_token_secret
    )
    
    # Create authorization header
    auth_header = 'OAuth ' + ', '.join([
        f'{quote(str(k), safe="")}="{quote(str(v), safe="")}"'
        for k, v in sorted(oauth_params.items())
    ])
    
    return auth_header

def post_tweet(text):
    """Post a tweet using Twitter API v2."""
    url = "https://api.twitter.com/2/tweets"
    method = "POST"
    
    # Request body
    data = {"text": text}
    
    # Create OAuth header
    auth_header = create_oauth_header(
        method=method,
        url=url,
        params={},  # No query parameters for this endpoint
        consumer_key=CONSUMER_KEY,
        consumer_secret=CONSUMER_SECRET,
        access_token=ACCESS_TOKEN,
        access_token_secret=ACCESS_TOKEN_SECRET
    )
    
    # Request headers
    headers = {
        "Authorization": auth_header,
        "Content-Type": "application/json"
    }
    
    # Make request
    response = requests.post(url, headers=headers, json=data)
    
    # Print response
    print(f"Status Code: {response.status_code}")
    print(f"Response: {response.text}")
    
    return response.json()

if __name__ == "__main__":
    # Example usage
    tweet_text = "Hello, Twitter! This is a test tweet using OAuth 1.0a."
    post_tweet(tweet_text) 