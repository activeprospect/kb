#!/bin/bash

# Test script for Document360 deployment
# This script helps test the deployment locally before using GitHub Actions

set -e

echo "🧪 Document360 Deployment Test Script"
echo "===================================="

# Check if environment variables are set
check_env_vars() {
    local missing_vars=()
    
    if [ -z "$D360_API_KEY" ]; then
        missing_vars+=("D360_API_KEY")
    fi
    
    if [ -z "$D360_PROJECT_ID" ]; then
        missing_vars+=("D360_PROJECT_ID")
    fi
    
    if [ ${#missing_vars[@]} -ne 0 ]; then
        echo "❌ Missing environment variables:"
        printf '%s\n' "${missing_vars[@]}"
        echo ""
        echo "Please set these variables:"
        echo "  export D360_API_KEY='your-api-key'"
        echo "  export D360_PROJECT_ID='your-project-id'"
        echo "  export D360_VERSION_ID='your-version-id' (optional)"
        echo "  export D360_USER_ID='your-user-id' (optional)"
        exit 1
    fi
    
    echo "✅ Environment variables are set"
}

# Install dependencies
install_deps() {
    echo ""
    echo "📦 Installing dependencies..."
    cd scripts
    npm install
    cd ..
    echo "✅ Dependencies installed"
}

# Run tests
run_tests() {
    echo ""
    echo "🚀 Running deployment tests..."
    
    # Test 1: Dry run with test content
    echo ""
    echo "Test 1: Dry run with test content"
    echo "---------------------------------"
    export DOCS_PATH="./context/doc360/test-content"
    export DEPLOY_MODE="full"
    export DRY_RUN="true"
    
    cd scripts
    node deploy-markdown-to-document360-enhanced.js
    cd ..
    
    # Test 2: Check API connectivity
    echo ""
    echo "Test 2: API connectivity check"
    echo "-----------------------------"
    curl -s -H "api_token: $D360_API_KEY" \
         "https://api.document360.com/v1/projects" \
         -w "\nHTTP Status: %{http_code}\n" | \
         (grep -q "200" && echo "✅ API connection successful" || echo "❌ API connection failed")
    
    # Test 3: Validate configuration
    echo ""
    echo "Test 3: Configuration validation"
    echo "-------------------------------"
    if [ -f "./context/doc360/api-mapping.json" ]; then
        echo "✅ Configuration file exists"
        node -e "
        try {
            require('./context/doc360/api-mapping.json');
            console.log('✅ Configuration file is valid JSON');
        } catch (e) {
            console.log('❌ Configuration file is invalid:', e.message);
            process.exit(1);
        }
        "
    else
        echo "❌ Configuration file not found"
    fi
}

# Main menu
show_menu() {
    echo ""
    echo "What would you like to test?"
    echo "1) Full test suite"
    echo "2) Dry run deployment (test content)"
    echo "3) Dry run deployment (actual docs)"
    echo "4) Live deployment (test content) ⚠️"
    echo "5) Check API connection only"
    echo "6) Exit"
    echo ""
    read -p "Enter choice [1-6]: " choice
    
    case $choice in
        1)
            check_env_vars
            install_deps
            run_tests
            ;;
        2)
            check_env_vars
            export DOCS_PATH="./context/doc360/test-content"
            export DEPLOY_MODE="full"
            export DRY_RUN="true"
            cd scripts && node deploy-markdown-to-document360-enhanced.js
            ;;
        3)
            check_env_vars
            export DOCS_PATH="./docs/v2"
            export DEPLOY_MODE="full"
            export DRY_RUN="true"
            cd scripts && node deploy-markdown-to-document360-enhanced.js
            ;;
        4)
            echo "⚠️  WARNING: This will deploy test content to Document360!"
            read -p "Are you sure? (yes/no): " confirm
            if [ "$confirm" = "yes" ]; then
                check_env_vars
                export DOCS_PATH="./context/doc360/test-content"
                export DEPLOY_MODE="full"
                export DRY_RUN="false"
                cd scripts && node deploy-markdown-to-document360-enhanced.js
            fi
            ;;
        5)
            check_env_vars
            curl -s -H "api_token: $D360_API_KEY" \
                 "https://api.document360.com/v1/projects" | \
                 python -m json.tool
            ;;
        6)
            echo "Goodbye!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            show_menu
            ;;
    esac
}

# Run the script
echo ""
check_env_vars
show_menu