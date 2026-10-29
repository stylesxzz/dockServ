# Instalação rápida do DockServ

## 1. Clonar o projeto

```bash
sudo apt update
sudo apt install -y git
git clone https://github.com/stylesxzz/dockServ.git
cd dockServ
```

## 2. Iniciar os serviços

Instale Docker Engine e o plugin Docker Compose pelo repositório oficial antes de continuar.

```bash
cp .env.example .env
nano .env
chmod 600 .env
bash scripts/setup.sh
```

## 3. Baixar modelo e testar API

```bash
bash scripts/install-model.sh qwen2.5:3b
curl http://127.0.0.1:11434/v1/chat/completions -H 'Content-Type: application/json' -d '{"model":"qwen2.5:3b","messages":[{"role":"user","content":"DockServ funcionando?"}],"stream":false}'
```

## 4. Interfaces locais

- Open WebUI: http://127.0.0.1:3000
- Site estático: http://127.0.0.1:8081
- App Node: http://127.0.0.1:3002
- File Browser: http://127.0.0.1:8080

Acesso remoto a um painel via SSH tunnel:

```bash
ssh -L 3000:127.0.0.1:3000 usuario@IP_DO_SERVIDOR
```

Depois abra http://127.0.0.1:3000 no computador cliente.

## 5. Operação

```bash
docker compose ps
docker compose logs -f --tail=100
docker compose restart
docker compose down
bash scripts/backup.sh
```

**Não use `docker compose down -v`** se quiser preservar os volumes nomeados.
Não exponha as portas administrativas no roteador. Use Tailscale para acesso remoto privado.
