# Quicker start 
- 安装各类依赖包
```bash
sudo apt-get update
sudo apt-get install tmux
sudo apt-get install ranger

sudo apt-get install neovim
sudo apt install python3-neovim

sudo npm -g install instant-markdown-d
sudo apt-get install xdg-utils curl
```

- Installation nodejs 

  - `curl -sL install-node.vercel.app/lts | bash ` or
  - `curl -fsSL https://deb.nodesource.com/setup_current.x | sudo -E bash - ; sudo apt-get install -y nodejs`


- `cp` config file
```
cd ~/Desktop/
git clone https://github.com/rhao-hur/.config.git
cp -r .config/nvim ~/.config/
cp -r .config/tmux ~/.config/
cp -r .config/ranger ~/.config/

apt-get install bear
nvim ~/.config/nvim/init.vim
:CocCommand clangd.install
```


# .config

对于配置 everything 的说明

## packages



### [tmux](https://github.com/tmux/tmux)

- 安装`tmux`
```
sudo apt-get install tmux
```



### [ranger](https://github.com/ranger/ranger)

- 安装`ranger`
```
sudo apt-get install ranger
```

- 配置`ranger`，生成配置文件
```
ranger --copy-config=all
```
- 这个时候ranger就会生成配置文件目录~/.config/ranger/，目录内容如下
```
rc.conf     - 选项设置和快捷键
commands.py - 能通过 : 执行的命令
rifle.conf  - 指定不同类型的文件的默认打开程序。
scope.sh    - 用于指定预览程序的文件
```
- 修改rc.conf文件






### [neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- 安装`neovim`
```
sudo apt-get install neovim
```

Python（:python）支持自动安装
```
sudo apt install python3-neovim
```

- 直接cp `nvim` 文件夹中的配置文件到~/.config/nvim/，内容如下
```
autoload/     			- vim-plug 安装工具 
default_configs/ 		- 编辑器系统行为配置，如 python 解析路径等
coc-settings.json  		- coc.vim 配置文件
md-snippets.vim    		- .md 自动补全配置
init.vim    			- neovim 配置文件
```

- 打开`nvim`后，自动下载`vim plug`与`coc.vim`插件




#### Vim plug [vim-instant-markdown](https://github.com/instant-markdown/vim-instant-markdown)

**Quick start**（假设您已安装所有必需的依赖项）：

- 通过以下任一方式安装Node.js迷你服务器：

  - `[sudo] npm -g install instant-markdown-d` 或者，对于预发布版本：
  - `[sudo] npm -g install instant-markdown-d@next`

  或者使用以下命令安装Python迷你服务器（还需要 [pandoc](https://pandoc.org/) 渲染markdown）：

  - `pip install --user smdv`

* 根据您选择的插件管理器，将以下内容添加到您的 `.vimrc` 中：

  - [vim-plug](https://github.com/junegunn/vim-plug)

    ```vim
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    ```

  - [Vundle](https://github.com/VundleVim/Vundle.vim)

    ```vim
    Plugin 'instant-markdown/vim-instant-markdown'
    ```

  - Vim8内置包管理器（将以下命令放入 `.vimrc` 中的位置）

	```shell
    # 注意:
    # 1. 请确保您已安装git。
    # 2. 请将*替换为您想要的包名称。
    git clone https://github.com/instant-markdown/vim-instant-markdown.git ~/.vim/pack/*/start/
	```

- **详细说明**

- 如果您使用的是Linux，请确保安装了以下软件包：
  - `xdg-utils`
  - `curl`
  - `nodejs`（确保您使用的是最新稳定版本。[如果需要，请使用 `n` 安装 `node`](https://github.com/tj/n)。）


#### Vim plug [coc.nvim](https://github.com/neoclide/coc.nvim/tree/master)
**Quick start**

- 确保使用 Vim >= 8.1.1719 或 Neovim >= 0.4.0。

- 安装 [nodejs](https://nodejs.org/en/download/) >= 16.18.0：
```bash
curl -sL install-node.vercel.app/lts | bash
```

- 对于 vim-plug 用户：
```
" 使用发布版本分支（推荐）
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 或者通过 npm 构建源代码
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'npm ci'}
```

在你的 `.vimrc` 或 `init.vim` 中添加以上配置，然后重新启动 Vim 并运行 `:PlugInstall`




#### Coc plug [clangd](https://github.com/clangd/coc-clangd)

**Quick start**

- 安装 [Node.js](https://nodejs.org/en/)。`coc.nvim` 和 `coc-clangd` 需要在Node.js上运行。
- 安装 `coc.nvim`。使用 `vim-plug` 的指令
  - 添加到 `.vimrc`：`vim Plug 'neoclide/coc.nvim', {'branch': 'release'}`
  - 在vim中运行 `:PlugInstall`
- 在vim中运行 `:CocInstall coc-clangd`
- `coc-clangd` 将尝试从您的 `$PATH` 中找到 `clangd`，如果找不到，您可以运行 `:CocCommand clangd.install` 从GitHub安装[最新版本](https://github.com/clangd/clangd/releases)。
- 遵循[项目设置](https://clangd.llvm.org/installation.html#project-setup)为您的项目生成 `compile_commands.json`

> **注意**: 如果您在 `coc-settings.json` 中将 `clangd` 配置为 languageServer，则应将其移除以避免两次运行 clangd！













