# 🍎 vimlife_with_hammerspoon 🔨🥄

Config file and modules in this repository help to apply the key map anywhere in Typora and others.
Enjoy your vimlife with Hammerspoon!

설정파일 구현과정은 [블로그](https://humblego.tistory.com/11)에서 확인하실 수 있습니다.

# 🍎 Feature

1. **Add English conversion to Esc key.**

- When you put 'esc' key, input source will be chagned to English if current input source is not English.
- It will be helpful when usinge vim with non-English input source.

2. **'vim_keymap mode' for text editor like typora, tistory..etc.**

- In fact, it's just a simulation of acting like a vim keymap in a text editor like typora.
- You can turn on and off 'vim_keymap mode'.
- Marked by a menu icon, it is easy to see if the function is turned on.

#### List of keys supported

| From      | To                             |
| --------- | ------------------------------ |
| h         | left                           |
| j         | down                           |
| k         | up                             |
| l         | right                          |
| x         | forward Delete (not cut)       |
| w         | next word                      |
| b         | prev word                      |
| i         | insert mode                    |
| a         | append                         |
| o         | open below                     |
| p         | paste after                    |
| u         | undo                           |
| shift + d | delete cursor to eol (not cut) |
| shift + a | append at eol                  |
| shift + o | open above                     |
| y + y     | copy one line                  |
| d + d     | delete one line (not cut)      |
| d + w     | delete next word (not cut)     |
| d + b     | delete prev word (not cut)     |

# 🍎 Install

If you are a skillful Hammerspoon user, just copy and paste the init.lua and modules.

If you are new to Hammerspoon, follow the process below.

## 1️⃣ Install hammerspoon first.

#### Case 1) With homebrew cask

```
brew install --cask hammerspoon
```

#### Case 2) With zip link

1. Download Hammerspoon-x.x.xx.zip from this [link](https://github.com/Hammerspoon/hammerspoon/releases/tag/0.9.82)
2. Unzip downloaded file and move 'hammerspoon' file to `Applications` directory (한국어로 응용 프로그램 폴더)

## 2️⃣ Clone this repository && Execute init.sh

```
git clone https://github.com/humblEgo/vimlife_with_hammerspoon.git && cd vimlife_with_hammerspoon && ./init.sh
```

## 3️⃣ Execute Hammerspoon

Maybe you can find 'Hammerspoon' icon in launchpad. Click it.

Or just use Spotlight/Alfred.

In my case, execute hammerspoon with 'spotlight'.
![image](https://user-images.githubusercontent.com/54612343/103273247-2ff66900-4a02-11eb-8448-1fd6a4e97468.png)

# 🍎 Contributor

I'd appreciate it if you could tell me about the modifications.
Also, if you want to add a vim keymap, please feel free to send me PR or issue! :)
