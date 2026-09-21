# User & Email Sender — ambiente Docker

Dois serviços Spring Boot (Java 17), PostgreSQL e RabbitMQ. O Compose usa uma instância PostgreSQL compartilhada nesta configuração inicial; separe bancos e usuários antes de definir limites de acesso por serviço.

1. Copie `.env.example` para `.env` e substitua `POSTGRES_PASSWORD` e `RABBITMQ_PASSWORD` por senhas fortes. Configure `MAIL_HOST`, `MAIL_PORT`, `MAIL_USERNAME` e `MAIL_PASSWORD` para envio SMTP real; o exemplo não envia e-mails sozinho.
2. Execute `docker compose config` para conferir a configuração e `docker compose up --build -d` para construir e iniciar.
3. Confira `docker compose ps` e `docker compose logs -f user email`.

Portas locais: user `127.0.0.1:8081`, email `127.0.0.1:8082` (ajustáveis via `USER_PORT`/`EMAIL_PORT`). PostgreSQL e RabbitMQ não publicam portas no host. Para executar aplicações fora do Docker, configure acesso aos serviços de infraestrutura separadamente.

**Segurança:** não envie `.env` ao GitHub. Variáveis de ambiente e `.env` não equivalem a um gerenciador de segredos; use secrets em produção. `JPA_DDL_AUTO=update` é apenas para desenvolvimento; use migrações e `validate` em produção. Não há integração de mensagens ou endpoints implementados além do código já existente; este PR prepara a infraestrutura.
