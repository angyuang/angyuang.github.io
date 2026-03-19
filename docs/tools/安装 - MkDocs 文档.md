详细指南。

* * *

需求[](#requirements "Permanent link")
-------------------------------------

MkDocs 需要您系统上安装的最新版本的 [Python](https://pythonlang.cn/) 和 Python 包管理器 [pip](https://pip.readthedocs.io/en/stable/installing/)。

您可以从命令行检查是否已经安装了这些包。

```null
$ python --version
Python 3.8.2
$ pip --version
pip 20.0.2 from /usr/local/lib/python3.8/site-packages/pip (python 3.8)
```

如果您已经安装了这些包，您可以跳过到 [安装 MkDocs](#installing-mkdocs)。

### 安装 Python[](#installing-python "Permanent link")

使用您选择的包管理器安装 [Python](https://pythonlang.cn/)，或者从 [python.org](https://pythonlang.cn/downloads/) 下载适用于您系统的安装程序并运行它。

注意

如果您在 Windows 上安装 Python，请确保选中将 Python 添加到 PATH 的复选框，如果安装程序提供此选项（默认情况下通常是关闭的）。

![](https://mkdocs.cn/img/win-py-install.png)

### 安装 pip[](#installing-pip "Permanent link")

如果您使用的是最新版本的 Python，Python 包管理器 [pip](https://pip.readthedocs.io/en/stable/installing/) 很可能默认安装。但是，您可能需要将 pip 升级到最新版本。

```null
pip install --upgrade pip
```

如果您需要首次安装 pip，请下载 [get-pip.py](https://bootstrap.pypa.io/get-pip.py)。然后运行以下命令来安装它

```null
python get-pip.py
```

安装 MkDocs[](#installing-mkdocs "Permanent link")
-------------------------------------------------

使用 pip 安装 `mkdocs` 包

```null
pip install mkdocs
```

您现在应该在系统上安装了 `mkdocs` 命令。运行 `mkdocs --version` 检查一切是否正常工作。

```null
$ mkdocs --version
mkdocs, version 1.2.0 from /usr/local/lib/python3.8/site-packages/mkdocs (Python 3.8)
```

注意

如果您想安装 MkDocs 的手册页，[click-man](https://github.com/click-contrib/click-man) 工具可以为您生成并安装它们。只需运行以下两个命令

```null
pip install click-man
click-man --target path/to/man/pages mkdocs
```

有关为什么手册页不是由 pip 自动生成和安装的解释，请参阅 [click-man 文档](https://github.com/click-contrib/click-man#automatic-man-page-installation-with-setuptools-and-pip)。

注意

如果您使用的是 Windows，上述某些命令可能无法正常工作。

一个快速解决方案可能是用 `python -m` 作为前缀，例如

```null
python -m pip install mkdocs
python -m mkdocs
```

为了获得更永久的解决方案，您可能需要编辑 `PATH` 环境变量以包含 Python 安装的 `Scripts` 目录。最近版本的 Python 包含一个脚本供您执行此操作。导航到您的 Python 安装目录（例如 `C:\Python38\`），打开 `Tools`，然后打开 `Scripts` 文件夹，并通过双击运行 `win_add2path.py` 文件。或者，您可以下载 [脚本](https://github.com/python/cpython/blob/master/Tools/scripts/win_add2path.py) 并运行它 (`python win_add2path.py`)。