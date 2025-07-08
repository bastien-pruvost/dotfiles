# Dotfiles

This repository is managed with [chezmoi](https://github.com/twpayne/chezmoi) and contains configuration files for my development environment.

> [!NOTE]
> My dev environment is focused on web, mobile and software development, it suits my needs and preferences.  
> You can use this repository as a reference or as a starting point for your own dotfiles.  
> It's up to you to decide what you want to keep or remove and make the necessary adjustments to suit your needs.

# Installation guide

## Introduction

This README is an opinionated guide to install a clean MacOS development environment.

> [!IMPORTANT]
> Everytime you are prompted to setup a passphrase or password, make sure to use a strong and secure one and store it in a secure place.  
> Password managers are a good option to generate and store secure passwords.

## Setting up MacOS names

1. **During MacOS setup**

   - Choose a short, lowercase username.

     _Example: `john`_ → creates `/Users/john`

   - Choose a descriptive, lowercase computer name.

     _Example: `john-personal-mbp`_

2. **After MacOS setup**

   - Settings > General > About > Name = john-personal-mbp

   - Settings > General > Sharing > LocalHostName = john-personal-mbp

   - Set all names explicitly via Terminal:

     ```bash
     sudo scutil --set ComputerName "john-personal-mbp"
     sudo scutil --set LocalHostName "john-personal-mbp"
     sudo scutil --set HostName "john-personal-mbp"
     ```

   - Restart you mac.
   - Set up internet connection (Wi-Fi or Ethernet).
   - Configure user information and password:
     - _Settings > Users & Groups_
     - _Settings > [Your Name] (Apple ID)_

4. **Double-check/set names in:**
   - _Settings > General > About > Name_ (ComputerName).
   - _Settings > General > Sharing_ (LocalHostName).
   - Make sure all file sharing are disabled.
   - Restart you mac.

## Set the default finder view

1. Open Finder.
2. Set the preferred view (List, Column, etc.)
3. Go to `View > Show view options`.
4. Check "Always open in [selected] view".
5. Click "Use as Defaults" (applies to all folders of the same kind).
6. Optional: Reset finder preferences:

   ```bash
   defaults delete com.apple.finder
   killall Finder
   ```

## Update MacOS and App Store apps

1. Update macOS to the latest stable version _(optional but recommended) with the following command_:

   ⚠️ **_Avoid updating if the latest version is newly released and potentially unstable._**

   ```bash
   sudo softwareupdate --install --recommended --restart
   ```

2. Update all App Store apps manually, and delete unused apps if needed _(optional but recommended)._

## Agree to license

`sudo softwareupdate --agree-to-license --install-rosetta`

## MacOS system settings

- System Settings
  - User (Apple Account)
    - Check personal infos
    - Setup iCloud sync (disable most options)
    - etc.
  - Wi-Fi
    - Ask to join hotspots > off
  - General
    - Software Updates
      - Disable all automatic updates (except Security Responses)
    - AutoFill & Passwords
      - Check AutoFill from ? Bitwarden ? after BW install
  - Accessibility
    - Pointer Control > Trackpad options > Scroll speed > 5/7
    - Pointer Control > Mouse options > Scroll speed > 5/7
  - Appearance
    - Auto
    - Show Scroll Bars > "Always"
  - Apple Intelligence & Siri
    - Turn off both
  - Control Center
    - Battery > Show Percentage
    - Spotlight > Don't show in Menu Bar
  - Desktop & Dock
    - Dock
      - _Remove all applications from Dock_
      - Adjust dock size (smaller)
      - Minimize windows using > "Scale Effect"
      - Double-click a window's title bar to > "Do nothing"
      - Minimize windows into application icon > on
      - Automatically hide an show the dock > on
      - Show suggested and recent apps in Dock -> off
    - Windows
      - Drag windows to screen edges to tile > off
      - Drag windows to menu bar to fill screen > off
      - Hold ⌥ key while dragging windows to tile > off
    - Mission Control
      - Automatically rearrange Spaces based on most recent use > off
      - Drag windows to top of screento enter Mission Control > off
    - Hot Corners > Disable all
  - Displays
    - True Tone > off
  - Spotlight
    - Help Apple Improve Search > off
  - Sound
    - Play sound on startup > off
  - Security
    - Touch ID
  - Notifications
    - Disable most app notifications
  - Lock Screen
    - Screen saver > 2 minutes
    - Display off on battery > 2 minutes
    - Display off on power > 10 minutes
    - Require password after > 5 minutes
    - Show large clock > "On Screen saver and Lock screen"
  - Privacy & Security
    - Location Services
      - Siri > off
      - System Services
        - Suggestions & Search > off
        - Mac Analytics > off
    - Apple Intelligence Report > off
    - FileVault > On
  - Touch ID & Password
    - Set 3 fingers
  - Game Center > Sign Out
  - Wallet & Apple Pay
    - Setup if needed
  - Keyboard
    - Key repeat rate > Maximum (fast)
    - Delay until repeat > Maximum (short)
    - Press 'globe' key to > "Do nothing"
    - Keyboard shortcuts
      - Mission Control > Mission Control > Turn off everything
      - Spotlight > Turn off everything
    - Text input > Add "French - Numerical"
    - Text input > Edit > All input sources
      - Correct spelling > off
      - Capitalize words > off
      - Show inline predictive text > off
      - Add period with double-space > off
      - Use smart quotes and dashes > off
      - For double quotes > `"`
      - For single quotes > `'`
  - Trackpad
    - Point & Click
      - Tracking speed > 7/9
      - Click > "Light"
      - Look up & data detectors > off
      - Tap to Click > on
    - Scroll & Zoom
      - Smart zoom > off
- Finder > Settings
  - General
    - Show these items on the desktop: disable all
    - New Finder windows show: [User]
  - Tags
    - Disable all Tags
  - Sidebar:
    - Activate Recents, Desktop, Documents, Downloads, [User]
    - Disable all iCloud
    - Activate all locations except [Computer]
    - Move Dev to Favorites in Sidebar
    - Disable all Tags
  - Advanced
    - Show all filename extensions > on
    - Keep folders on top
      - In windows when sorting by name > on
      - On Desktop > on
    - When performing a search > "Search Current Folder"
- Finder > View
  - Show Preview
 
## Install Command Line Tools

Install the Command Line Tools with the following command:

```bash
xcode-select --install
```

## Initialize `chezmoi` and sync dotfiles

It will :

- Sync dotfiles
- Set some defaults settings
- Install Homebrew and all packages from Brewfile
- Install Xcode Command Line Tools

Initialize chezmoi with this command:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

## Setup SSH Key for Github

[Github documentation on SSH Keys](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)

### Generate a new SSH Key

1. Generate a new SSH Key named “github_personal”:

   ```bash
   mkdir -p ~/.ssh
   cd ~/.ssh
   ssh-keygen -t ed25519 -C "github_personal" -f "github_personal"

   # When prompted, enter a strong passphrase for more security
   ```

2. Add the key in the ~/.ssh/config file to assign it to github.com host:

   ```bash
   echo "\nHost github.com\nAddKeysToAgent yes\nUseKeychain yes\nIdentityFile ~/.ssh/github_personal" >> ~/.ssh/config
   ```

3. Add the SSH Key in the Apple Keychain

   ```bash
   ssh-add --apple-use-keychain ~/.ssh/github_personal
   ```

### Add the SSH Key to your Github account

1. Copy the **public** Key with the following command:

   ```bash
   cat ~/.ssh/github_personal.pub | pbcopy
   ```

2. Go to the [Add new SSH Key](https://github.com/settings/ssh/new) page on Github, and fill the SSH Key informations:

   ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/4bbd5c81-65df-4417-ad07-662f9cfb14a7/de699761-ae46-4ec6-9567-15fd6ba83c58/image.png)

   - Title = “Personal Macbook Pro” (or whatever you want)
   - Key Type = ”Authentication Key”
   - Key = [Paste the key] (copied just before with `pbcopy`)

3. Click on **Add SSH Key**, and if prompted, confirm access to your account on GitHub.

### Verify the SSH Connexion

Now the SSH Key should be configured correctly.

1. Execute the following command to test SSH Connexion on Github:

   ```bash
   ssh -T git@github.com
   ```

2. You may see a warning like this:

   ```
   The authenticity of host 'github.com (IP ADDRESS)' can't be established.
   ED25519 key fingerprint is SHA256:xxxxxxxxxxxx

   Are you sure you want to continue connecting (yes/no)?
   ```

   Verify that the fingerprint in the message you see matches [GitHub's public key fingerprint](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints). If it does, then type `yes` and press Enter.

3. Now you should see the following message:

   ```bash
   Hi USERNAME! You've successfully authenticated,
   but GitHub does not provide shell access.
   ```

   - If the resulting message contains your username ⇒ Everything is ok !
   - If you receive a "permission denied" message ⇒ See [Error: Permission denied (publickey)](https://docs.github.com/en/authentication/troubleshooting-ssh/error-permission-denied-publickey).

## Setup GPG Key for Github (optional but recommended)

GPG Keys are used to sign Github commits, they increase security and guarantee that you are the author of the commits.

[Github documentation on GPG Keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key#generating-a-gpg-key)

### Generate a new GPG Key

1. Install gnupg homebrew package to manage GPG Keys:

   ```bash
   brew install gnupg
   ```

2. Generate a new GPG Key:

   ```bash
   gpg --full-generate-key

   # When prompted for key type, select RSA
   # When prompted for key size, select 4096
   # When prompted for expiration, select no expiration
   # When prompted for user informations, enter your github Name and Email
   # When prompted for passphrase, enter a strong passphrase for more security
   ```

3. List the keys:

   ```bash
   gpg --list-secret-keys --keyid-format=long
   ```

4. From the list of GPG Keys, copy the long form of the GPG Key ID you'd like to use. In this example, the GPG Key ID is `3AA5C34371567BD2`:

   ```
   /Users/hubot/.gnupg/secring.gpg
   ------------------------------------
   sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
   uid                          Hubot <hubot@example.com>
   ssb   4096R/4BB6D45482678BE3 2016-03-10
   ```

### Add the GPG Key to your Github account

1. Copy the GPG Key with the following command (replace the key ID with your own, ID from the previous step):

   ```bash
   gpg --armor --export 3AA5C34371567BD2 | pbcopy
   ```

2. Go to the [Add new GPG Key](https://github.com/settings/gpg/new) page on Github, and fill the GPG Key informations:

   ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/4bbd5c81-65df-4417-ad07-662f9cfb14a7/4f5e706a-5556-4cb5-974a-f0513f81331a/image.png)

   - Title = “Personal Macbook Pro” (or whatever you want)
   - Key = [Paste the key] (copied just before with `pbcopy`)

3. Click on **Add GPG Key**, and if prompted, confirm access to your account on GitHub.

### Add GPG Key to your local git

1. If you have previously configured Git to use a different key format, unset this configuration so the default format of `openpgp` will be used:

   ```bash
   git config --global --unset gpg.format
   ```

2. List the GPG keys:

   ```bash
   gpg --list-secret-keys --keyid-format=long
   ```

3. From the list of GPG keys, copy the long form of the GPG key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

   ```
   /Users/hubot/.gnupg/secring.gpg
   ------------------------------------
   sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
   uid                          Hubot <hubot@example.com>
   ssb   4096R/4BB6D45482678BE3 2016-03-10
   ```

4. To set your primary GPG signing key in Git, paste the text below, substituting in the GPG primary key ID you'd like to use. In this example, the GPG key ID is `3AA5C34371567BD2`:

   ```bash
   git config --global user.signingkey 3AA5C34371567BD2
   ```

5. To configure Git to sign all commits by default, enter the following command (optional but recommended):

   ```bash
   git config --global commit.gpgsign true
   ```

6. run the following command in the `zsh` shell to add the GPG key to your `.zshrc` file:

   ```bash
   echo -e '\nexport GPG_TTY=$(tty)' >> ~/.zshrc
   ```

7. Run the following command and restart your terminal:

   ```bash
   source ~/.zshrc
   ```

### Verify the GPG Key by signing a commit

Now the GPG Key should be correctly configured.

1. Execute the following command to create a signed commit:

   ```bash
   git commit -S -m "YOUR_COMMIT_MESSAGE"
   ```

2. When prompted, provide the passphrase you set up when you generated your GPG key.
3. On github, navigate to the commits list of your repository. And you should see the “Verified” badge next to your commit :

   ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/4bbd5c81-65df-4417-ad07-662f9cfb14a7/890576a2-b640-411d-a532-d060a0cc12db/image.png)

---

## Other installations

### Standalone apps

- Akko Cloud Driver (for Akko keyboard)

### Chrome extensions

- Bitwarden
- Css Peeper
- Dark Reader
- Detailed SEO
- GoFullPage
- JSON Formatter
- [Localhost](http://Localhost) Open Graph Tester
- (MetaMask)
- (Rabby Wallet)
- Raindrop.io
- React Developer Tools
- Tag Assistant
- Todoist for Chrome
- uBlock Origin / uBlock Origin Lite
- Wappalyzer
- Wave
- What Font

### VSCode Extensions

- Auto Rename Tag
- C/C++
- EditorConfig
- Error Lens
- ESLint
- Even Better TOML
- GitLens
- Material Icon Theme
- Mintlify
- One Dark Pro
- Paste JSON as Code
- Path Intellisence
- PostCSS
- Prettier
- Pretty Typescript Errors
- Project Manager
- Pylance
- Python
- Remote - SSH
- Remote Explorer
- Ruff
- SVG Preview
- Tailwind CSS IntelliSense
- Template String Converter
- Todo Tree
- Version Lens
- YAML
- Live Server

## Applications settings

- **Built-in apps**

  - **Apple Mail**
    - Add accounts
    - Show most recent message at top
    - Set “undo send delay”
  - **Apple Calendar**
    - Add accounts
  - Apple Contacts
    - Add accounts
  - **iMessage**
    - Sync iCloud for iMessages just for the sake of syncing, then disable iCloud again
    - Sync contacts on iCloud
    - iPhone: activate message forwarding to new Mac
  - **Notes**
    - New notes start with: Body
    - Settings -> Disable: Group notes by date

- **Other apps**
  - **iTerm**
    - General > Settings > Load settings from a custom folder > `~/.config/iterm2`
  - **Raycast**
    - Import settings from dotfiles
  - **Bitwarden**
    - ..
  - **Brave Browser / Chrome**
    - Add extensions
    - …
  - Cursor / VSCode
    - …
  - **OrbStack**
    - …
  - Screaming Frog SEO
    - Set database folder
  - Logi Options +
    - …
  - XCodes App
    - …
  - Raindrop
    - …
  - ImageOptim
    - …
  -
