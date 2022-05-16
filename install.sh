#!/bin/zsh

# DIRETORIO=$HOME/.ntm
ARQUIVO=$HOME/.zs

# mkdir $HOME/.ntm

# touch $ARQUIVO 

cat >> $ARQUIVO << EOF
  if [ -f ~/.zshrc_aliases ]; then
    . ~/.zshrc_aliases
  fi
EOF

# Teste o código de retorno para constatar se o arquivo foi criado ou não
if [ $? -eq 0 ]; then
  echo "ntm instalado com sucesso."
else
  echo "não foi posivel instalar o ntm"
fi

exit $?
