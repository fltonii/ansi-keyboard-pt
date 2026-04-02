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

- **Apps Qt/KDE nativos** (Konsole, Kate, Dolphin etc.): funciona perfeitamente
- **Apps GTK** (Firefox, Nautilus etc.): pode funcionar dependendo do método de entrada (input method) configurado
- **Apps Electron** (VSCode, Discord etc.): **não funciona** — o Chromium usa sua própria tabela de composição interna

### Instalação

**Via AUR:**

```bash
yay -S xcompose-ansi-keyboard-ptbr
```

Depois execute o script de instalação:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/install.sh
```

**Manual:**

```bash
git clone https://github.com/fltonii/xcompose-ansi-keyboard-ptbr.git
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

- **Qt/KDE native apps** (Konsole, Kate, Dolphin etc.): works fully
- **GTK apps** (Firefox, Nautilus etc.): may work depending on the configured input method
- **Electron apps** (VSCode, Discord etc.): **does NOT work** — Chromium uses its own internal compose table

### Installation

**Via AUR:**

```bash
yay -S xcompose-ansi-keyboard-ptbr
```

Then run the install script:

```bash
/usr/share/xcompose-ansi-keyboard-ptbr/install.sh
```

**Manual:**

```bash
git clone https://github.com/fltonii/xcompose-ansi-keyboard-ptbr.git
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
