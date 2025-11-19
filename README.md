# Likrura

#### likrura is Kucqit Word for encryption
this project made for privacy and user security

# likrura

**likrura** is a simple Bash script for file encryption and decryption using OpenSSL with AES-256-CBC.  
You will be securely prompted for your password each time you encrypt or decrypt a file—no passwords are stored in environment variables or on disk.

---

## ✨ Features

- **Encrypt any file** with strong AES-256-CBC encryption.
- **Decrypt previously encrypted files**.
- **No password stored:** Prompted interactively each time.
- **Simple CLI usage:** Just type `likrura encrypt <file>` or `likrura decrypt <file.aes>`.
- **Cross-platform:** Works on Linux, macOS, and WSL.

---

## 🚧 About this

This is a **updated version** of [rakutatusan/likrura](https://github.com/rakutatusan/likrura), which has been unmaintained for 3 years.  
Major improvements:
- Modernized password handling (no environment variables needed)
- User-friendly command structure and help
- Easy installation script

---

## 🛠️ Installation

You can install and set up everything with one command:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/fogoffaith/likrura/main/install.sh)
```

This will:
- Install `openssl` if needed
- Copy `likrura.sh` as `likrura` to `/usr/local/bin`
- Make it executable

---

## 📦 Manual Installation

1. **Install OpenSSL**

   - Ubuntu/Debian: `sudo apt install openssl`
   - Fedora: `sudo dnf install openssl`
   - macOS (Homebrew): `brew install openssl`

2. **Make the script executable:**

   ```bash
   chmod +x likrura.sh
   ```

3. **Copy it to your PATH:**

   ```bash
   sudo cp likrura.sh /usr/local/bin/likrura
   ```

---

## 🚀 Usage

### Encrypt a file

```bash
likrura encrypt myfile.txt
```
- Prompts for password and confirmation.
- Creates `myfile.txt.aes`.

### Decrypt a file

```bash
likrura decrypt myfile.txt.aes
```
- Prompts for password.
- Restores `myfile.txt`.

### Help

```bash
likrura help
```

### Version

```bash
likrura version
```

---

## 🔒 Notes

- Always remember your password! Lost passwords **cannot** be recovered.
- AES-256-CBC provides confidentiality but not integrity. For maximum security, consider using additional HMAC or authenticated encryption modes.

---

## 📜 License

MIT (see original repo for details)

---

## 🙏 Credits

- Forked from [rakutatusan/likrura](https://github.com/rakutatusan/likrura)

```
