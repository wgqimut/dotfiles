if [[ ! -f "${HOME}/.env" ]]; then
    echo "Error, we should have ${HOME}/.env"
    exit 1
fi

source ${HOME}/.env

if [[ ${OS} == 'Darwin' ]]; then
    # Even this file should't set env variable, but we have to do set PATH in here.
    set_path
fi
