# ❄️ NixOS Jonwin

Welcome to my NixOS configuration.

![screenshot](./screenshots/screenshot1.png)

## ✨ Features

- 🖥️ **Multiple Hosts Support**: Easy to configure for different hosts.
- 🪟 **Hyprland + Waybar**: Highly configurable window compositor on Wayland.
- 🏠 **Home Manager Integration**: Manage user-specific configurations with ease.
- 🐚 **Zsh + Starship**: Efficient shell setup with lots of aliases.
- 👻 **Ghostty**: Fast and feature-rich terminal emulator.
- ✍️ **Neovim**: The best editor.
- 🔑 **Yubikey Login**: Fast and secure authentication with Yubikeys.

## 🚀 Installation

To get started with this setup, follow these steps:

1. **Install NixOS**  
   If you haven’t already installed NixOS, follow the [NixOS Installation Guide](https://nixos.org/manual/nixos/stable/#sec-installation) for detailed instructions.

2. **Clone the Repository**  

    ```bash
    git clone https://github.com/jonwin1/nixos-jonwin
    cd nixos-jonwin
    ```

3. **Copy one of the host configurations to set up your own**  

    ```bash
    cp -r nixos/desktop nixos/<your_hostname>
    cp -r home-manager/desktop home-manager/<your_hostname>
    ```

4. **Put your `hardware-configuration.nix` file there**  

    ```bash
    cp /etc/nixos/hardware-configuration.nix nixos/<your_hostname>/
    ```

5. **Edit the configuration files as needed**  
   - `nixos/<your_hostname>/`
   - `home-manager/<your_hostname>/`
   - `home-manager/home-packages.nix`

6. **Edit `home-manager/modules/git.nix`**  

    ```bash
    nano home-manager/modules/git.nix
    ```

7. **Edit `default.nix` files**  

    ```bash
    nano nixos/modules/default.nix
    nano home-manager/modules/default.nix
    ```

8. **Add a Yubikey or disable the module**  
   See [NixOS Wiki - Yubikey PAM U2F](https://wiki.nixos.org/wiki/Yubikey#pam_u2f) or edit `nixos/modules/default.nix` accordingly.

9. **Edit the `flake.nix` file**  

    ```diff
    ...
    let
      system = "x86_64-linux";
    --  user = "jonwin";
    ++  user = "<your_username>";
      hosts = [
    --    { hostname = "desktop"; }
    --    { hostname = "laptop"; }
    ++    { hostname = "<your_hostname>"; }
      ];
    ...
    ```

10. **Rebuild**  

    ```bash
    cd nixos-jonwin
    git add .
    sudo nixos-rebuild switch --flake .#<hostname>
    # or, if you're installing on a fresh system:
    sudo nixos-install --flake .#<hostname>
    home-manager switch --flake .
    ```

    After the first install, `nh` (Nix Helper) is installed and you can rebuild with:

    ```bash
    nh os switch .
    nh home switch .
    ```

    See [nix-community/nh](https://github.com/nix-community/nh) for more options.

## 📂 File Structure

```markdown
📂 .
┣ ❄️ flake.nix
┣ 📂 home-manager/
┃ ┣ 📂 <hostname>/
┃ ┃ ┣ ❄️ home.nix
┃ ┃ ┗ ❄️ local-packages.nix
┃ ┣ ❄️ home-packages.nix
┃ ┗ 📂 modules/
┃   ┗ …
┗ 📂 nixos/
  ┣ 📂 <hostname>/
  ┃ ┣ ❄️ configuration.nix
  ┃ ┗ ❄️ hardware-configuration.nix
  ┗ 📂 modules/
    ┗ …
```

## 🤝 Contributions

Feel free to fork the repository and submit pull requests if you'd like to contribute improvements. Open issues if you encounter any problems with the config or have ideas for new features.

## 📜 License

This project is licensed under the GPL-3.0 License. See the [LICENSE](LICENSE) file for details.

---

The latest rewrite of this config is based on [Andrey0189's NixOS Config Reborn](https://github.com/Andrey0189/nixos-config-reborn).
