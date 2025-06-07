#!/bin/bash

# Define color variables
BLACK_TEXT=$'\033[0;90m'
RED_TEXT=$'\033[0;91m'
GREEN_TEXT=$'\033[0;92m'
YELLOW_TEXT=$'\033[0;93m'
BLUE_TEXT=$'\033[0;94m'
MAGENTA_TEXT=$'\033[0;95m'
CYAN_TEXT=$'\033[0;96m'
WHITE_TEXT=$'\033[0;97m'

NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/main/creativity/welcome.sh
if [[ ! -f welcome.sh ]]; then
  echo "Download failed or file not found!"
  exit 1
fi
chmod +x welcome.sh
./welcome.sh



read -p "${CYAN_TEXT}${BOLD_TEXT}Enter your API Key: ${RESET_FORMAT}" API_KEY_INPUT
export API_KEY="$API_KEY_INPUT"

echo "${GREEN_TEXT}${BOLD_TEXT}API Key set successfully!${RESET_FORMAT}"
echo

cat > nl_request.json <<EOF_CP
{
  "document":{
    "type":"PLAIN_TEXT",
    "content":"With approximately 8.2 million people residing in Boston, the capital city of Massachusetts is one of the largest in the United States."
  },
  "encodingType":"UTF8"
}
EOF_CP

echo "${YELLOW_TEXT}${BOLD_TEXT}Sending Natural Language API request...${RESET_FORMAT}"
curl "https://language.googleapis.com/v1/documents:analyzeEntities?key=${API_KEY}" \
  -s -X POST -H "Content-Type: application/json" --data-binary @nl_request.json > nl_response.json
echo "${GREEN_TEXT}${BOLD_TEXT}Natural Language API response saved to nl_response.json${RESET_FORMAT}"

cat > speech_request.json <<EOF_CP
{
  "config": {
      "encoding":"FLAC",
      "languageCode": "en-US"
  },
  "audio": {
      "uri":"gs://cloud-samples-tests/speech/brooklyn.flac"
  }
}
EOF_CP

echo "${YELLOW_TEXT}${BOLD_TEXT}Sending Speech-to-Text API request...${RESET_FORMAT}"
curl -s -X POST -H "Content-Type: application/json" --data-binary @speech_request.json \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > speech_response.json
echo "${GREEN_TEXT}${BOLD_TEXT}Speech-to-Text API response saved to speech_response.json${RESET_FORMAT}"

cat > sentiment_analysis.py <<EOF_CP

import argparse

from google.cloud import language_v1

def print_result(annotations):
    score = annotations.document_sentiment.score
    magnitude = annotations.document_sentiment.magnitude

    for index, sentence in enumerate(annotations.sentences):
        sentence_sentiment = sentence.sentiment.score
        print(
            f"Sentence {index} has a sentiment score of {sentence_sentiment}"
        )

    print(
        f"Overall Sentiment: score of {score} with magnitude of {magnitude}"
    )
    return 0


def analyze(movie_review_filename):
    """Run a sentiment analysis request on text within a passed filename."""
    client = language_v1.LanguageServiceClient()

    with open(movie_review_filename) as review_file:
        # Instantiates a plain text document.
        content = review_file.read()

    document = language_v1.Document(
        content=content, type_=language_v1.Document.Type.PLAIN_TEXT
    )
    annotations = client.analyze_sentiment(request={"document": document})

    # Print the results
    print_result(annotations)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter
    )
    parser.add_argument(
        "movie_review_filename",
        help="The filename of the movie review you'd like to analyze.",
    )
    args = parser.parse_args()

    analyze(args.movie_review_filename)

EOF_CP

echo "${YELLOW_TEXT}${BOLD_TEXT}Downloading sentiment analysis sample files...${RESET_FORMAT}"
gsutil cp gs://cloud-samples-tests/natural-language/sentiment-samples.tgz .

echo "${YELLOW_TEXT}${BOLD_TEXT}Unzipping and extracting files...${RESET_FORMAT}"
gunzip sentiment-samples.tgz
tar -xvf sentiment-samples.tar

echo "${YELLOW_TEXT}${BOLD_TEXT}Running sentiment analysis on reviews/bladerunner-pos.txt...${RESET_FORMAT}"
python3 sentiment_analysis.py reviews/bladerunner-pos.txt

curl -LO https://raw.githubusercontent.com/Cloud-Hustlers/content/refs/heads/main/creativity/subscribe.sh
chmod +x subscribe.sh
./subscribe.sh
