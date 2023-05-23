#!/bin/bash

url="http://example.com"
log_file="error.log"
email="example@example.com"

check_response_code() {
  response_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [[ "$response_code" =~ ^(2|3)[0-9]{2}$ ]]; then
    echo "Response code: $response_code - OK"
  else
    echo "Response code: $response_code - ERROR"
    echo "$(date) - Response code: $response_code" >> "$log_file"
  fi
}

while true; do
  check_response_code
  sleep 30
done