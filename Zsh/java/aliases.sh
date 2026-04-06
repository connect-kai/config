#!/bin/zsh

# Default to Java 17 when available so CLI tools work out of the box.
typeset -U path PATH

_java_home_for() {
  /usr/libexec/java_home -v "$1" 2>/dev/null
}

_java_strip_path() {
  path=(${path:#*/JavaVirtualMachines/*/Contents/Home/bin})
}

use-java() {
  if [[ -z "$1" ]]; then
    echo "usage: use-java <version>"
    return 1
  fi

  local home
  home="$(_java_home_for "$1")"

  if [[ -z "$home" ]]; then
    echo "JDK $1 not found"
    return 1
  fi

  export JAVA_HOME="$home"
  _java_strip_path
  path=("$JAVA_HOME/bin" $path)
  hash -r
}

j17() { use-java 17; }
jdk() { echo "$JAVA_HOME"; }

if [[ -z "${JAVA_HOME:-}" ]]; then
  _default_java_home="$(_java_home_for 17)"
  if [[ -z "$_default_java_home" ]]; then
    _default_java_home="$(/usr/libexec/java_home 2>/dev/null || true)"
  fi

  if [[ -n "$_default_java_home" ]]; then
    export JAVA_HOME="$_default_java_home"
  fi

  unset _default_java_home
fi

if [[ -n "${JAVA_HOME:-}" ]]; then
  _java_strip_path
  path=("$JAVA_HOME/bin" $path)
fi
