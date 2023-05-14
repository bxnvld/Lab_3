#!/bin/bash

# URL веб-сервера, який будемо перевіряти
url="https://example.com"
# Лог-файл, куди буде записано повідомлення
log_file="error.log"
# Адреса електронної пошти для відправки повідомлення
email="example@example.com"

# Функція для перевірки коду відповіді
check_response_code() {
  response_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
  if [[ "$response_code" =~ ^(2|3)[0-9]{2}$ ]]; then
    echo "Response code: $response_code - OK"
  else
    echo "Response code: $response_code - ERROR"
    echo "$(date) - Response code: $response_code" >> "$log_file"
    # Для відправки повідомлення на пошту можна використати, наприклад, утиліту "mail" на Linux
    # echo "Subject: Error in web server response code" | cat - "$log_file" | sendmail "$email"
  fi
}

while true; do
  check_response_code
  sleep 30
done