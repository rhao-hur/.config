# .config

对于配置 everything 的说明

## packages






### ranger

- 安装`ranger`
```
sudo apt-get install ranger
```

- 配置`ranger`

- 生成配置文件
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
- 修改rc.conf文件，见xx






### neovim
- 安装`neovim`
```
sudo apt-get install neovim
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








#### Vim plug Semshi
- 需满足`3.6 <= python <= 3.11`，并安装`pynvim`
```
python3 -m pip install pynvim --upgrade
````
- 在`vim`中打开`python`文件，运行`:UpdateRemotePlugins`







#### Vim plug vim-devicons

- 需要前往`nerd-fonts`下载字体，首先下载文件（这里下载`SourceCodePro`字体）
```
wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/SourceCodePro.zip
```

- 然后解压到文件夹:
```
sudo unzip SourceCodePro -d /usr/share/fonts/SourceCodePro
```

- 转到`/usr/share/fonts/SourceCodePro`目录，并安装
```
cd /usr/share/fonts/SourceCodePro
sudo mkfontscale # 生成核心字体信息
sudo mkfontdir # 生成字体文件夹
sudo fc-cache -fv # 刷新系统字体缓存
```






### Vim plug vim-instant-markdown

- **快速开始**（假设您已安装所有必需的依赖项）：

- 通过以下任一方式安装Node.js迷你服务器：

  - `[sudo] npm -g install instant-markdown-d` 或者，对于预发布版本：
  - `[sudo] npm -g install instant-markdown-d@next`

  或者使用以下命令安装Python迷你服务器（还需要 [pandoc][pandoc] 渲染markdown）：

  - `pip install --user smdv`

* 根据您选择的插件管理器，将以下内容添加到您的 `.vimrc` 中：

  - [vim-plug][plug]

    ```vim
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    ```

  - [Vundle][vundle]

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
  - `nodejs`（确保您使用的是最新稳定版本。[如果需要，请使用 `n` 安装 `node`][n]。）







#### Coc插件clangd

- **快速开始**

- 安装 [Node.js](https://nodejs.org/en/)。`coc.nvim` 和 `coc-clangd` 需要在Node.js上运行。
- 安装 `coc.nvim`。使用 `vim-plug` 的指令（查看 [coc.nvim Wiki][] 其他选项）：
  - 添加到 `.vimrc`：`vim Plug 'neoclide/coc.nvim', {'branch': 'release'}`
  - 在vim中运行 `:PlugInstall`
- 在vim中运行 `:CocInstall coc-clangd`
- `coc-clangd` 将尝试从您的 `$PATH` 中找到 `clangd`，如果找不到，您可以运行 `:CocCommand clangd.install` 从GitHub安装[最新版本][]。
1. 遵循[项目设置][]为您的项目生成 `compile_commands.json`

> **注意**: 如果您在 `coc-settings.json` 中将 `clangd` 配置为 languageServer，则应将其移除以避免两次运行 clangd！










