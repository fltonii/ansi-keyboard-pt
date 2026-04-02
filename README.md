# xcompose-ansi-keyboard-ptbr

## Português

### O que é

Correção da tabela de composição de teclas mortas (dead keys) no Linux para quem:

- Fala português brasileiro
- Usa teclado ANSI (padrão americano)
- Usa o layout "English (US, alt. intl.)" / "Inglês (EUA, intl. alternativo)"
- Usa KDE Wayland (também funciona no X11)
- Está acostumado com o comportamento do Mac

### Problemas que resolve

1. **ć em vez de ç**: Por padrão, `´ + c` produz ć (c com acento agudo), quando o esperado para português é **ç** (c cedilha).
2. **Contrações em inglês**: Ao digitar palavras como "I'm", `´ + m` produz um caractere acentuado obscuro em vez de simplesmente `'m`. Este pacote faz com que `´ + consoantes não usadas` produza apóstrofo + letra.

### Consoantes remapeadas

| Combinação | Padrão | Com este pacote |
|---|---|---|
| `´ + c` | ć | **ç** |
| `´ + C` | Ć | **Ç** |
| `´ + m` | ḿ | **'m** |
| `´ + n` | ń | **'n** |
| `´ + p` | ṕ | **'p** |
| `´ + r` | ŕ | **'r** |
| `´ + s` | ś | **'s** |
| `´ + t` | ť | **'t** |
| `´ + w` | ẃ | **'w** |
| `´ + y` | ý | **'y** |

(E as respectivas maiúsculas.)

### Compatibilidade

Com o Fcitx5 configurado (feito automaticamente pelo script de instalação):

- **Apps Qt/KDE nativos** (Konsole, Kate, Dolphin etc.): funciona perfeitamente
- **Apps GTK** (Firefox, Nautilus etc.): funciona perfeitamente
- **Apps Electron** (VSCode, Discord etc.): funciona perfeitamente

> **Nota:** Sem o Fcitx5, apenas apps Qt/KDE nativos funcionam. O Fcitx5 é necessário para que as sequências de composição funcionem em apps GTK e Chromium/Electron.

### Como funciona

O script de instalação faz o seguinte:

1. Copia uma tabela `~/.XCompose` personalizada com os remapeamentos de teclas mortas
2. Instala o [Fcitx5](https://fcitx-im.org/) como método de entrada do sistema — ele intercepta as teclas antes de qualquer app, fazendo o XCompose funcionar em todo lugar
3. Configura o Fcitx5 como Teclado Virtual do KDE via `kwinrc`
4. Configura o layout "English (US, alt. intl.)" no perfil do Fcitx5

### Instalação

**Via AUR (recomendado):**

```bash
yay -S xcompose-ansi-keyboard-ptbr
```

Isso instala automaticamente o Fcitx5 e as dependências. Depois execute o script de instalação:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/install.sh
```

**Manual:**

```bash
# Instale o Fcitx5 primeiro
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt

# Clone e execute o instalador
git clone https://github.com/fltonii/ansi-keyboard-pt.git
cd xcompose-ansi-keyboard-ptbr
./install.sh
```

Depois, **faça logout e login novamente**.

### Desinstalação

Se instalou via AUR:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/uninstall.sh
yay -R xcompose-ansi-keyboard-ptbr
```

Se instalou manualmente:

```bash
./uninstall.sh
```

Depois, **faça logout e login novamente**.

---

## English

### What is this

Dead key compose table fix for Linux, for people who:

- Speak Brazilian Portuguese
- Use an ANSI (US physical) keyboard
- Use the "English (US, alt. intl.)" layout
- Use KDE Wayland (also works on X11)
- Are used to Mac behavior

### Problems it solves

1. **ć instead of ç**: By default, `´ + c` produces ć (c with acute) when the expected result for Portuguese is **ç** (c cedilla).
2. **English contractions**: When typing words like "I'm", `´ + m` produces an obscure accented character instead of simply `'m`. This package makes `´ + unused consonants` produce apostrophe + letter.

### Remapped consonants

| Combination | Default | With this package |
|---|---|---|
| `´ + c` | ć | **ç** |
| `´ + C` | Ć | **Ç** |
| `´ + m` | ḿ | **'m** |
| `´ + n` | ń | **'n** |
| `´ + p` | ṕ | **'p** |
| `´ + r` | ŕ | **'r** |
| `´ + s` | ś | **'s** |
| `´ + t` | ť | **'t** |
| `´ + w` | ẃ | **'w** |
| `´ + y` | ý | **'y** |

(And their uppercase counterparts.)

### Compatibility

With Fcitx5 configured (done automatically by the install script):

- **Qt/KDE native apps** (Konsole, Kate, Dolphin etc.): works fully
- **GTK apps** (Firefox, Nautilus etc.): works fully
- **Electron apps** (VSCode, Discord etc.): works fully

> **Note:** Without Fcitx5, only Qt/KDE native apps work. Fcitx5 is required for compose sequences to work in GTK and Chromium/Electron apps.

### How it works

The install script does the following:

1. Copies a custom `~/.XCompose` table with the dead key remappings
2. Sets up [Fcitx5](https://fcitx-im.org/) as the system input method — it intercepts key events before any app sees them, making XCompose work everywhere
3. Configures Fcitx5 as the KDE Virtual Keyboard via `kwinrc`
4. Sets the "English (US, alt. intl.)" layout in the Fcitx5 profile

### Installation

**Via AUR (recommended):**

```bash
yay -S xcompose-ansi-keyboard-ptbr
```

This automatically installs Fcitx5 and dependencies. Then run the install script:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/install.sh
```

**Manual:**

```bash
# Install Fcitx5 first
sudo pacman -S fcitx5 fcitx5-configtool fcitx5-gtk fcitx5-qt

# Clone and run the installer
git clone https://github.com/fltonii/ansi-keyboard-pt.git
cd xcompose-ansi-keyboard-ptbr
./install.sh
```

Then **log out and log back in**.

### Uninstall

If installed via AUR:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/uninstall.sh
yay -R xcompose-ansi-keyboard-ptbr
```

If installed manually:

```bash
./uninstall.sh
```

Then **log out and log back in**.

---

## Contributing

Contributions are welcome! Open an issue or submit a pull request.

## License

MIT — see [LICENSE](LICENSE).
