# SSH Config

## Setup on a new device

1. Copy the template and remove entries for hosts you don't use:
   ```sh
   cp ~/dotfiles/ssh/config.template ~/.ssh/config
   ```

2. For each host you kept, generate a key using the algorithm recommended by that host:
   ```sh
   ssh-keygen -t ed25519 -C "your@email.com" -f ~/.ssh/github_ed25519
   ```
   Repeat with a different `-f` path for each host entry. See [Key naming convention](#key-naming-convention).

3. Add each key to the SSH agent and macOS Keychain:
   ```sh
   ssh-add --apple-use-keychain ~/.ssh/github_ed25519
   ```

4. Copy the public key and add it to the respective service:
   ```sh
   cat ~/.ssh/github_ed25519.pub | pbcopy
   ```

5. Test the connection:
   ```sh
   ssh -T git@github.com
   ssh -T git@<org>-github
   ```

## Multiple accounts on the same host

The config uses a `<org>-<service>` alias pattern to support multiple accounts on the same host (e.g. two GitHub accounts).

Personal accounts use the real hostname directly, so standard URLs work without changes:
```sh
git clone git@github.com:username/repo.git
```

Org accounts use the alias as the host in the URL:
```sh
git clone git@mycompany-github:mycompany/repo.git
git remote set-url origin git@mycompany-github:mycompany/repo.git
```

## Config options explained

All entries in the template use the same five options consistently.

### `AddKeysToAgent yes`

Automatically adds the key to the running SSH agent the first time it is used. This means subsequent connections in the same session do not re-prompt for the passphrase. Silently ignored if no SSH agent is running (e.g. in CI environments).

### `UseKeychain yes`

**macOS only.** Stores the key passphrase in the macOS Keychain on first use, and retrieves it automatically on future connections — including after reboots. Without this, any key protected by a passphrase needs to be manually re-added to the agent after each reboot (because the agent loses its loaded keys on restart). Requires `AddKeysToAgent yes` to be useful: Keychain provides the passphrase → key is decrypted → added to the agent, all without prompting.


### `IdentityFile`

Points SSH to the specific private key file to use for this host. Without it, SSH falls back to trying five default filenames (`id_rsa`, `id_ecdsa`, `id_ed25519`, etc.), which breaks when you have multiple keys for different accounts.

**Important:** Unlike every other SSH config option, `IdentityFile` **accumulates** across all matching `Host` blocks instead of following first-wins. If a later `Host *` block also sets an `IdentityFile`, both keys end up in the list and SSH tries both. This is why `IdentitiesOnly yes` is essential.

### `IdentitiesOnly yes`

Tells SSH to only try the key listed in `IdentityFile`, and ignore any additional keys offered by the SSH agent. Without this, SSH tries every key loaded in the agent in sequence. On GitHub and GitLab, any valid key authenticates successfully — so if the agent has multiple keys loaded, SSH may silently authenticate as the wrong account. `IdentitiesOnly yes` prevents this.

Officially recommended by GitHub for multi-account setups.

### `PreferredAuthentications publickey`

Tells SSH to use public key authentication only, skipping other methods like password or GSSAPI. The SSH default is to try several methods in order: `gssapi-with-mic`, `hostbased`, `publickey`, `keyboard-interactive`, `password`. For git hosting services this is a minor optimization — they only accept public key auth, so the other methods would fail anyway. Setting it explicitly skips those failed attempts and makes the intent clear.

Officially recommended by GitLab. Not documented by GitHub or Bitbucket, but safe and consistent to include on all git hosting entries.

## Key naming convention

Personal keys use the SSH default names (`id_<keytype>`, e.g. `id_ed25519`). There is no reason to rename them.

Org keys use a custom name to avoid conflicts: `<org>_<service>_<keytype>`. `<keytype>` is the algorithm passed to `ssh-keygen -t` (e.g. `ed25519`, `ecdsa`, `rsa`).

Examples:
- `id_ed25519` — personal key, default name
- `mycompany_github_ed25519` — org GitHub account key
- `mycompany_gitbud_ed25519` — org key for an internal Gitbud instance
