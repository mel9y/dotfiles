# Added SSH AUTH SOCK
SSH_AUTH_SOCK="$(/opt/homebrew/bin/gpgconf --list-dirs agent-ssh-socket)"

# Added by Toolbox App
export PATH="$PATH:/Users/m2en/Library/Application Support/JetBrains/Toolbox/scripts"

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added JAVA_HOME
export JAVA_HOME=`/usr/libexec/java_home -v 17`
# export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

# Added Deno path
export DENO_INSTALL="/Users/m2en/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
