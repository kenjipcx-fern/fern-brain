#!/bin/bash

# Check if components.json exists
if [ ! -f "components.json" ]; then
    echo "Error: components.json not found in current directory"
    echo "Please run this script from a directory containing components.json"
    exit 1
fi

# Check if jq is installed (for JSON manipulation)
if ! command -v jq &> /dev/null; then
    echo "Installing jq for JSON manipulation..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install jq
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        sudo apt-get update && sudo apt-get install -y jq
    else
        echo "Please install jq manually"
        exit 1
    fi
fi

# Add registries to components.json
echo "Adding shadcn MCP registries to components.json..."

# Create temporary file with updated JSON
jq '. + {
  "registries": {
    "@tweakcn": "https://tweakcn.com/r/themes/{name}.json",
    "@aielements": "https://registry.ai-sdk.dev/{name}.json"
  }
}' components.json > components.tmp.json

# Replace original file with updated one
mv components.tmp.json components.json

echo "Successfully added registries to components.json!"
echo ""
echo "Added registries:"
echo "  - @tweakcn: Themes registry"
echo "  - @aceternityui: Aceternity UI components"
echo "  - @aielements: AI SDK components"

