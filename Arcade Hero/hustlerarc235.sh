curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh

gcloud config set compute/region $REGION
export PROJECT_ID=$(gcloud config get-value project)


mkdir hustler && cd hustler


cat > main.py <<'EOF_END'
import functions_framework

@functions_framework.http
def hello_http(request):
    """HTTP Cloud Function.
    Args:
        request (flask.Request): The request object.
        <https://flask.palletsprojects.com/en/1.1.x/api/#incoming-request-data>
    Returns:
        The response text, or any set of values that can be turned into a
        Response object using `make_response`
        <https://flask.palletsprojects.com/en/1.1.x/api/#flask.make_response>.
    """
    request_json = request.get_json(silent=True)
    request_args = request.args

    if request_json and 'name' in request_json:
        name = request_json['name']
    elif request_args and 'name' in request_args:
        name = request_args['name']
    else:
        name = 'World'
    return 'Hello {}!'.format(name)

EOF_END


cat > requirements.txt <<EOF_END
functions-framework==3.*
EOF_END

gcloud functions deploy cf-demo \
  --gen2 \
  --runtime python312 \
  --entry-point hello_http \
  --source . \
  --region $REGION \
  --trigger-http \
  --allow-unauthenticated \
  --quiet

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
