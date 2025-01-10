use "std/fmt"

# @description Main function
# Content for when the script is called
#+with no Arguments or Flags.
main() {

  h1 " --= Ask AI =--"
  hr "Sh:erpa" "-"
  br
  h1 "Search something with Perplexity AI"
  br
  p "Usage: ${em}${txtBlue}aai${x} \"My question here\"${x}"
  br

}

# Calling the main() function
if [[ "$#" == 0 ]]; then
  main
  exit 0
fi

# Route for the actual search
if [[ "$#" == 1 ]]; then
  # Browser
  readonly BROWSER="/mnt/e/Programmes/Vivaldi/Application/vivaldi.exe"

  # Encode the search query for URL
  SEARCH_QUERY=$(echo "$1" | jq -sRr @uri)

  # Construct the full URL
  URL="https://www.perplexity.ai/search?q=${SEARCH_QUERY}"

  # Launch the default web browser
  "$BROWSER" "$URL"
fi
