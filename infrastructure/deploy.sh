#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Function
print_status(){
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_warning(){
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error(){
    echo -e "${RED}[ERROR]${NC} $1"
}

print_success(){
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}


show_usage(){
    echo "Commands:"
    echo "  validate <nama_stack>   Validasi template CloudFormation"
    echo "  deploy   <nama_stack>   Deploy atau update stack ke AWS"
    echo "  destroy  <nama_stack>   Hapus stack dari AWS"
    exit 1
}

if [ $# -lt 2]; then
    usage
fi

COMMAND=$1
STACK_NAME=$2

