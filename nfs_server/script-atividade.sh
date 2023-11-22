#!/bin/bash

#local de armazenamento dos logs
NFS_DIRETORIO="/nfs_server/jonata_nery"

#nome do serviço
SERVICO="nfs-server"

#verifica o status do serviço
STATUS=$(systemctl is-active $SERVICO)

#mensagem do status de serviço 
if [ "$STATUS" = "active" ];then
	mensagem="Online"
	ARQUIVO_SAIDA="$NFS_DIRETORIO/${SERVICO}_online.txt"
else
	mensagem="Offline"
	ARQUIVO_SAIDA="$NFS_DIRETORIO/${SERVICO}_offline.txt"
fi

#cria o arquivo de saida com informaçoes
echo "Serviço: $SERVICO" >> "$ARQUIVO_SAIDA"
echo "Status: $STATUS" >> "$ARQUIVO_SAIDA"
echo "Mensagem: $mensagem" >> "$ARQUIVO_SAIDA"

