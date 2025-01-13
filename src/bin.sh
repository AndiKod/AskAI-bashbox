use "std/fmt"

# @description Main function
# Content for when the script is called
#+with no Arguments or Flags.
main() {

  conf="${ROOT}/data/conf.yaml"

  h1 " --= Ask AI =--"
  hr "Sh:erpa" "-"
  p "Search with Perplexity AI"
  br
  h2 "Set your Browser"
  p "Binary on path: ${em}${txtBlue}aai setBrowser${x} firefox${x}"
  p "Path if on WSL: ${em}${txtBlue}aai setBrowser${x} /path/to/app.exe${x}"
  em "Actual browser: $(get_yaml_item "browser" "$conf")"
  br
  br
  h2 "Search something"
  p "Usage: ${em}${txtBlue}aai${x} \"My question here\"${x}"
  br

}

# Calling the main() function
if [[ "$#" == 0 ]]; then
  main
  exit 0
fi

# Updating the default Browser
if [[ "$1" == "setBrowser" ]]; then
  # Data file
  conf="${ROOT}/data/conf.yaml"
  # The value to be set
  my_browser="$2"

  # Execute and Feedback
  if update_yaml_item "browser" "$my_browser" "$conf"; then
    br
    p "${btnSuccess} Done! ${x} Browser: $(get_yaml_item "browser" "$conf")"
    br
  else
    br
    p "${btnWarning} Oops! ${x} Something went wrong."
    br
  fi

fi

# Route for the actual search
if [[ "$#" == 1 ]]; then

  # Data file
  conf="${ROOT}/data/conf.yaml"
  # Browser
  BROWSER="$(get_yaml_item "browser" "$conf")"

  # Encode the search query for URL
  SEARCH_QUERY=$(echo "$1" | jq -sRr @uri)

  # Construct the full URL
  URL="https://www.perplexity.ai/search?q=${SEARCH_QUERY}"

  # Launch the default web browser
  "$BROWSER" "$URL"
fi
