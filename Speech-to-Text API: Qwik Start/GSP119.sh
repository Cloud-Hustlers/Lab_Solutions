#!/bin/bash


NO_COLOR=$'\033[0m'
RESET_FORMAT=$'\033[0m'
BOLD_TEXT=$'\033[1m'
UNDERLINE_TEXT=$'\033[4m'


echo "${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo "${BOLD_TEXT}         WELCOME TO CLOUD HUSTLERS     ${RESET_FORMAT}"
echo "${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo ""


# Function for error handling
function error_handler() {
    echo "${BOLD_TEXT}ERROR: $1${RESET_FORMAT}"
    exit 1
}

# Function to display task headers
function display_task() {
    echo "${BOLD_TEXT}$1${RESET_FORMAT}"
    echo "${BOLD_TEXT}$2${RESET_FORMAT}"
    echo ""
}

# Function to display success messages
function success() {
    echo "${BOLD_TEXT}✓ $1${RESET_FORMAT}"
    echo ""
}

# Function to display manual step instructions
function manual_step() {
    echo "${BOLD_TEXT}MANUAL STEP REQUIRED:${RESET_FORMAT}"
    echo "${BOLD_TEXT}$1${RESET_FORMAT}"
    echo ""
}

# Clear the screen

# Task 1: Create an API key (Manual step)
display_task "TASK 1" "Create an API key"

manual_step "1. Go to Google Cloud Console
2. Click Navigation menu > APIs & services > Credentials
3. Click 'Create credentials'
4. Select 'API key' from the dropdown menu
5. Copy the generated API key

After completing these steps, return to this terminal."

# Prompt for API key
echo "${BOLD_TEXT}Enter your API key:${RESET_FORMAT}"
read API_KEY

# Validate API key input
if [ -z "$API_KEY" ]; then
    error_handler "API key cannot be empty"
fi

# Export API key as environment variable
export API_KEY=$API_KEY
success "API key set as environment variable"

# Task 2: Create Speech-to-Text API request
display_task "TASK 2" "Create your Speech-to-Text API request"

# Create request.json file
echo "${BOLD_TEXT}Creating request.json file...${RESET_FORMAT}"
cat > request.json << 'EOL'
{
  "config": {
      "encoding":"FLAC",
      "languageCode": "en-US"
  },
  "audio": {
      "uri":"gs://cloud-samples-tests/speech/brooklyn.flac"
  }
}
EOL

# Verify file creation
if [ ! -f "request.json" ]; then
    error_handler "Failed to create request.json file"
else
    success "request.json file created successfully"
fi

# Task 3: Call the Speech-to-Text API
display_task "TASK 3" "Call the Speech-to-Text API"

echo "${BOLD_TEXT}Calling Speech-to-Text API...${RESET_FORMAT}"

# Make the API call and display response
echo "${BOLD_TEXT}API Response:${RESET_FORMAT}"
curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}"
echo ""

# Save response to result.json
echo "${BOLD_TEXT}Saving response to result.json...${RESET_FORMAT}"
curl -s -X POST -H "Content-Type: application/json" --data-binary @request.json \
"https://speech.googleapis.com/v1/speech:recognize?key=${API_KEY}" > result.json

# Verify result.json creation
if [ ! -f "result.json" ]; then
    error_handler "Failed to save response to result.json"
else
    success "Response saved to result.json successfully"
    echo "${BOLD_TEXT}Content of result.json:${RESET_FORMAT}"
    cat result.json
fi

echo "${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo "${BOLD_TEXT}         SUBSCRIBE TO CLOUD HUSTLERS   ${RESET_FORMAT}"
echo "${BOLD_TEXT}=======================================${RESET_FORMAT}"
echo ""
