# .config

对于配置 everything 的说明

## packages






### ranger

- 安装`ranger`
```
sudo apt-get install ranger
```

- 配置`ranger`

1. 生成配置文件
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
2. 修改rc.conf文件，见xx






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






#### Vim plug vim-instant-markdown

- **Quick start** (assuming you have all the necessary dependencies):

- Install the Node.js mini-server by running either:

  - `[sudo] npm -g install instant-markdown-d` or, for the pre-release version:
  - `[sudo] npm -g install instant-markdown-d@next`

  or the following command for the Python mini-server (which also requires
  [pandoc][pandoc] to render markdown):

  - `pip install --user smdv`

* Add the following to your `.vimrc`, depending on the plugin manager of your
  choice:

  - [vim-plug][plug]

    ```vim
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    ```

  - [Vundle][vundle]

    ```vim
    Plugin 'instant-markdown/vim-instant-markdown'
    ```
  - Vim8 built-in package manager (Execute the following command instead of adding it to `.vimrc`)

	```shell
    # NOTE:
    # 1. Please check you have git installed.
    # 2. Please replace * with a package name you want.
    git clone https://github.com/instant-markdown/vim-instant-markdown.git ~/.vim/pack/*/start/
	```

- **Detailed instructions**

- If you're on Linux, ensure the following packages are installed:
  - `xdg-utils`
  - `curl`
  - `nodejs` (Ensure that you are using a recent stable version. [Install `node` using `n` if needed][n].)
  
  
  
  


#### Coc plug clangd

- **Quick Start**

- install [Node.js](https://nodejs.org/en/). `coc.nvim` and `coc-clangd` run on Node.js.
- install `coc.nvim`. Instructions using `vim-plug` (check out [coc.nvim Wiki][] other options):
  - add to `.vimrc`: `vim Plug 'neoclide/coc.nvim', {'branch': 'release'}`
  - in vim, run `:PlugInstall`
- in vim, run `:CocInstall coc-clangd`
- `coc-clangd` will try to find `clangd` from your `$PATH`, if not found, you can run `:CocCommand clangd.install` to install the [latest release][] from GitHub
1. follow [Project setup][] to generate `compile_commands.json` for your project

> **Note**: If you've configured `clangd` as a languageServer in `coc-settings.json`, you should remove it to avoid running clangd twice!









