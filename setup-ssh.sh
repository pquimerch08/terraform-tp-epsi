#!/bin/bash

echo "🔑 Configuration SSH des serveurs..."

# Définir les mots de passe
echo "root123" | docker exec -i debian-serveur1 passwd root --stdin 2>/dev/null || \
  docker exec -i debian-serveur1 sh -c 'echo "root:root123" | chpasswd'

echo "root123" | docker exec -i debian-serveur2 passwd root --stdin 2>/dev/null || \
  docker exec -i debian-serveur2 sh -c 'echo "root:root123" | chpasswd'

# Attendre que SSH soit prêt
sleep 2

# Copier les clés (avec expect pour automatiser le mot de passe)
if command -v sshpass &> /dev/null; then
  sshpass -p 'root123' ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2222 -o StrictHostKeyChecking=no root@localhost
  sshpass -p 'root123' ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2223 -o StrictHostKeyChecking=no root@localhost
else
  echo "⚠️  Installez sshpass avec: brew install hudochenkov/sshpass/sshpass"
  echo "Ou copiez manuellement les clés en entrant 'root123'"
  ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2222 root@localhost
  ssh-copy-id -i ~/.ssh/id_rsa.pub -p 2223 root@localhost
fi

echo "✅ Configuration terminée!"
ansible all -m ping
