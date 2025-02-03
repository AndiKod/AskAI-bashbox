# @file AskAI bashbox

# ------------------------------- #
#   Options -flags with GetOpts   #
# ------------------------------- #


# Function to display help text
usage() {

  h1 " $(package "name")"
  hr "BashBox" "-"
  if [[ -n "$(package "description")" ]]; then
    p "$(package "description")"
    br
  fi
  h2 "Usage"
  p "$(package "executable") [options] <command> <arguments>"
  br
  h2 "Options"
  p "  -h | --help       Display the usage message"
  p "  -v | --version    Display script Version."
  br
  h2 "Commands"
  p "* $(package "executable") : The home screen"
  p "* $(package "executable") setBrowser <app or path> : Set the browser to use"
  p "* $(package "executable") <query> : Search with Perplexity AI"
  if [[ -n "$(package "repo")" ]]; then
    br
    p "Repo: ${link}$(package "repo")${x}"
    br
  fi

}

while getopts ":hvVq-:" opt; do
  case $opt in
  h)
    # Display the help/usage text from above
    usage
    exit 0
    ;;
  v)
    # -v short flag for version.
    br
    p "${strong}${txtPrimary}$(package "name")${x}: ${em}v$(package "version")${x}"
    br
    exit 0
    ;;
  V)
    # -V flag activating vebose mode
    # [[ "$verbose" == 1 ]] && echo "Chatty stuff"
    verbose=1
    exit 0
    ;;
  q)
    # -q flag activating quiet mode
    # [[ "$quiet" != 1 ]] && echo "Reasonable stuff"
    quiet=1
    exit 0
    ;;
  -)
    # Workaround to make GetOpts
    #+mimic the --longFlags usage,
    case "${OPTARG}" in
    # --help
    help)
      usage
      exit 0
      ;;
    # --version
    version)
      br
      p "${strong}${txtPrimary}$(package "name")${x}: ${em}v$(package "version")${x}"
      br
      exit 0
      ;;
    # --verbose
    verbose)
      verbose=1
      exit 0
      ;;
    # --quiet
    quiet)
      usage
      exit 0
      ;;
    *)
      # Long flags Error handling
      echo "Unknown option --${OPTARG}" >&2
      exit 1
      ;;
    esac
    ;;
  \?)
    # Short flags Error handling
    echo "Invalid option: -$OPTARG" >&2
    exit 1
    ;;
  :)
    # Missing required argument Error handling
    echo "Option -$OPTARG requires an argument." >&2
    exit 1
    ;;
  esac
done
# Removing the flags from the flow
shift $((OPTIND - 1))
