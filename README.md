# Djangodock

### Get started

    mkdir myproject && cd "$_"
    git init
    git submodule add https://github.com/czbas23/djangodock.git
    cd djangodock
    cp env_example .env
    sh startproject.sh myproject
    docker-compose up --build nginx django postgres

\* Set up the project by editing the .env file and restarting it.
\* If you already have a project, skip step <code>sh startproject.sh myproject</code>
