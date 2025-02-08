#!/bin/bash

# Backend API URL
export VITE_BACKEND_API_URL="http://localhost:8000"

# Various configuration settings
export VITE_REACT_APP_SOURCES="local,youtube,wiki,s3"
export VITE_LLM_MODELS=""
export VITE_GOOGLE_CLIENT_ID=""
export VITE_BLOOM_URL="https://workspace-preview.neo4j.io/workspace/explore?connectURL={CONNECT_URL}&search=Show+me+a+graph&featureGenAISuggestions=true&featureGenAISuggestionsInternal=true"
export VITE_TIME_PER_PAGE=50
export VITE_LARGE_FILE_SIZE=5242880
export VITE_CHUNK_SIZE=5242880
export VITE_CHAT_MODES=""
export VITE_ENV="DEV"
export VITE_BATCH_SIZE=2
export VITE_LLM_MODELS_PROD="openai_gpt_4o,openai_gpt_4o_mini,diffbot,gemini_1.5_flash"
export VITE_AUTH0_CLIENT_ID=""
export VITE_AUTH0_DOMAIN=""
export VITE_SKIP_AUTH="true"

# Deployment environment
export DEPLOYMENT_ENV="local"

echo "Environment variables set for development."

