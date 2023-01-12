# Likrura

#### likrura is Kucqit Word for encryption
this project made for privacy and user security

## Installation

```
git clone https://github.com/KucingMunafik/likrura.git
ln -s "$PWD"/likrura/likrura.bash /usr/local/bin/likrura
```

### Bash tab completion

Add `tools/likrura-bash-completion.bash` to your tab completion file directory.

## API/Commands

### encrypt

> encrypt \<file\> - Encryptes file with OpenSSL AES-256 cipher block chaining. Writes an encrypted file out *(ciphertext)* appending `.aes` extension.

```
➜ likru kru ./secret-file
enter aes-256-cbc encryption password:
Verifying - enter aes-256-cbc encryption password:
```

```
➜ ls -alh
-rw-r--r--  1 user  group   1.0G Oct  1 13:33 secret-file
-rw-r--r--  1 user  group   1.0G Oct  1 13:34 secret-file.aes
```

You may optionally define the password to use when encrypting using the `CRYPTR_PASSWORD` environment variable. This enables non-interactive/batch operations.

```
➜ LIKRU_PASSWORD=A1EO7S9SsQYcPChOr47n cryptr encrypt ./secret-file
```

### decrypt

> decrypt \<file.aes\> - Decrypt encrypted file using OpenSSL AES-256 cipher block chaining. Writes a decrypted file out *(plaintext)* removing `.aes` extension.

```
➜ ls -alh
-rw-r--r--  1 user  group   1.0G Oct  1 13:34 secret-file.aes
```

```
➜ likru dru ./secret-file.aes
enter aes-256-cbc decryption password:
```

```
➜ ls -alh
-rw-r--r--  1 user  group   1.0G Oct  1 13:35 secret-file
-rw-r--r--  1 user  group   1.0G Oct  1 13:34 secret-file.aes
```

You may optionally define the password to use when decrypting using the `CRYPTR_PASSWORD` environment variable. This enables non-interactive/batch operations.

```
➜ LIKRU_PASSWORD=A1EO7S9SsQYcPChOr47n cryptr decrypt ./secret-file.aes
```

### help

> help - Displays help

```
➜ likru help
Usage: likru command <command-specific-options>

  kru <file>       Encrypt file
  dru <file.aes>   Decrypt encrypted file
  help                 Displays help
  version              Displays the current version

```

### version

> version - Displays the current version

```
➜ likru version
likrura 1.0.0
```

### default

> default - Displays the current version and help

```
➜ likru
likrura 1.0.0

Usage: likru command <command-specific-options>

  kru <file>       Encrypt file
  dru <file.aes>   Decrypt encrypted file
  help                 Displays help
  version              Displays the current version

```
