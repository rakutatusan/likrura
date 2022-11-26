#!/usr/bin/env bash

set -eo pipefail; [[ $TRACE ]] && set -x

readonly VERSION="1.0.0"
readonly OPENSSL_CIPHER_TYPE="aes-256-cbc"

likru_version() {
  echo "likrura $VERSION"
}

likru_help() {
  echo "Usage: cryptr command <command-specific-options>"
  echo
  cat<<EOF | column -c2 -t -s,
  encrypt <file>, Encrypt file
  decrypt <file.aes>, Decrypt encrypted file
  help, Displays help
  version, Displays the current version
EOF
  echo
}

likru_kru() {
  local _file="$1"
  if [[ ! -f "$_file" ]]; then
    echo "File not found" 1>&2
    exit 4
  fi

  if [[ ! -z "${LIKRU_PASSWORD}" ]]; then
    echo "[notice] using environment variable CRYPTR_PASSWORD for the password"
    openssl $OPENSSL_CIPHER_TYPE -salt -pbkdf2 -in "$_file" -out "${_file}.aes" -pass env:LIKRU_PASSWORD
  else
    openssl $OPENSSL_CIPHER_TYPE -salt -pbkdf2 -in "$_file" -out "${_file}.aes"
  fi
}

likru_dru() {
local _file="$1"
  if [[ ! -f "$_file" ]]; then
    echo "File not found" 1>&2
    exit 5
  fi

  if [[ ! -z "${LIKRU_PASSWORD}" ]]; then
    echo "[notice] using environment variable LIKRU_PASSWORD for the password"
    openssl $OPENSSL_CIPHER_TYPE -d -salt -pbkdf2 -in "$_file" -out "${_file%\.aes}" -pass env:CRYPTR_PASSWORD
  else
    openssl $OPENSSL_CIPHER_TYPE -d -salt -pbkdf2 -in "$_file" -out "${_file%\.aes}"
  fi
}

likru_main() {
  local _command="$1"

  if [[ -z $_command ]]; then
    likru_version
    echo
    likru_help
    exit 0
  fi

  shift 1
  case "$_command" in
    "kru")
      likru_kru "$@"
      ;;

    "dru")
      likru_dru "$@"
      ;;

    "version")
      likru_version
      ;;

    "help")
      likru_help
      ;;

    *)
      likru_help 1>&2
      exit 3
  esac
}

if [[ "$0" == "$BASH_SOURCE" ]]; then
  likru_main "$@"
fi
