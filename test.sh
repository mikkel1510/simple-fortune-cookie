APP_URL="http://localhost:8080/api/random"

echo "Testing connection to $APP_URL"

TMP=$(mktemp)
STATUS_CODE=$(curl -sS -o "$TMP" -w "%{http_code}" "$APP_URL" || true)

cat "$TMP"
rm -f "$TMP"

if [ "$STATUS_CODE" = "200" ]; then
  echo "Application reached (HTTP $STATUS_CODE)"
  exit 0
else
  echo "Unreachable (HTTP $STATUS_CODE)"
  exit 1
fi
