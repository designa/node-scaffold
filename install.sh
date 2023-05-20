#!/bin/bash

# Move o script para /usr/local/bin
sudo mv designa-create.sh /usr/local/bin/designa-create

# Define as permissões de execução
sudo chmod +x /usr/local/bin/designa-create

# Exibe uma mensagem de conclusão
echo "O script designa-create foi instalado com sucesso em /usr/local/bin."
