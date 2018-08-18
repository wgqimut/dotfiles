if [[ $platform == 'Darwin' ]]; then
    export PATH=/usr/local/sbin:$/Library/Frameworks/Python.framework/Versions/3.4/bin:PATH:$HOME/scripts
    export PATH=/usr/local/mysql/bin:$PATH
    export PATH=$PATH:/usr/local/opt/go/libexec/bin
    export PATH=/Users/ilbsmart/.local/bin:$PATH
    export PATH=/usr/local/go/bin:$PATH
    export GOPATH=$HOME/Workspace/go_work
    export DYLD_LIBRARY_PATH=/usr/local/mysql/lib/
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi
