# eisp_authentik

Docker Compose setup that runs **authentik**, the self-hosted identity provider (IdP) at the center of the Enterprise Identity Security Platform (EISP). authentik provides single sign-on (SAML 2.0 and OpenID Connect), multi-factor authentication, and SCIM provisioning for the rest of the platform.

## Contents

| File | What it is |
|------|------------|
| `docker-compose.yml` | Defines the three services that make up authentik. |
| `.env` | Local settings and secrets read by the compose file. **Keep this private** (see Security notes). |

## Services

| Service | Image | Purpose |
|---------|-------|---------|
| `postgresql` | `postgres:16-alpine` | Database for authentik. Data lives in a named Docker volume (`database`) and the service has a health check. |
| `server` | `ghcr.io/goauthentik/server` (default tag `2026.2.2`) | The authentik web and API server. Exposes HTTP on port `9000` and HTTPS on `9443`. |
| `worker` | same authentik image | Runs background tasks. Mounts the Docker socket and `./certs`. |

The server and worker start only after PostgreSQL reports healthy.

## Configuration

Settings are read from `.env`.

| Variable | Required | Default | Meaning |
|----------|----------|---------|---------|
| `PG_PASS` | Yes | none | Database password. |
| `AUTHENTIK_SECRET_KEY` | Yes | none | Secret key authentik uses for signing and encryption. |
| `PG_DB` | No | `authentik` | Database name. |
| `PG_USER` | No | `authentik` | Database user. |
| `AUTHENTIK_IMAGE` / `AUTHENTIK_TAG` | No | `ghcr.io/goauthentik/server` / `2026.2.2` | Image and version to run. |
| `COMPOSE_PORT_HTTP` / `COMPOSE_PORT_HTTPS` | No | `9000` / `9443` | Host ports for the web interface. |

The compose file refuses to start if `PG_PASS` or `AUTHENTIK_SECRET_KEY` is missing.

## Running it

```bash
docker compose up -d
```

Then open `http://localhost:9000/if/flow/initial-setup/` to create the first administrator account. Folders `data/`, `certs/`, and `custom-templates/` are created next to the compose file when the containers first start.

To stop everything: `docker compose down` (add `-v` to also delete the database volume).

## Role in the EISP project

The functional requirements for this component (FR-IDP-01 to FR-IDP-06 in `semester3/EISP_FRD_v1.docx`) are: deployment, user directory management, SSO over SAML 2.0, SSO over OpenID Connect, MFA enforcement, and SCIM provisioning. authentik then federates into AWS IAM. See the architecture diagram in [`../semester3`](../semester3).

## Security notes

- `.env` contains secrets. Do not share it, paste it into chats, or publish it. If it has ever been committed to a public repository, treat those values as exposed and change them.
- The worker mounts the Docker socket (`/var/run/docker.sock`) and runs as root, which is authentik's standard setup for managing outposts. It gives that container broad control of the host, so run this only on a machine you trust.

## Related folders

- [`../semester3`](../semester3): requirements, IAM policies, diagrams, and risk register for the EISP project.
