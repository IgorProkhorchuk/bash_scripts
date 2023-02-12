#!/bin/bash

function display_usage {
  echo "Usage: $0 [OPTIONS]"
  echo "Options:"
  echo "  --all      Display the IP addresses and symbolic names of all hosts in the current subnet."
  echo "  --target   Display a list of open system TCP ports."
  echo "  --help     Display this help message."
}

function display_all {
  # Display the IP addresses and symbolic names of all hosts in the current subnet.
  nmap -sP $(ip route show | grep '^default' | awk '{print $3}')/24 | awk '/Nmap scan report for/{printf $5;}/FQDN/{print " "$3}'
}

function display_target {
  # Display a list of open system TCP ports.
  nmap -p- localhost | awk '/^[0-9]/{print $1}'
}

if [ $# -eq 0 ]; then
  display_usage
elif [ $# -eq 1 ]; then
  case "$1" in
    "--all")
      display_all
      ;;
    "--target")
      display_target
      ;;
    "--help")
      display_usage
      ;;
    *)
      echo "Error: Invalid option '$1'"
      display_usage
      exit 1
      ;;
  esac
else
  echo "Error: Too many options provided."
  display_usage
  exit 1
fi
