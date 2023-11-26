#!/bin/bash

#local de armazenamento dos logs
NFS_DIRETORIO="/nfs_server/jonata_nery"

#nome do serviço
SERVICO="httpd"

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

#passa a data exata de quando o script foi executado pra uma constante
DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

#cria o arquivo de saida com informaçoes
echo "Data/Hora: $DATA_HORA" > "$ARQUIVO_SAIDA"
echo "Serviço: $SERVICO" >> "$ARQUIVO_SAIDA"
echo "Status: $STATUS" >> "$ARQUIVO_SAIDA"
echo "Mensagem: $mensagem" >> "$ARQUIVO_SAIDA"
echo "  "

