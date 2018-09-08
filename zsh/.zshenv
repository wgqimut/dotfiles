# this file should ony set env variable. 

if [[ ! -f "${HOME}/.env" ]]; then
    echo "Error, we should have ${HOME}/.env"
    exit 1
fi

source ${HOME}/.env

if [[ $OS == 'Darwin' ]]; then
    # this is so complicate, macOS have a system file /etc/zprofile, that exec `path_helpers`, 
    # it will set /etc/paths.d/* and /etc/paths's path in front of PATH, this is too bad.
    # but /etc/zprofile is be exected when shell is a login, so when we a login shell, we should't set PATH in this file (.zshenv)
    # we should set PATH in ${HOME}/.zprofile (this file is be exected when shell is a login file)
    if [[ ! -o login ]]; then
        set_path
    fi

    # for new brew openssl curl
    export LDFLAGS="-L/usr/local/opt/curl/lib"
    export CPPFLAGS="-I/usr/local/opt/curl/include"
    export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
else
    set_path
 fi

 # for emacs
 export ALTERNATE_EDITOR=""
 export EDITOR=emacsclient

 # for proxy
# export all_proxy=127.0.0.1:1086/
# export ALL_PROXY=127.0.0.1:1086/
