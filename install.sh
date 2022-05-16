#!/bin/bash

DIRETORIO=$HOME/.ntm
ARQUIVO=$HOME/.ntm/ntm_aliases

mkdir $HOME/.ntm

touch $ARQUIVO 

cat > $ARQUIVO << EOF
  # variaveis
  ts='-ts'
  urlTemplate='https://github.com/RENATOADORNO/ntm-api-template-standard/archive/refs/heads/template-standard.zip'
  urlTemplateTs='https://github.com/RENATOADORNO/ntm-api-template-standard/archive/refs/heads/template-standard-ts.zip'
  nameZip='main.zip'
  nameTemplate='ntm-api-template-standard-template-standard'
  nameTemplateTs='ntm-api-template-standard-template-standard-ts'
  defaultName='my-node-project'

  # Node Model Manager
  # Use: "$0" "$1" "$2"
  ntm() {
    # Use: ntm 
    if [ -z "$1" ] && [ -z "$2" ]
    then
      echo "Please specify the project directory: ntm <project-directory>"
      echo "For example: ntm my-node-project"
    fi

    # com 1 parametro ---------------------------------------------------------------------

    # Use: ntm -ts
    if [ -n "$1" ] && [ -z "$2" ] && [ $ts = "$1" ]
    then
      wget -O $nameZip $urlTemplateTs && unzip $nameZip && mv $nameTemplateTs $defaultName
    fi

    # Use: ntm new-node-template
    if [ -n "$1" ] && [ -z "$2" ] && [ $ts != "$1" ]
    then
      wget -O $nameZip $urlTemplate 
      unzip $nameZip
      mv $nameTemplate "$1"
      cd "$1"
      npm i
      cd ..
    fi

    # com 2 parametros ----------------------------------------------------------------------

    # Use: ntm -ts new-node-template
    if [ -n "$1" ] && [ -n "$2" ] && [ $ts = "$1" ] && [ $ts != "$2" ]
    then
      wget -O $nameZip $urlTemplateTs && unzip $nameZip && mv $nameTemplateTs "$2"
    fi

    # Use: ntm new-node-template -ts
    if [ -n "$1" ] && [ -n "$2" ] && [ $ts != "$1" ] && [ $ts = "$2" ]
    then
      wget -O $nameZip $urlTemplateTs && unzip $nameZip && mv $nameTemplateTs "$1"
    fi

    # verifica nameZip e apaga ---------------------------------------------------------------------------
    if [ -f $nameZip ]
    then
      rm $nameZip
    fi
  }
EOF

# Teste o código de retorno para constatar se o arquivo foi criado ou não
if [ $? -eq 0 ]; then
  echo "ntm instalado com sucesso."
else
  echo "não foi posivel instalar o ntm"
fi

exit $?
