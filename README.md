# Dotfiles setup using Ansible

## Run the playbook

```bash
npm run setup -- all

# only specific tags:
npm run setup -- common git
```

## Ansible Development

```bash
npm run setup-dev
```

### Run tests

```bash
ansible-playbook roles/<name>/tests/test.yml --connection=local
```
