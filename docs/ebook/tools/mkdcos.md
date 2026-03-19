一个入门教程！
https://mkdocs.cn

* * *

安装
-------------------------------------

要安装 MkDocs，请从命令行运行以下命令

```shell

pip install mkdocs
```

有关更多详细信息，请参阅[安装指南](https://mkdocs.cn/user-guide/installation/)。

创建新项目
--------------------------------------------------

入门非常简单。要创建一个新项目，请从命令行运行以下命令

```shell

mkdocs new my-project
cd my-project
```

花点时间查看为您创建的初始项目。

![](https://mkdocs.cn/img/initial-layout.png)

有一个名为 `mkdocs.yml` 的单个配置文件，以及一个名为 `docs` 的文件夹，其中将包含您的文档源文件（`docs` 是 [docs\_dir](https://mkdocs.cn/user-guide/configuration/#docs_dir) 配置设置的默认值）。目前，`docs` 文件夹只包含一个文档页面，名为 `index.md`。

MkDocs 附带一个内置的开发服务器，允许您在处理文档时预览文档。确保您位于与 `mkdocs.yml` 配置文件相同的目录中，然后通过运行 `mkdocs serve` 命令启动服务器

```shell

$ mkdocs serve
INFO    -  Building documentation...
INFO    -  Cleaning site directory
INFO    -  Documentation built in 0.22 seconds
INFO    -  [15:50:43] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO    -  [15:50:43] Serving on http://127.0.0.1:8000/
```

在浏览器中打开 [http://127.0.0.1:8000/](http://127.0.0.1:8000/)，您将看到默认首页正在显示

![](https://mkdocs.cn/img/screenshot.png)

开发服务器还支持自动重新加载，并在配置文件、文档目录或主题目录中的任何内容发生更改时重新构建您的文档。

在您选择的文本编辑器中打开 `docs/index.md` 文档，将初始标题更改为 `MkLorum` 并保存您的更改。您的浏览器将自动重新加载，您应该会立即看到更新的文档。

现在尝试编辑配置文件：`mkdocs.yml`。将 [`site_name`](https://mkdocs.cn/user-guide/configuration/#site_name) 设置更改为 `MkLorum` 并保存文件。

```shell

site_name: MkLorum
```

您的浏览器应该立即重新加载，您将看到您的新站点名称生效。

![](https://mkdocs.cn/img/site-name.png)

添加页面
---------------------------------------

现在在您的文档中添加第二个页面

```shell

curl 'https://jaspervdj.be/lorem-markdownum/markdown.txt' > docs/about.md
```

由于我们的文档站点将包含一些导航标题，您可能希望编辑配置文件并添加有关每个页面在导航标题中的顺序、标题和嵌套的信息，方法是添加 [`nav`](https://mkdocs.cn/user-guide/configuration/#nav) 设置

```shell

site_name: MkLorum
nav:
  - Home: index.md
  - About: about.md
```

保存您的更改，您现在将在左侧看到一个带有 `首页` 和 `关于` 项的导航栏，以及在右侧看到 `搜索`、`上一页` 和 `下一页` 项。

![](https://mkdocs.cn/img/multipage.png)

尝试菜单项并在页面之间来回导航。然后单击 `搜索`。将出现一个搜索对话框，允许您搜索任何页面上的任何文本。请注意，搜索结果包括站点上搜索词的每次出现，并直接链接到搜索词出现的页面部分。您无需任何努力或配置即可获得所有这些功能！

![](https://mkdocs.cn/img/search.png)

为我们的文档设置主题
----------------------------------------------------------

现在更改配置文件以通过更改主题来更改文档的显示方式。编辑 `mkdocs.yml` 文件并添加 [`theme`](https://mkdocs.cn/user-guide/configuration/#theme) 设置

```shell

site_name: MkLorum
nav:
  - Home: index.md
  - About: about.md
theme: readthedocs
```

保存您的更改，您将看到 ReadTheDocs 主题正在使用。

![](https://mkdocs.cn/img/readthedocs.png)

更改 Favicon 图标
-------------------------------------------------------------

默认情况下，MkDocs 使用 [MkDocs favicon](https://mkdocs.cn/img/favicon.ico) 图标。要使用其他图标，请在 `docs` 目录中创建一个名为 `img` 的子目录，并将您的自定义 `favicon.ico` 文件复制到该目录中。MkDocs 会自动检测并使用该文件作为您的 favicon 图标。

构建网站
--------------------------------------------

看起来不错。您已准备好部署 `MkLorum` 文档的第一版。首先构建文档

```shell

mkdocs build
```

这将创建一个名为 `site` 的新目录。查看目录内的内容

```shell

$ ls site
about  fonts  index.html  license  search.html
css    img    js          mkdocs   sitemap.xml
```

请注意，您的源文档已输出为两个名为 `index.html` 和 `about/index.html` 的 HTML 文件。您还有各种其他媒体已作为文档主题的一部分复制到 `site` 目录中。您甚至还有一个 `sitemap.xml` 文件和 `mkdocs/search_index.json`。

如果您使用的是源代码控制（如 `git`），您可能不希望将文档构建检查到存储库中。在您的 `.gitignore` 文件中添加包含 `site/` 的一行。

```shell

echo "site/" >> .gitignore
```

如果您使用的是其他源代码控制工具，您需要查看其文档，了解如何忽略特定目录。

其他命令和选项
--------------------------------------------------------

还有其他各种命令和选项可用。有关命令的完整列表，请使用 `--help` 标志

```shell

mkdocs --help
```

要查看给定命令上可用的选项列表，请使用该命令的 `--help` 标志。例如，要获取 `build` 命令可用的所有选项列表，请运行以下命令

```shell

mkdocs build --help
```

部署
----------------------------------

您刚刚构建的文档站点仅使用静态文件，因此您可以几乎在任何地方托管它。只需将整个 `site` 目录的内容上传到您要托管网站的任何地方即可完成。有关许多常用主机上的特定说明，请参阅 [部署文档](https://mkdocs.cn/user-guide/deploying-your-docs/) 页面。

获取帮助
---------------------------------------

有关 MkDocs 所有功能的更完整文档，请参阅 [用户指南](https://mkdocs.cn/user-guide/)。

要获取有关 MkDocs 的帮助，请使用 [GitHub 讨论](https://github.com/mkdocs/mkdocs/discussions) 或 [GitHub 问题](https://github.com/mkdocs/mkdocs/issues)。

详细指南。

* * *

需求
-------------------------------------

MkDocs 需要您系统上安装的最新版本的 [Python](https://pythonlang.cn/) 和 Python 包管理器 [pip](https://pip.readthedocs.io/en/stable/installing/)。

您可以从命令行检查是否已经安装了这些包。

```shell

$ python --version
Python 3.8.2
$ pip --version
pip 20.0.2 from /usr/local/lib/python3.8/site-packages/pip (python 3.8)
```

如果您已经安装了这些包，您可以跳过到 [安装 MkDocs](#installing-mkdocs)。

### 安装 Python

使用您选择的包管理器安装 [Python](https://pythonlang.cn/)，或者从 [python.org](https://pythonlang.cn/downloads/) 下载适用于您系统的安装程序并运行它。

注意

如果您在 Windows 上安装 Python，请确保选中将 Python 添加到 PATH 的复选框，如果安装程序提供此选项（默认情况下通常是关闭的）。

![](https://mkdocs.cn/img/win-py-install.png)

### 安装 pip

如果您使用的是最新版本的 Python，Python 包管理器 [pip](https://pip.readthedocs.io/en/stable/installing/) 很可能默认安装。但是，您可能需要将 pip 升级到最新版本。

```shell

pip install --upgrade pip
```

如果您需要首次安装 pip，请下载 [get-pip.py](https://bootstrap.pypa.io/get-pip.py)。然后运行以下命令来安装它

```shell

python get-pip.py
```

安装 MkDocs
-------------------------------------------------

使用 pip 安装 `mkdocs` 包

```shell

pip install mkdocs
```

您现在应该在系统上安装了 `mkdocs` 命令。运行 `mkdocs --version` 检查一切是否正常工作。

```shell

$ mkdocs --version
mkdocs, version 1.2.0 from /usr/local/lib/python3.8/site-packages/mkdocs (Python 3.8)
```

注意

如果您想安装 MkDocs 的手册页，[click-man](https://github.com/click-contrib/click-man) 工具可以为您生成并安装它们。只需运行以下两个命令

```shell

pip install click-man
click-man --target path/to/man/pages mkdocs
```

有关为什么手册页不是由 pip 自动生成和安装的解释，请参阅 [click-man 文档](https://github.com/click-contrib/click-man#automatic-man-page-installation-with-setuptools-and-pip)。

注意

如果您使用的是 Windows，上述某些命令可能无法正常工作。

一个快速解决方案可能是用 `python -m` 作为前缀，例如

```shell

python -m pip install mkdocs
python -m mkdocs
```

为了获得更永久的解决方案，您可能需要编辑 `PATH` 环境变量以包含 Python 安装的 `Scripts` 目录。最近版本的 Python 包含一个脚本供您执行此操作。导航到您的 Python 安装目录（例如 `C:\Python38\`），打开 `Tools`，然后打开 `Scripts` 文件夹，并通过双击运行 `win_add2path.py` 文件。或者，您可以下载 [脚本](https://github.com/python/cpython/blob/master/Tools/scripts/win_add2path.py) 并运行它 (`python win_add2path.py`)。


如何布局和编写 Markdown 源文件。

* * *

文件布局
--------------------------------------

您的文档源代码应编写为普通的 Markdown 文件（参见下面的 [使用 Markdown 编写](#writing-with-markdown)），并放置在 [文档目录](https://mkdocs.cn/user-guide/configuration/#docs_dir) 中。默认情况下，此目录将命名为 `docs`，并且将存在于项目顶层，与 `mkdocs.yml` 配置文件并列。

您可以创建的最简单的项目将类似于以下内容

```shell

mkdocs.yml
docs/
    index.md
```

按照惯例，您的项目主页应该命名为 `index.md`（有关详细信息，请参见下面的 [索引页](#index-pages)）。以下任何文件扩展名都可用于您的 Markdown 源文件：`markdown`、`mdown`、`mkdn`、`mkd`、`md`。包含在您的文档目录中的所有 Markdown 文件将在构建的站点中渲染，而不管任何设置。

注意

以点开头的文件和目录（例如：`.foo.md` 或 `.bar/baz.md`）会被 MkDocs 忽略。这可以通过 [`exclude_docs` 配置](https://mkdocs.cn/user-guide/configuration/#exclude_docs) 覆盖。

您还可以通过创建多个 Markdown 文件来创建多页文档

```shell

mkdocs.yml
docs/
    index.md
    about.md
    license.md
```

您使用的文件布局决定了为生成的页面使用的 URL。鉴于上述布局，将为以下 URL 生成页面

```shell

/
/about/
/license/
```

您还可以将 Markdown 文件包含在嵌套目录中，如果这更适合您的文档布局。

```shell

docs/
    index.md
    user-guide/getting-started.md
    user-guide/configuration-options.md
    license.md
```

嵌套目录内的源文件将导致生成具有嵌套 URL 的页面，如下所示

```shell

/
/user-guide/getting-started/
/user-guide/configuration-options/
/license/
```

在 [文档目录](https://mkdocs.cn/user-guide/configuration/#docs_dir) 中未识别为 Markdown 文件（通过其文件扩展名）的任何文件都将由 MkDocs 不做修改地复制到构建的站点中。有关详细信息，请参见下面的 [如何链接到图像和媒体](#linking-to-images-and-media)。

### 索引页

当请求目录时，默认情况下，大多数 Web 服务器将在该目录中返回索引文件（通常名为 `index.html`），如果存在的话。出于这个原因，上面所有示例中的主页都命名为 `index.md`，MkDocs 将在构建站点时将其渲染为 `index.html`。

许多代码库托管网站通过在浏览目录内容时显示 README 文件的内容来提供对 README 文件的特殊处理。因此，MkDocs 允许您将索引页命名为 `README.md` 而不是 `index.md`。这样，当用户浏览您的源代码时，代码库主机可以将该目录的索引页显示为 README 文件。但是，当 MkDocs 渲染您的站点时，该文件将被重命名为 `index.html`，以便服务器将其作为正确的索引文件提供服务。

如果在同一个目录中都找到了 `index.md` 文件和 `README.md` 文件，则使用 `index.md` 文件，而忽略 `README.md` 文件。

### 配置页面和导航

`mkdocs.yml` 文件中的 [nav](https://mkdocs.cn/user-guide/configuration/#nav) 配置设置定义了哪些页面包含在全局站点导航菜单中，以及该菜单的结构。如果没有提供，导航将通过发现 [文档目录](https://mkdocs.cn/user-guide/configuration/#docs_dir) 中的所有 Markdown 文件来自动创建。自动创建的导航配置始终按文件名按字母数字排序（除了索引文件始终在子部分中列出第一个）。如果您希望您的导航菜单以不同的方式排序，则需要手动定义您的导航配置。

一个最小的导航配置可能看起来像这样

```shell

nav:
  - index.md
  - about.md
```

导航配置中的所有路径都必须相对于 `docs_dir` 配置选项。如果该选项设置为默认值 `docs`，则上述配置的源文件将位于 `docs/index.md` 和 `docs/about.md` 中。

上面的示例将导致在顶层创建两个导航项，并从 Markdown 文件的内容中推断其标题，或者，如果文件中没有定义标题，则从文件名中推断。要在 `nav` 设置中覆盖标题，请在文件名之前添加一个标题。

```shell

nav:
  - Home: index.md
  - About: about.md
```

请注意，如果在导航中为页面定义了标题，则该标题将在整个站点中用于该页面，并将覆盖页面本身中定义的任何标题。

导航子部分可以通过将相关页面一起列在节标题下创建。例如

```shell

nav:
  - Home: index.md
  - User Guide:
    - Writing your docs: writing-your-docs.md
    - Styling your docs: styling-your-docs.md
  - About:
    - License: license.md
    - Release Notes: release-notes.md
```

使用上述配置，我们有三个顶层项目：“首页”、“用户指南”和“关于”。“首页”是到站点主页的链接。在“用户指南”部分中列出了两个页面：“编写文档”和“设置文档样式”。在“关于”部分中列出了另外两个页面：“许可”和“发布说明”。

请注意，部分不能分配页面。部分只是子页面和子部分的容器。您可以根据需要将部分嵌套得尽可能深。但是，请注意，不要通过过度复杂嵌套使您的用户难以浏览站点导航。虽然部分可能反映您的目录结构，但它们不必这样做。

在您的导航配置中未列出的任何页面仍将被渲染并包含在构建的站点中，但是它们不会从全局导航中链接，也不会包含在 `previous` 和 `next` 链接中。此类页面将“隐藏”，除非直接链接到它们。

使用 Markdown 编写
----------------------------------------------------------

MkDocs 页面必须使用 [Markdown](https://daringfireball.net/projects/markdown/) 编写，Markdown 是一种轻量级标记语言，它可以生成易于阅读、易于编写的纯文本文档，这些文档可以以可预测的方式转换为有效的 HTML 文档。

MkDocs 使用 [Python-Markdown](https://python-markdown.github.io/) 库将 Markdown 文档渲染为 HTML。Python-Markdown 几乎完全符合 [参考实现](https://daringfireball.net/projects/markdown/)，尽管有一些非常小的 [差异](https://python-markdown.github.io/#differences)。

除了所有 Markdown 实现通用的基本 Markdown [语法](https://daringfireball.net/projects/markdown/syntax) 之外，MkDocs 还包括对使用 Python-Markdown [扩展](https://python-markdown.github.io/extensions/) 扩展 Markdown 语法的支持。有关如何启用扩展的详细信息，请参见 MkDocs 的 [markdown\_extensions](https://mkdocs.cn/user-guide/configuration/#markdown_extensions) 配置设置。

MkDocs 默认包含一些扩展，这些扩展将在下面重点介绍。

### 内部链接

MkDocs 允许您通过使用常规 Markdown [链接](https://daringfireball.net/projects/markdown/syntax#link) 来互连您的文档。但是，如以下所述，为 MkDocs 特别格式化这些链接有一些额外的优势。

#### 链接到页面

在文档页面之间链接时，您可以简单地使用常规 Markdown [链接](https://daringfireball.net/projects/markdown/syntax#link) 语法，包括您要链接到的 Markdown 文档的_相对路径_。

```shell

Please see the [project license](license.md) for further details.
```

当 MkDocs 构建运行时，这些 Markdown 链接将自动转换为指向相应 HTML 页面的 HTML 超链接。

警告

不正式支持使用链接的绝对路径。相对路径由 MkDocs 调整以确保它们始终相对于页面。绝对路径根本不会被修改。这意味着使用绝对路径的链接可能在您的本地环境中运行良好，但一旦您将它们部署到生产服务器，它们可能会中断。

如果目标文档文件在另一个目录中，则需要确保在链接中包含任何相对目录路径。

```shell

Please see the [project license](../about/license.md) for further details.
```

MkDocs 使用 [toc](https://python-markdown.github.io/extensions/toc/) 扩展为 Markdown 文档中的每个标题生成一个 ID。您可以使用该 ID 来链接到目标文档内的某个部分，方法是使用锚点链接。生成的 HTML 将正确转换链接的路径部分，并将锚点部分保持不变。

```shell

Please see the [project license](about.md#license) for further details.
```

请注意，ID 是根据标题的文本创建的。所有文本都转换为小写，任何不允许的字符（包括空格）都转换为连字符。然后将连续的连字符简化为一个连字符。

toc 扩展提供了一些配置设置，您可以在 `mkdocs.yml` 配置文件中设置这些设置以更改默认行为

*   **`permalink`**
    
    在每个标题末尾生成永久链接。默认值：`False`。
    
    当设置为 True 时，段落符号 (¶ 或 `&para;`) 用作链接文本。当设置为字符串时，提供的字符串用作链接文本。例如，要使用井号 (`#`) 代替，请执行以下操作
    
    ```shell
    
    markdown_extensions:
      - toc:
          permalink: "#"
    ```
    
*   **`baselevel`**
    
    标题的基线。默认值：`1`。
    
    此设置允许自动调整标题级别以适合 HTML 模板的层次结构。例如，如果页面中的 Markdown 文本不应包含任何高于级别 2 (`<h2>`) 的标题，请执行以下操作
    
    ```shell
    
    markdown_extensions:
      - toc:
          baselevel: 2
    ```
    
    然后，您文档中的任何标题都会增加 1。例如，标题 `# Header` 将在 HTML 输出中渲染为级别 2 标题 (`<h2>`)。
    
*   **`separator`**
    
    单词分隔符。默认值：`-`。
    
    替换生成的 ID 中空格的字符。如果您更喜欢下划线，那么请执行以下操作
    
    ```shell
    
    markdown_extensions:
      - toc:
          separator: "_"
    ```
    

请注意，如果您想定义上述多个设置，则必须在 `markdown_extensions` 配置选项中的单个 `toc` 条目下执行此操作。

```shell

markdown_extensions:
  - toc:
      permalink: "#"
      baselevel: 2
      separator: "_"
```

#### 链接到图像和媒体

除了 Markdown 源文件之外，您还可以将其他文件类型包含在您的文档中，这些文件将在生成您的文档站点时被复制过去。这些可能包括图像和其他媒体。

例如，如果您的项目文档需要包含 [GitHub Pages CNAME 文件](https://help.github.com/articles/using-a-custom-domain-with-github-pages/) 和 PNG 格式的屏幕截图图像，那么您的文件布局可能如下所示

```shell

mkdocs.yml
docs/
    CNAME
    index.md
    about.md
    license.md
    img/
        screenshot.png
```

要在文档源文件中包含图像，只需使用任何常规 Markdown 图像语法即可

```shell

Cupcake indexer is a snazzy new project for indexing small cakes.

![Screenshot](img/screenshot.png)

*Above: Cupcake indexer in progress*
```

现在，当您构建文档时，您的图像将被嵌入，并且如果您使用 Markdown 编辑器处理文档，也应该预览该图像。

#### 从原始 HTML 链接

Markdown 允许文档作者在 Markdown 语法无法满足作者需求时回退到原始 HTML。MkDocs 在这方面没有限制 Markdown。但是，由于 Markdown 解析器会忽略所有原始 HTML，因此 MkDocs 无法验证或转换包含在原始 HTML 中的链接。在原始 HTML 中包含内部链接时，您需要手动将链接格式化以适合渲染的文档。

### 元数据

MkDocs 支持 YAML 和 MultiMarkdown 样式的元数据（通常称为 front-matter）。元数据由在 Markdown 文档开头定义的一系列关键字和值组成，这些关键字和值在文档被 Python-Markdown 处理之前会被剥离。键值对由 MkDocs 传递给页面模板。因此，如果主题包含支持，则任何键的值都可以显示在页面上或用于控制页面渲染。有关可能支持的哪些键的信息（如果有），请参阅主题的文档。

除了在模板中显示信息之外，MkDocs 还支持一些预定义的元数据键，这些键可以改变 MkDocs 对特定页面的行为。以下键受支持

*   **`template`**
    
    要与当前页面一起使用的模板。
    
    默认情况下，MkDocs 使用主题的 `main.html` 模板来渲染 Markdown 页面。您可以使用 `template` 元数据键来为特定页面定义不同的模板文件。模板文件必须在主题环境中定义的路径上可用。
    
*   **`title`**
    
    文档要使用的“标题”。
    
    MkDocs 将尝试以下列顺序确定文档的标题
    
    1.  在文档的 [nav](https://mkdocs.cn/user-guide/configuration/#nav) 配置设置中定义的标题。
        
    2.  在文档的 `title` 元数据键中定义的标题。
        
    3.  文档主体第一行的 1 级 Markdown 标题。  
        （[Setext 样式](https://daringfireball.net/projects/markdown/syntax#header) 标题_仅在 MkDocs 1.5 之后支持_。）
        
    4.  文档的文件名。
        
    
    找到页面标题后，MkDoc 不会继续检查上述列表中的任何其他来源。
    

#### YAML 样式元数据

YAML 样式元数据由 [YAML](https://yaml.org/) 键值对组成，这些键值对用 YAML 样式分隔符包装以标记元数据的开始和/或结束。文档的第一行必须是 `---`。元数据在包含结束分隔符的第一行结束（`---` 或 `...`）。分隔符之间的内容被解析为 [YAML](https://yaml.org/)。

```shell

---
title: My Document
summary: A brief description of my document.
authors:
    - Waylan Limberg
    - Tom Christie
date: 2018-07-10
some_url: https://example.com
---
This is the first paragraph of the document.
```

YAML 能够检测数据类型。因此，在上面的示例中，`title`、`summary` 和 `some_url` 的值为字符串，`authors` 的值为字符串列表，`date` 的值为 `datetime.date` 对象。请注意，YAML 键区分大小写，MkDocs 期望键全部小写。YAML 的顶层必须是一组键值对，这将导致返回 Python `dict`。如果返回任何其他类型，或者 YAML 解析器遇到错误，则 MkDocs 不会将该部分识别为元数据，页面的 `meta` 属性将为空，并且该部分不会从文档中删除。

#### MultiMarkdown 样式元数据

MultiMarkdown 样式元数据使用由 [MultiMarkdown](https://fletcherpenney.net/MultiMarkdown_Syntax_Guide#metadata) 项目首次引入的格式。数据由在 Markdown 文档开头定义的一系列关键字和值组成，如下所示

```shell

Title:   My Document
Summary: A brief description of my document.
Authors: Waylan Limberg
         Tom Christie
Date:    January 23, 2018
blank-value:
some_url: https://example.com

This is the first paragraph of the document.
```

关键字不区分大小写，可以包含字母、数字、下划线和连字符，并且必须以冒号结尾。值包含冒号后面行上的任何内容，甚至可以为空。

如果一行缩进了 4 个或更多空格，则该行被假定为前一个关键字值的附加行。一个关键字可以有任意多的行。所有行都合并成一个字符串。

第一个空行结束文档的所有元数据。因此，文档的第一行不能为空。

注意

MkDocs 不支持 YAML 样式分隔符（`---` 或 `...`）用于 MultiMarkdown 样式元数据。实际上，MkDocs 依赖于分隔符的存在或不存在来确定使用的是 YAML 样式元数据还是 MultiMarkdown 样式元数据。如果检测到分隔符，但分隔符之间的内容不是有效的 YAML 元数据，则 MkDocs 不会尝试将内容解析为 MultiMarkdown 样式元数据。

### 表格

[tables](https://python-markdown.github.io/extensions/tables/) 扩展为 Markdown 添加了基本表格语法，该语法在多个实现中很流行。语法相当简单，通常仅适用于简单表格数据。

一个简单的表格如下所示

```shell

First Header | Second Header | Third Header
------------ | ------------- | ------------
Content Cell | Content Cell  | Content Cell
Content Cell | Content Cell  | Content Cell
```

如果需要，可以在表格的每一行中添加前导和尾部管道

```shell

| First Header | Second Header | Third Header |
| ------------ | ------------- | ------------ |
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |
```

通过在分隔符行中添加冒号来指定每列的对齐方式

```shell

First Header | Second Header | Third Header
:----------- |:-------------:| -----------:
Left         | Center        | Right
Left         | Center        | Right
```

请注意，表格单元格不能包含任何块级元素，也不能包含多行文本。但是，它们可以包含 Markdown 语法中定义的内联 Markdown，如 Markdown 的 [语法](https://daringfireball.net/projects/markdown/syntax) 规则所定义。

此外，表格必须用空行包围。表格前后必须有空行。

### 带围栏的代码块

[带围栏的代码块](https://python-markdown.github.io/extensions/fenced_code_blocks/) 扩展为定义不缩进的代码块添加了一种备用方法。

第一行应该包含 3 个或更多个反引号（`` ` ``）字符，最后一行应该包含相同数量的反引号字符（`` ` ``）

```shell

```
Fenced code blocks are like Standard
Markdown’s regular code blocks, except that
they’re not indented and instead rely on
start and end fence lines to delimit the
code block.
```
```

使用这种方法，可以在第一行反引号之后可选地指定语言，这会告知任何语法高亮器使用的语言

```shell

```python
def fn():
    pass
```
```

请注意，带围栏的代码块不能缩进。因此，它们不能嵌套在列表项、引用块等中。

选择和配置主题。

* * *

MkDocs 包含两个内置主题 ([mkdocs](#mkdocs) 和 [readthedocs](#readthedocs))，如下所述。但是，还有许多 [第三方主题](#third-party-themes) 可供选择。

要选择主题，请在您的 `mkdocs.yml` 配置文件中设置 [theme](https://mkdocs.cn/user-guide/configuration/#theme) 配置选项。

```shell

theme:
  name: readthedocs
```

mkdocs
-------------------------

默认主题，它是作为自定义 [Bootstrap](https://bootstrap.ac.cn/) 主题构建的，支持 MkDocs 的几乎所有功能。

![](https://mkdocs.cn/img/mkdocs_theme_light_mode.png)

![](https://mkdocs.cn/img/mkdocs_theme_dark_mode.png)

除了默认的 [主题配置选项](https://mkdocs.cn/user-guide/configuration/#theme) 之外，`mkdocs` 主题还支持以下选项

*   **`color_mode`**: 将主题的默认颜色模式设置为 `light`、`dark` 或 `auto` 之一。`auto` 模式将根据用户设备的系统配置切换到 `light` 或 `dark`。默认值：`light`。
    
*   **`user_color_mode_toggle`**: 在导航栏中启用切换菜单，允许用户从浏览器中选择他们喜欢的 `color_mode`（浅色、深色、自动）并在将来页面加载时保存他们的偏好。切换菜单在第一次页面加载时的默认选择是设置为 `color_mode` 的值。默认值：`false`。
    
    ![](https://mkdocs.cn/img/color_mode_toggle_menu.png)
    
*   **`nav_style`**: 调整顶部导航栏的视觉样式。设置为 `primary`、`dark` 或 `light` 之一。默认值：`primary`。此选项独立于 `color_mode` 选项，必须单独定义。
    
*   **`highlightjs`**: 使用 [highlight.js](https://highlightjs.org/) JavaScript 库启用代码块中源代码的突出显示。默认值：`True`。
    
*   **`hljs_style`**: highlight.js 库为代码块中突出显示源代码提供了许多不同的 [样式](https://highlightjs.org/static/demo/)（颜色变化）。在 `light` 模式下，将其设置为所需样式的名称。默认值：`github`。
    
*   **`hljs_style_dark`**: 在 `dark` 模式下，将其设置为所需 highlight.js 样式的名称。默认值：`github_dark`。
    
*   **`hljs_languages`**: 默认情况下，highlight.js 只支持 23 种常用语言。在此处列出其他语言以包含对它们的 support。
    
    ```shell
    
    theme:
      name: mkdocs
      highlightjs: true
      hljs_languages:
        - yaml
        - rust
    ```
    
*   **`analytics`**: 定义分析服务的配置选项。目前，仅通过 `gtag` 选项支持 Google Analytics v4。
    
    *   **`gtag`**: 要启用 Google Analytics，请将其设置为 Google Analytics v4 跟踪 ID，该 ID 使用 `G-` 格式。请参阅 Google 的文档以 [为网站和/或应用程序设置 Analytics（GA4）](https://support.google.com/analytics/answer/9304153?hl=en&ref_topic=9303319) 或 [升级到 Google Analytics 4 属性](https://support.google.com/analytics/answer/9744165?hl=en&ref_topic=9303319)。
        
        ```shell
        
        theme:
          name: mkdocs
          analytics:
            gtag: G-ABC123
        ```
        
        当设置为默认值（`null`）时，Google Analytics 将被禁用。
    
*   **`shortcuts`**: 定义键盘快捷键。
    
    ```shell
    
    theme:
      name: mkdocs
      shortcuts:
        help: 191    
        next: 78     
        previous: 80 
        search: 83   
    ```
    
    所有值必须是数字键码。最好使用所有键盘上都可用的键。您可以使用 [https://keycode.info/](https://keycode.info/) 来确定给定键的键码。
    
    *   **`help`**: 显示一个帮助模态，其中列出了键盘快捷键。默认值：`191`（?）
        
    *   **`next`**: 导航到“下一页”。默认值：`78`（n）
        
    *   **`previous`**: 导航到“上一页”。默认值：`80`（p）
        
    *   **`search`**: 显示搜索模态。默认值：`83`（s）
    
*   **`navigation_depth`**: 侧边栏中导航树的最大深度。默认值：`2`。
    
*   **`locale`**: 用于构建主题的区域设置（语言/位置）。如果您的区域设置尚未支持，它将回退到默认值。
    
    此主题支持以下区域设置
    
    *   `en`: 英语（默认）
    *   `de`: 德语
    *   `es`: 西班牙语
    *   `fa`: 波斯语
    *   `fr`: 法语
    *   `id`: 印度尼西亚语
    *   `it`: 意大利语
    *   `ja`: 日语
    *   `nb`: 挪威语 (Bokmål)
    *   `nl`: 荷兰语
    *   `nn`: 挪威语 (Nynorsk)
    *   `pl`: 波兰语
    *   `pt_BR`: 葡萄牙语 (巴西)
    *   `ru`: 俄语
    *   `tr`: 土耳其语
    *   `uk`: 乌克兰语
    *   `zh_CN`: 中文（简体，中国）
    *   `zh_TW`: 中文（繁体，台湾）
    
    有关详细信息，请参阅有关 [本地化主题](https://mkdocs.cn/user-guide/localizing-your-theme/) 的指南。
    

readthedocs
-----------------------------------

由 [Read the Docs](https://readthedocs.org/) 服务使用的默认主题的克隆，它提供了与其父主题相同的限制功能集。与它的父主题一样，只支持两个级别的导航。

![](https://mkdocs.cn/img/readthedocs.png)

除了默认的 [主题配置选项](https://mkdocs.cn/user-guide/configuration/#theme) 之外，`readthedocs` 主题还支持以下选项

*   **`highlightjs`**: 使用 [highlight.js](https://highlightjs.org/) JavaScript 库启用代码块中源代码的突出显示。默认值：`True`。
    
*   **`hljs_languages`**: 默认情况下，highlight.js 只支持 23 种常用语言。在此处列出其他语言以包含对它们的 support。
    
    ```shell
    
    theme:
      name: readthedocs
      highlightjs: true
      hljs_languages:
        - yaml
        - rust
    ```
    
*   **`analytics`**: 定义分析服务的配置选项。
    
    *   **`gtag`**: 要启用 Google Analytics，请将其设置为 Google Analytics v4 跟踪 ID，该 ID 使用 `G-` 格式。请参阅 Google 的文档以 [为网站和/或应用程序设置 Analytics（GA4）](https://support.google.com/analytics/answer/9304153?hl=en&ref_topic=9303319) 或 [升级到 Google Analytics 4 属性](https://support.google.com/analytics/answer/9744165?hl=en&ref_topic=9303319)。
        
        ```shell
        
        theme:
          name: readthedocs
          analytics:
            gtag: G-ABC123
        ```
        
        当设置为默认值（`null`）时，Google Analytics 将被禁用。
        
    *   **`anonymize_ip`**: 要为 Google Analytics 启用匿名 IP 地址，请将其设置为 `True`。默认值：`False`。
    
*   **`include_homepage_in_sidebar`**: 在侧边栏菜单中列出首页。由于 MkDocs 要求首页在 `nav` 配置选项中列出，因此此设置允许首页包含在侧边栏中或从侧边栏中排除。请注意，站点名称/徽标始终链接到首页。默认值：`True`。
    
*   **`prev_next_buttons_location`**: `bottom`、`top`、`both` 或 `none` 之一。相应地显示“下一页”和“上一页”按钮。默认值：`bottom`。
    
*   **`navigation_depth`**: 侧边栏中导航树的最大深度。默认值：`4`。
    
*   **`collapse_navigation`**: 仅在侧边栏中包含当前页面的页面部分标题。默认值：`True`。
    
*   **`titles_only`**: 仅在侧边栏中包含页面标题，不包括所有页面的所有部分标题。默认值：`False`。
    
*   **`sticky_navigation`**: 如果为 True，则当您滚动页面时，侧边栏将与主页面内容一起滚动。默认值：`True`。
    
*   **`locale`**: 用于构建主题的区域设置（语言/位置）。如果您的区域设置尚未支持，它将回退到默认值。
    
    此主题支持以下区域设置
    
    *   `en`: 英语（默认）
    *   `de`: 德语
    *   `es`: 西班牙语
    *   `fa`: 波斯语
    *   `fr`: 法语
    *   `id`: 印度尼西亚语
    *   `it`: 意大利语
    *   `ja`: 日语
    *   `nl`: 荷兰语
    *   `pl`: 波兰语
    *   `pt_BR`: 葡萄牙语 (巴西)
    *   `ru`: 俄语
    *   `tr`: 土耳其语
    *   `uk`: 乌克兰语
    *   `zh_CN`: 中文（简体，中国）
    *   `zh_TW`: 中文（繁体，台湾）
    
    有关详细信息，请参阅有关 [本地化主题](https://mkdocs.cn/user-guide/localizing-your-theme/) 的指南。
    
*   **`logo`**: 要在您的项目中设置徽标而不是纯文本 `site_name`，请将此变量设置为图像的位置。默认值：`null`。
    

第三方主题
------------------------------------

可以在 [社区 wiki](https://github.com/mkdocs/mkdocs/wiki/MkDocs-Themes) 页面和 [排名目录](https://github.com/mkdocs/catalog#-theming) 中找到第三方主题列表。如果您创建了自己的主题，请将其添加到其中。

警告

安装 MkDocs 主题意味着安装 Python 包并执行作者在其中放置的任何代码。因此，请谨慎行事；没有尝试进行沙盒化。

更改主题以满足您的需求。

* * *

如果您想对现有主题进行一些调整，则无需从头开始创建自己的主题。对于只需一些 CSS 和/或 JavaScript 的微调，您可以[使用 docs\_dir](#using-the-docs_dir)。但是，对于更复杂的自定义（包括覆盖模板），您将需要[使用主题 custom\_dir](#using-the-theme-custom_dir)设置。

使用 docs\_dir
-------------------------------------------

[extra\_css](https://mkdocs.cn/user-guide/configuration/#extra_css) 和 [extra\_javascript](https://mkdocs.cn/user-guide/configuration/#extra_javascript) 配置选项可用于对现有主题进行调整和自定义。要使用它们，您只需在[文档目录](https://mkdocs.cn/user-guide/configuration/#docs_dir)中包含 CSS 或 JavaScript 文件即可。

例如，要更改文档中标题的颜色，请创建一个名为（例如）`style.css` 的文件，并将其放在文档 Markdown 旁边。在该文件中添加以下 CSS。

```shell

h1 {
  color: red;
}
```

然后您需要将其添加到 `mkdocs.yml` 中

```shell

extra_css:
  - style.css
```

完成这些更改后，在运行 `mkdocs serve` 时应该可以看到它们 - 如果您已经运行了它，您应该会看到 CSS 更改被自动拾取，文档将更新。

注意

任何额外的 CSS 或 JavaScript 文件都将在页面内容之后添加到生成的 HTML 文档中。如果您希望包含 JavaScript 库，您可能可以使用主题[custom\_dir](https://mkdocs.cn/user-guide/configuration/#custom_dir)更好地包含库。

使用主题 custom\_dir
-------------------------------------------------------

[`theme.custom_dir`](https://mkdocs.cn/user-guide/configuration/#custom_dir) 配置选项可用于指向一个目录，其中包含覆盖父主题中的文件的文件。父主题将是 [`theme.name`](https://mkdocs.cn/user-guide/configuration/#name) 配置选项中定义的主题。`custom_dir` 中与父主题中文件同名的任何文件将替换父主题中同名文件。`custom_dir` 中的任何其他文件都将添加到父主题中。`custom_dir` 的内容应与父主题的目录结构相匹配。您可以包含模板、JavaScript 文件、CSS 文件、图像、字体或主题中包含的任何其他媒体。

注意

为了使此功能正常工作，`theme.name` 设置必须设置为已知的已安装主题。如果 `name` 设置改为设置为 `null`（或未定义），则没有主题可以覆盖，并且 `custom_dir` 的内容必须是一个完整的独立主题。有关更多信息，请参阅[主题开发者指南](https://mkdocs.cn/dev-guide/themes/)。

例如，[mkdocs](https://mkdocs.cn/user-guide/choosing-your-theme/#mkdocs) 主题（[浏览源代码](https://github.com/mkdocs/mkdocs/tree/master/mkdocs/themes/mkdocs)）包含以下目录结构（部分）

```shell

- css\
- fonts\
- img\
  - favicon.ico
  - grid.png
- js\
- 404.html
- base.html
- content.html
- nav-sub.html
- nav.html
- toc.html
```

要覆盖该主题中包含的任何文件，请在您的 `docs_dir` 旁边创建一个新目录

```shell

mkdir custom_theme
```

然后将您的 `mkdocs.yml` 配置文件指向新目录

```shell

theme:
  name: mkdocs
  custom_dir: custom_theme/
```

要覆盖 404 错误页面（“文件未找到”），请在 `custom_theme` 目录中添加一个名为 `404.html` 的新模板文件。有关模板中可以包含的内容的信息，请查看[主题开发者指南](https://mkdocs.cn/dev-guide/themes/)。

要覆盖网站图标，您可以在 `custom_theme/img/favicon.ico` 中添加一个新的图标文件。

要包含 JavaScript 库，请将库复制到 `custom_theme/js/` 目录中。

您的目录结构现在应该如下所示

```shell

- docs/
  - index.html
- custom_theme/
  - img/
    - favicon.ico
  - js/
    - somelib.js
  - 404.html
- config.yml
```

注意

父主题（在 `name` 中定义）中包含但在 `custom_dir` 中未包含的任何文件仍将被使用。`custom_dir` 仅会覆盖/替换父主题中的文件。如果您想删除文件或从头开始构建主题，那么您应该查看[主题开发者指南](https://mkdocs.cn/dev-guide/themes/)。

### 覆盖模板块

内置主题在其模板块中实现了许多部分，这些块可以在 `main.html` 模板中单独覆盖。只需在您的 `custom_dir` 中创建一个 `main.html` 模板文件，并在该文件中定义替换块即可。只需确保 `main.html` 扩展 `base.html`。例如，要更改 MkDocs 主题的标题，您的替换 `main.html` 模板将包含以下内容

```shell

{% extends "base.html" %}

{% block htmltitle %}
<title>Custom title goes here</title>
{% endblock %}
```

在上面的示例中，您在自定义 `main.html` 文件中定义的 `htmltitle` 块将用于代替父主题中定义的默认 `htmltitle` 块。您可以重新定义任意数量的块，只要这些块在父主题中定义即可。例如，您可以用另一个服务的 Google Analytics 脚本替换 Google Analytics 脚本，或用您自己的搜索功能替换搜索功能。您需要查阅您正在使用的父主题以确定哪些块可供覆盖。MkDocs 和 ReadTheDocs 主题提供以下块

*   `site_meta`：包含文档头部中的元标签。
*   `htmltitle`：包含文档头部中的页面标题。
*   `styles`：包含样式表的链接标签。
*   `libs`：包含页面标题中包含的 JavaScript 库（jQuery 等）。
*   `scripts`：包含页面加载后应执行的 JavaScript 脚本。
*   `analytics`：包含分析脚本。
*   `extrahead`：`<head>` 中的空块，用于插入自定义标签/脚本等。
*   `site_name`：包含导航栏中的网站名称。
*   `site_nav`：包含导航栏中的网站导航。
*   `search_button`：包含导航栏中的搜索框。
*   `next_prev`：包含导航栏中的下一页和上一页按钮。
*   `repo`：包含导航栏中的仓库链接。
*   `content`：包含页面的页面内容和目录。
*   `footer`：包含页面页脚。

您可能需要查看源模板文件以确保您的修改与网站结构兼容。有关您可以在自定义块中使用的变量列表，请参阅[模板变量](https://mkdocs.cn/dev-guide/themes/#template-variables)。有关块的更完整说明，请查看[Jinja 文档](https://jinja.flask.org.cn/en/latest/templates/#template-inheritance)。

### 组合 custom\_dir 和模板块

将 JavaScript 库添加到 `custom_dir` 将使其可用，但不会将其包含在 MkDocs 生成的页面中。因此，需要从 HTML 向库添加一个链接。

从上面的目录结构开始（已截断）

```shell

- docs/
- custom_theme/
  - js/
    - somelib.js
- config.yml
```

需要向模板添加一个指向 `custom_theme/js/somelib.js` 文件的链接。由于 `somelib.js` 是一个 JavaScript 库，因此它应该放在 `libs` 块中。但是，仅包含新脚本的新 `libs` 块将替换父模板中定义的块，并且父模板中对库的任何链接都将被删除。为了避免破坏模板，可以使用[super 块](https://jinja.flask.org.cn/en/latest/templates/#super-blocks)，并在块内调用 `super`

```shell

{% extends "base.html" %}

{% block libs %}
    {{ super() }}
    <script src="{{ base_url }}/js/somelib.js"></script>
{% endblock %}
```

请注意，使用了[base\_url](https://mkdocs.cn/dev-guide/themes/#base_url) 模板变量来确保链接始终相对于当前页面。

现在生成的页面将包含指向模板提供的库以及 `custom_dir` 中包含的库的链接。对 `custom_dir` 中包含的任何其他 CSS 文件也需要这样做。


以您的首选语言显示主题。

* * *

注意

主题本地化仅翻译主题本身的文本元素（例如“下一页”和“上一页”链接），不翻译文档的实际内容。如果您希望创建多语言文档，则需要将此处描述的主题本地化与第三方国际化/本地化插件结合使用。

安装
---------------------------

要使主题本地化生效，您必须使用支持它的主题，并通过安装 `mkdocs[i18n]` 启用 `i18n`（国际化）支持。

```shell

pip install 'mkdocs[i18n]'
```

支持的语言
-----------------------------------

在大多数情况下，语言使用 [ISO-639-1](https://en.wikipedia.org/wiki/ISO_639-1)（2 个字母）缩写来指定。但是，语言也可能包含地区（或区域或国家/地区）代码。语言和地区必须用下划线分隔。例如，英语的一些可能语言包括 `en`、`en_AU`、`en_GB` 和 `en_US`。

有关您使用的主题支持的语言列表，请参阅该主题的文档。

*   [mkdocs](https://mkdocs.cn/user-guide/choosing-your-theme/#mkdocs-locale)
*   [readthedocs](https://mkdocs.cn/user-guide/choosing-your-theme/#readthedocs-locale)

警告

如果您配置的语言尚未被您使用的主题支持，MkDocs 将回退到主题的默认语言。

用法
--------------------

要指定 MkDocs 应该使用的语言，请将 [locale](https://mkdocs.cn/user-guide/configuration/#locale) 参数设置为 [theme](https://mkdocs.cn/user-guide/configuration/#theme) 配置选项的适当代码。

例如，要使用法语构建 `mkdocs` 主题，您可以在 `mkdocs.yml` 配置文件中使用以下内容

```shell

theme:
  name: mkdocs
  locale: fr
```

贡献主题翻译
--------------------------------------------------

如果主题尚未翻译成您的语言，请随时使用 [翻译指南](https://mkdocs.cn/dev-guide/translations/) 贡献翻译。


所有可用配置设置的指南。

* * *

介绍
---------------------------

默认情况下，项目设置使用项目目录中名为 `mkdocs.yml` 的 YAML 配置文件进行配置。您可以使用 `-f`/`--config-file` 选项指定另一个路径（请参见 `mkdocs build --help`）。

至少，此配置文件必须包含 `site_name`。所有其他设置都是可选的。

项目信息
------------------------------------

### site\_name

这是一个 \*\*必需设置\*\*，它应该是一个字符串，用作项目文档的主要标题。例如

```shell

site_name: Marshmallow Generator
```

渲染主题时，此设置将作为 `site_name` 上下文变量传递。

### site\_url

设置站点的规范 URL。这将在每个 HTML 页面 `head` 部分添加一个包含 `canonical` URL 的 `link` 标签。如果 MkDocs 网站的“根”位于域名的子目录内，请确保在设置中包含该子目录（`https://example.com/foo/`）。

此设置也用于 `mkdocs serve`：服务器将被挂载到从 URL 的路径组件获取的路径上，例如，`some/page.md` 将从 `http://127.0.0.1:8000/foo/some/page/` 提供服务，以模仿预期的远程布局。

\*\*默认值\*\*：`null`

### repo\_url

设置后，将在每个页面上提供指向您的存储库（GitHub、Bitbucket、GitLab 等）的链接。

```shell

repo_url: https://github.com/example/repository/
```

\*\*默认值\*\*：`null`

### repo\_name

设置后，将在每个页面上提供指向您的存储库的链接的名称。

\*\*默认值\*\*：如果 `repo_url` 与这些域名匹配，则为 `'GitHub'`、`'Bitbucket'` 或 `'GitLab'`，否则为 `repo_url` 中的域名。

### edit\_uri

从基本 `repo_url` 到直接查看页面时文档目录的路径，考虑存储库主机（例如 GitHub、Bitbucket 等）、分支和文档目录本身的具体情况。MkDocs 会连接 `repo_url` 和 `edit_uri`，并将页面的输入路径附加到后面。

设置后，如果您的主题支持，将提供一个指向源存储库中页面的直接链接。这使得更容易找到和编辑页面的源代码。如果未设置 `repo_url`，则会忽略此选项。在某些主题中，设置此选项可能会导致编辑链接用于代替存储库链接。其他主题可能会显示两个链接。

`edit_uri` 支持查询（'?'）和片段（'#'）字符。对于使用查询或片段来访问文件的存储库主机，`edit_uri` 可能会如下设置。（请注意 URI 中的 `?` 和 `#`...）

```shell


edit_uri: '?query=root/path/docs/'
```

```shell


edit_uri: '#root/path/docs/'
```

对于其他存储库主机，只需指定文档目录的相对路径。

```shell


edit_uri: root/path/docs/
```

例如，具有以下配置

```shell

repo_url: https://example.com/project/repo
edit_uri: blob/main/docs/
```

意味着名为 'foo/bar.md' 的页面将具有指向以下位置的编辑链接  
[https://example.com/project/repo/blob/main/docs/foo/bar.md](https://example.com/project/repo/blob/main/docs/foo/bar.md)

`edit_uri` 实际上可以是一个绝对 URL，不一定相对于 `repo_url`，因此可以达到相同的效果

```shell

edit_uri: https://example.com/project/repo/blob/main/docs/
```

要获得更多灵活性，请参阅下面的 [edit\_uri\_template](#edit_uri_template)。

注意

在一些已知的托管网站（特别是 GitHub、Bitbucket 和 GitLab）上，`edit_uri` 是从 'repo\_url' 派生的，不需要手动设置。只需定义一个 `repo_url` 就会自动填充 `edit_uri` 配置设置。

例如，对于 GitHub 或 GitLab 托管的存储库，`edit_uri` 将自动设置为 `edit/master/docs/`（请注意 `edit` 路径和 `master` 分支）。

对于 Bitbucket 托管的存储库，等效的 `edit_uri` 将自动设置为 `src/default/docs/`（请注意 `src` 路径和 `default` 分支）。

要使用与默认设置不同的 URI（例如不同的分支），只需将 `edit_uri` 设置为您想要的字符串。如果您不想在页面上显示任何“编辑 URL 链接”，请将 `edit_uri` 设置为空字符串以禁用自动设置。

警告

在 GitHub 和 GitLab 上，默认的“编辑”路径（`edit/master/docs/`）会在在线编辑器中打开页面。此功能要求用户拥有并登录到 GitHub/GitLab 帐户。否则，用户将被重定向到登录/注册页面。或者，使用“blob”路径（`blob/master/docs/`）打开只读视图，该视图支持匿名访问。

\*\*默认值\*\*：如果 `repo_url` 与这些域名匹配，则对于 GitHub 和 GitLab 存储库为 `edit/master/docs/`，对于 Bitbucket 存储库为 `src/default/docs/`，否则为 `null`

### edit\_uri\_template

[edit\_uri](#edit_uri) 的更灵活的变体。这两个是等效的

```shell

edit_uri: 'blob/main/docs/'
edit_uri_template: 'blob/main/docs/{path}'
```

（它们也是互斥的——不要同时指定两者）。

从这里开始，您可以更改路径的位置或格式，以防默认的附加路径行为不够。

`edit_uri_template` 的内容是正常的 [Python 格式字符串](https://docs.pythonlang.cn/3/library/string.html#formatstrings)，只有以下字段可用

*   `{path}`，例如 `foo/bar.md`
*   `{path_noext}`，例如 `foo/bar`

转换标志 `!q` 可用，用于对字段进行百分比编码

*   `{path!q}`，例如 `foo%2Fbar.md`

建议的实用配置

*   GitHub Wiki  
    （例如 `https://github.com/project/repo/wiki/foo/bar/_edit`）
    
    ```shell
    
    repo_url: 'https://github.com/project/repo/wiki'
    edit_uri_template: '{path_noext}/_edit'
    ```
    
*   BitBucket 编辑器  
    （例如 `https://bitbucket.org/project/repo/src/master/docs/foo/bar.md?mode=edit`）
    
    ```shell
    
    repo_url: 'https://bitbucket.org/project/repo/'
    edit_uri_template: 'src/master/docs/{path}?mode=edit'
    ```
    
*   GitLab 静态站点编辑器  
    （例如 `https://gitlab.com/project/repo/-/sse/master/docs%2Ffoo%2bar.md`）
    
    ```shell
    
    repo_url: 'https://gitlab.com/project/repo'
    edit_uri_template: '-/sse/master/docs%2F{path!q}'
    ```
    
*   GitLab Web IDE  
    （例如 `https://gitlab.com/-/ide/project/repo/edit/master/-/docs/foo/bar.md`）
    
    ```shell
    
    edit_uri_template: 'https://gitlab.com/-/ide/project/repo/edit/master/-/docs/{path}'
    ```
    

\*\*默认值\*\*：`null`

### site\_description

设置站点描述。这将在生成的 HTML 头部添加一个元标签。

\*\*默认值\*\*：`null`

设置作者姓名。这将在生成的 HTML 头部添加一个元标签。

\*\*默认值\*\*：`null`

### copyright

设置要由主题包含在文档中的版权信息。

\*\*默认值\*\*：`null`

### remote\_branch

使用 `gh-deploy` 部署到 GitHub Pages 时，设置要提交到的远程分支。此选项可以被 `gh-deploy` 中的命令行选项覆盖。

\*\*默认值\*\*：`gh-pages`

### remote\_name

使用 `gh-deploy` 部署到 GitHub Pages 时，设置要推送到远程的名称。此选项可以被 `gh-deploy` 中的命令行选项覆盖。

\*\*默认值\*\*：`origin`

文档布局
-------------------------------------

### nav

此设置用于确定网站全局导航的格式和布局。最小的导航配置可能如下所示

```shell

nav:
  - 'index.md'
  - 'about.md'
```

导航配置中的所有路径都必须相对于 [`docs_dir`](#docs_dir) 配置选项。有关更详细的分解（包括如何创建子部分），请参阅有关 [配置页面和导航](https://mkdocs.cn/user-guide/writing-your-docs/#configure-pages-and-navigation) 的部分。

导航项目也可以包含指向外部网站的链接。虽然内部链接的标题是可选的，但外部链接的标题是必需的。外部链接可以是完整的 URL 或相对 URL。在文件中找不到的任何路径都被认为是外部链接。请参阅有关 [元数据](https://mkdocs.cn/user-guide/writing-your-docs/#meta-data) 的部分，了解 MkDocs 如何确定文档的页面标题。

```shell

nav:
  - Introduction: 'index.md'
  - 'about.md'
  - 'Issue Tracker': 'https://example.com/'
```

在上面的示例中，前两个项目指向本地文件，而第三个项目指向外部网站。

但是，有时 MkDocs 网站托管在项目网站的子目录中，您可能希望链接到同一网站的其他部分而不包含完整的域名。在这种情况下，您可以使用适当的相对 URL。

```shell

site_url: https://example.com/foo/

nav:
  - Home: '../'
  - 'User Guide': 'user-guide.md'
  - 'Bug Tracker': '/bugs/'
```

在上面的示例中，使用了两种不同的外部链接样式。首先，请注意 `site_url` 指示 MkDocs 网站托管在域名的 `/foo/` 子目录中。因此，“主页”导航项目是一个相对链接，它向上移动一级到服务器根目录，实际上指向 `https://example.com/`。“Bug 跟踪器”项目使用服务器根目录的绝对路径，实际上指向 `https://example.com/bugs/`。当然，“用户指南”指向本地 MkDocs 页面。

\*\*默认值\*\*：默认情况下，`nav` 将包含在 `docs_dir` 及其子目录中找到的所有 Markdown 文件的字母数字排序的嵌套列表。索引文件将在子部分中始终首先列出。

### exclude\_docs

1.5 版新增

1.6 版已更改

此配置不再应用 `mkdocs serve` 的“草稿”功能。如果您有希望在“serve”中可用但不在“build”中可用的草稿文档，请将 `exclude_docs` 替换为新的 [`draft_docs`](#draft_docs) 配置选项。

此配置定义了不应被提取到构建站点中的文件（在 [`docs_dir`](#docs_dir) 下）的模式。

示例

```shell

exclude_docs: |
  api-config.json    # A file with this name anywhere.
  /requirements.txt  # Top-level "docs/requirements.txt".
  *.py               # Any file with this extension anywhere.
  !/foo/example.py   # But keep this particular file.
```

这遵循 [.gitignore 模式格式](https://git-scm.cn/docs/gitignore#_pattern_format)。

以下默认值始终隐式预先附加 - 排除点文件（和目录）以及顶层 `templates` 目录

```shell

exclude_docs: |
  .*
  /templates/
```

因此，为了真正从头开始此配置，您需要首先指定这些条目的否定版本。

否则，您可以例如选择将某些点文件重新包含到站点中

```shell

exclude_docs: |
  !.assets  
```

### draft\_docs

1.6 版新增

此配置定义了被视为草稿的文件（在 [`docs_dir`](#docs_dir) 下）的模式。草稿文件在 `mkdocs serve` 期间可用，并包含“DRAFT”标记，但不会包含在构建中。要防止这种影响并使“serve”的行为与“build”相同，您可以运行 `mkdocs serve --clean`。

示例

```shell

draft_docs: |
  drafts/               # A "drafts" directory anywhere.
  _unpublished.md       # A md file ending in _unpublished.md
  !/foo_unpublished.md  # But keep this particular file.
```

这遵循 [.gitignore 模式格式](https://git-scm.cn/docs/gitignore#_pattern_format)。

### not\_in\_nav

1.5 版新增

1.6 版新增

如果完全没有指定 [`nav`](#nav) 配置，则此配置中指定的页面现在将从推断的导航中排除。

如果您想将一些文档包含到站点中，但有意将其从导航中排除，通常 MkDocs 会对此发出警告。

将这些文件模式（相对于 [`docs_dir`](#docs_dir)）添加到 `not_in_nav` 配置中将阻止此类警告。

示例

```shell

nav:
  - Foo: foo.md
  - Bar: bar.md

not_in_nav: |
  /private.md
```

与前面的选项一样，这遵循 .gitignore 模式格式。

### validation

1.5 版新增

配置 MkDocs 在验证文档链接时诊断消息的严格程度。

这是一个配置树，每个配置的值可以是以下三种之一：`warn`、`info`、`ignore`。它们会导致生成相应严重级别的日志消息。`warn`级别当然是为了在使用`mkdocs build --strict`（在这种情况下它会成为错误）时使用，您可以在持续测试中使用它。

配置`validation.links.absolute_links`还具有一个特殊值`relative_to_docs`，用于[验证绝对链接](#validation-of-absolute-links)。

MkDocs 1.6 版本中的此配置默认值```shell

validation:
  nav:
    omitted_files: info
    not_found: warn
    absolute_links: info
  links:
    not_found: warn
    anchors: info
    absolute_links: info
    unrecognized_links: info
```

（注意：你不应该复制整个示例，因为它只是重复了默认值。只应该设置与默认值不同的单个项目。）

一些行为的默认值已经与 MkDocs 1.4 及更低版本不同——它们以前会被忽略。

配置 MkDocs 1.6 使其行为与 MkDocs 1.4 及更低版本相同（降低严格度）```shell

validation:
  absolute_links: ignore
  unrecognized_links: ignore
  anchors: ignore
```

大多数网站的推荐设置（最大严格度）
```shell

validation:
  omitted_files: warn
  absolute_links: warn  
  unrecognized_links: warn
  anchors: warn  
```

注意，在上面的示例中，我们省略了“nav”和“links”键。这里的`absolute_links:`表示设置`nav: absolute_links:`和`links: absolute_links:`。

所有值的完整列表以及可以隐藏或使它们更突出的日志消息示例

*   `validation.nav.omitted_files`
    *   > 以下页面存在于 docs 目录中，但未包含在“nav”配置中：...
    
*   `validation.nav.not_found`
    *   > 在“nav”配置中包含一个指向“foo/bar.md”的引用，但文档文件中未找到该引用。
        
    *   > 在“nav”配置中包含一个指向“foo/bar.md”的引用，但此文件已从构建的站点中排除。
    
*   `validation.nav.absolute_links`
    *   > 在“nav”配置中包含一个指向“/foo/bar.html”的绝对路径，它可能指向一个外部资源。
        

*   `validation.links.not_found`
    *   > 文档文件“example.md”包含一个指向“../foo/bar.md”的链接，但目标文件未在文档文件中找到。
        
    *   > 文档文件“example.md”包含一个指向“foo/bar.md”的链接，但该文件已从构建的站点中排除。
    
*   `validation.links.anchors`
    *   > 文档文件“example.md”包含一个指向“../foo/bar.md#some-heading”的链接，但文档“foo/bar.md”不包含锚点“#some-heading”。
        
    *   > 文档文件“example.md”包含一个指向“#some-heading”的链接，但此页面上没有这样的锚点。
    
*   `validation.links.absolute_links`
    *   > 文档文件“example.md”包含一个绝对链接“/foo/bar.html”，它保持不变。你是否想要使用“foo/bar.md”？
    
*   `validation.links.unrecognized_links`
    *   > 文档文件“example.md”包含一个无法识别的相对链接“../foo/bar/”，它保持不变。你是否想要使用“foo/bar.md”？
        
    *   > 文档文件“example.md”包含一个无法识别的相对链接“mail@example.com”，它保持不变。你是否想要使用“mailto:mail@example.com”？
        

#### 验证绝对链接

1.6 版新增

> 从历史上看，在 Markdown 中，MkDocs 只识别指向另一个物理`*.md`文档（或媒体文件）的**相对**链接。这是一个很好的约定，因为这样源页面也可以在没有 MkDocs 的情况下自由浏览，例如在 GitHub 上。而绝对链接则保持不变（通常无法按预期工作）或，更近期的做法是，发出警告。如果你不喜欢总是使用相对链接，现在你可以选择使用绝对链接，并使它们正常工作。

如果你将设置`validation.links.absolute_links`设置为新值`relative_to_docs`，所有以`/`开头的 Markdown 链接都将被理解为相对于`docs_dir`根目录。然后，将根据之前 MkDocs 版本中对相对链接有效的其他所有规则验证链接是否正确。对于 HTML 输出，这些链接仍将被转换为相对链接，以便站点仍然可靠地工作。

因此，现在任何文档（例如“dir1/foo.md”）都可以使用`[link](/dir2/bar.md)`链接到文档“dir2/bar.md”，除了之前唯一正确的方式`[link](../dir2/bar.md)`。

但是，您必须启用该设置。默认情况下，链接仍然会被跳过。

识别绝对链接并验证它们的设置

```shell

validation:
  links:
    absolute_links: relative_to_docs
    anchors: warn
    unrecognized_links: warn
```

构建目录
----------------------------------

### 主题

设置文档网站的主题和主题特定配置。可以是字符串或一组键值对。

如果为字符串，则它必须是已知已安装主题的字符串名称。要查看可用主题列表，请访问[选择您的主题](https://mkdocs.cn/user-guide/choosing-your-theme/)。

一组键值对的示例可能如下所示

```shell

theme:
  name: mkdocs
  locale: en
  custom_dir: my_theme_customizations/
  static_templates:
    - sitemap.html
  include_sidebar: false
```

如果为一组键值对，则可以定义以下嵌套键块

#### 名称

已知已安装主题的字符串名称。要查看可用主题列表，请访问[选择您的主题](https://mkdocs.cn/user-guide/choosing-your-theme/)。

#### 区域设置

表示您网站语言的代码。有关详细信息，请参阅[本地化您的主题](https://mkdocs.cn/user-guide/localizing-your-theme/)。

#### custom\_dir

包含自定义主题的目录。它可以是相对目录，在这种情况下，它将相对于包含您的配置文件的目录解析，也可以是本地文件系统根目录的绝对目录路径。

如果您想调整现有主题，请参阅[自定义您的主题](https://mkdocs.cn/user-guide/customizing-your-theme/#using-the-theme-custom_dir)了解详细信息。

如果您想从头开始构建自己的主题，请参阅[主题开发人员指南](https://mkdocs.cn/dev-guide/themes/)。

#### static\_templates

要渲染为静态页面的模板列表。这些模板必须位于主题的模板目录或主题配置中定义的`custom_dir`中。

#### （主题特定关键字）

主题支持的任何其他关键字也可以定义。有关详细信息，请参阅您正在使用的主题的文档。

**默认值**：`'mkdocs'`

### docs\_dir

包含文档源 Markdown 文件的目录。它可以是相对目录，在这种情况下，它将相对于包含您的配置文件的目录解析，也可以是本地文件系统根目录的绝对目录路径。

**默认值**：`'docs'`

### site\_dir

创建输出 HTML 和其他文件的目录。它可以是相对目录，在这种情况下，它将相对于包含您的配置文件的目录解析，也可以是本地文件系统根目录的绝对目录路径。

**默认值**：`'site'`

注意

如果您正在使用源代码控制，您通常需要确保您的_构建输出_文件不会被提交到存储库中，并且只保留存储库中的_源_文件。例如，如果使用`git`，您可以在`.gitignore`文件中添加以下行

```shell

site/
```

如果您正在使用其他源代码控制工具，您需要查看其文档，了解如何忽略特定目录。

设置要由主题包含的 CSS 文件列表（相对于`docs_dir`），通常以`<link>`标签的形式。

示例

```shell

extra_css:
  - css/extra.css
  - css/second_extra.css
```

**默认值**：`[]`（空列表）。

设置`docs_dir`中的 JavaScript 文件列表，要由主题包含，以`<script>`标签的形式。

在版本 1.5 中更改

旧版本的 MkDocs 仅支持简单的字符串列表，但现在可以使用几个其他配置键：`type`、`async`、`defer`。

查看示例以及它们生成的输出

```shell

extra_javascript:
  - some_plain_javascript.js       
        
  - implicitly_as_module.mjs       
        
  - path: explicitly_as_module.mjs 
    type: module
  - path: deferred_plain.js        
    defer: true
  - path: scripts/async_module.mjs 
    type: module
    async: true
```

因此，每个项目都可以是

*   一个简单的字符串，或者
*   一个映射，它包含必需的`path`键和 3 个可选键`type`（字符串）、`async`（布尔值）、`defer`（布尔值）。

只有简单的字符串变体检测到`.mjs`扩展名并添加`type="module"`，否则无论扩展名是什么，都必须写出`type: module`。

**默认值**：`[]`（空列表）。

注意

`*.js`和`*.css`文件，就像其他类型的文件一样，始终从`docs_dir`复制到站点的部署副本中，无论它们是否通过上述配置链接到页面。

设置`docs_dir`中的模板列表，要由 MkDocs 构建。要了解有关为 MkDocs 编写模板的更多信息，请阅读有关[自定义主题](https://mkdocs.cn/dev-guide/themes/)的文档，特别是有关[模板可用变量](https://mkdocs.cn/dev-guide/themes/#template-variables)的部分。查看[extra\_css](#extra_css)中的示例以了解用法。

**默认值**：`[]`（空列表）。

一组键值对，其中值可以是任何有效的 YAML 结构，这些结构将传递给模板。这在创建自定义主题时提供了极大的灵活性。

例如，如果您正在使用支持显示项目版本的主题，您可以像这样将其传递给主题

```shell

extra:
  version: 1.0
```

**默认值**：默认情况下，`extra`将是一个空的键值映射。

预览控件
---------------------------------

实时重新加载
---------------------------------

### watch

确定在运行`mkdocs serve`时要监视的其他目录。配置是一个 YAML 列表。

```shell

watch:
  - directory_a
  - directory_b
```

允许设置自定义默认值，而无需每次调用`mkdocs serve`命令时都通过`-w`/`--watch`选项传递它。

注意

配置文件中提供的路径相对于配置文件。

通过`-w`/`--watch` CLI 参数提供的路径则不是。

### use\_directory\_urls

此设置控制生成的文档的目录结构，从而控制用于链接到页面的 URL 格式。

以下表格展示了在将`use_directory_urls`设置为`true`或`false`时，站点上使用的目录结构和 URL 如何不同。

**`use_directory_urls: false`**

当文档托管在无法访问文件`X/index.html`（当给出 URL`X`时）的系统上时，需要此设置。当设置为`false`时，不会创建额外的`X`目录，该文件将简单地存储为`X.html`。创建的链接直接指向目标_文件_，而不是目标_目录_。

| 源文件 | 生成的 文件 | URL 格式 |
| --- | --- | --- |
| index.md | index.html | /index.html |
| api-guide.md | api-guide.html | /api-guide.html |
| about/license.md | about/license.html | /about/license.html |

例如，当以下情况发生时，需要将其设置为`false`

*   直接从文件系统打开页面
*   将文档发布到静态 S3 网站。

**`use_directory_urls: true`**

`use_directory_urls: true`的默认样式会创建更友好的 URL，通常是您想要使用的样式。

| 源文件 | 生成的 文件 | URL 格式 |
| --- | --- | --- |
| index.md | /index.html | / |
| api-guide.md | /api-guide/index.html | /api-guide/ |
| about/license.md | /about/license/index.html | /about/license |

**默认值**：`true`

### strict

确定如何处理警告。设置为`true`表示在出现警告时停止处理。设置为`false`表示打印警告并继续处理。

它也可以作为命令行标志使用：`--strict`。

**默认值**：`false`

### dev\_addr

确定在运行`mkdocs serve`时使用的地址。必须为`IP:PORT`格式。

允许设置自定义默认值，而无需每次调用`mkdocs serve`命令时都通过`--dev-addr`选项传递它。

**默认值**：`'127.0.0.1:8000'`

另请参阅：[site\_url](#site_url)。

格式选项
-----------------------------------

### markdown\_extensions

MkDocs 使用 [Python Markdown](https://python-markdown.github.io/) 库将 Markdown 文件转换为 HTML。Python Markdown 支持各种 [扩展](https://python-markdown.github.io/extensions/)，这些扩展自定义页面格式化方式。此设置允许您启用除 MkDocs 默认使用的扩展（`meta`、`toc`、`tables` 和 `fenced_code`）之外的扩展列表。

例如，要启用 [SmartyPants 排版扩展](https://python-markdown.github.io/extensions/smarty/)，请使用

```shell

markdown_extensions:
  - smarty
```

一些扩展提供自己的配置选项。如果您想设置任何配置选项，那么您可以嵌套一个键值映射（`option_name: option value`），其中包含任何给定扩展支持的选项。请参阅您正在使用的扩展的文档以确定它们支持哪些选项。

例如，要在（包含的）`toc` 扩展中启用永久链接，请使用

```shell

markdown_extensions:
  - toc:
      permalink: true
```

请注意，冒号（`:`）必须跟随扩展名（`toc`），然后在新行上，选项名和值必须缩进并用冒号分隔。如果您想为单个扩展定义多个选项，则每个选项都必须定义在单独的行上

```shell

markdown_extensions:
  - toc:
      permalink: true
      separator: "_"
```

为每个扩展添加一个额外的列表项。如果您没有为特定扩展设置配置选项，则只需省略该扩展的选项

```shell

markdown_extensions:
  - smarty
  - toc:
      permalink: true
  - sane_lists
```

动态配置值

要动态配置扩展，您可以从 [环境变量](#environment-variables) 或 [获取路径](#paths-relative-to-the-current-file-or-site) 当前渲染的 Markdown 文件或整个 MkDocs 站点。

在上面的示例中，每个扩展都是一个列表项（以 `-` 开头）。作为替代方案，可以使用键值对。但是，在这种情况下，必须为没有定义选项的扩展提供空值。因此，上面的最后一个示例也可以定义如下

```shell

markdown_extensions:
  smarty: {}
  toc:
    permalink: true
  sane_lists: {}
```

如果您打算通过 [继承](#configuration-inheritance) 覆盖某些选项，则需要使用这种替代语法。

**默认值**：`[]`（空列表）。

### hooks

1.4 版本新增

一个指向 Python 脚本的路径列表（相对于 `mkdocs.yml`），这些脚本将被加载并用作 [插件](#plugins) 实例。

例如

```shell

hooks:
  - my_hooks.py
```

然后文件 `my_hooks.py` 可以包含任何 [插件事件处理程序](https://mkdocs.cn/dev-guide/plugins/#events)（不带 `self`），例如

```shell

def on_page_markdown(markdown, **kwargs):
    return markdown.replace('a', 'z')
```

高级示例

这将根据 Markdown 内容生成警告（并且警告在 [严格](#strict) 模式下是致命的）

```shell

import logging, re
import mkdocs.plugins

log = logging.getLogger('mkdocs')

@mkdocs.plugins.event_priority(-50)
def on_page_markdown(markdown, page, **kwargs):
    path = page.file.src_uri
    for m in re.finditer(r'\bhttp://[^) ]+', markdown):
        log.warning(f"Documentation file '{path}' contains a non-HTTPS link: {m[0]}")
```

与 [插件](https://mkdocs.cn/dev-guide/plugins/) 相比，这不会启用任何新功能，它只是简化了一次性使用，因为它们不需要像插件那样_安装_。

请注意，对于 `mkdocs serve`，钩子模块_不会_在每次构建时重新加载。

您可能已经在 [mkdocs-simple-hooks 插件](https://github.com/aklajnert/mkdocs-simple-hooks) 中看到过此功能。如果使用标准方法名，它可以直接替换，例如

```shell

-plugins:
-  - mkdocs-simple-hooks:
-      hooks:
-        on_page_markdown: 'my_hooks:on_page_markdown'
+hooks:
+  - my_hooks.py
```

MkDocs 1.6 版本新增

如果钩子文件在其旁边有一个文件 `foo.py`，它可以使用正常的 Python 语法 `import foo` 来访问其函数。

在旧版本的 MkDocs 中，需要一个解决方法才能使其正常工作 - 将路径添加到 `sys.path`。

### plugins

一个插件列表（带有可选的配置设置），用于在构建站点时使用。有关完整详细信息，请参阅 [插件](https://mkdocs.cn/dev-guide/plugins/) 文档。

**默认值**：`['search']`（与 MkDocs 捆绑的“search”插件）。

如果 `plugins` 配置设置在 `mkdocs.yml` 配置文件中定义，则任何默认值（例如 `search`）都会被忽略，并且如果您想继续使用它们，则需要显式重新启用默认值

```shell

plugins:
  - search
  - your_other_plugin
```

要定义给定插件的选项，请使用嵌套的键值对

```shell

plugins:
  - search
  - your_other_plugin:
      option1: value
      option2: other value
```

要完全禁用所有插件（包括任何默认值），请将 `plugins` 设置设置为一个空列表

```shell

plugins: []
```

#### `enabled` 选项

MkDocs 1.6 版本新增

每个插件都有自己的选项键。但是，MkDocs 还会确保每个插件都具有 `enabled` 布尔选项。这可以用来有条件地启用特定插件，如以下示例所示

```shell

plugins:
  - search
  - code-validator:
      enabled: !ENV [LINT, false]
```

请参阅：[环境变量](#environment-variables)

#### 替代语法

在上面的示例中，每个插件都是一个列表项（以 `-` 开头）。作为替代方案，可以使用键值对。但是，在这种情况下，必须为没有定义选项的插件提供空值。因此，上面的最后一个示例也可以定义如下

```shell

plugins:
  search: {}
  your_other_plugin:
    option1: value
    option2: other value
```

如果您打算通过 [继承](#configuration-inheritance) 覆盖某些选项，则需要使用这种替代语法。

#### Search

MkDocs 默认提供了一个搜索插件，该插件使用 [lunr.js](https://lunrjs.com/) 作为搜索引擎。以下配置选项可用于更改搜索插件的行为

##### **separator**

一个正则表达式，它匹配用于构建索引的单词分隔符字符。默认情况下，使用空格和连字符（`-`）。要添加点（`.`）作为单词分隔符，您可以执行以下操作

```shell

plugins:
  - search:
      separator: '[\s\-\.]+'
```

**默认值**：`'[\s\-]+'`

##### **min\_search\_length**

一个整数值，用于定义搜索查询的最小长度。默认情况下，忽略长度小于 3 个字符的搜索，因为使用短搜索词的搜索结果质量很差。但是，对于某些用例（例如有关消息队列的文档，这些文档可能会生成对“MQ”的搜索），您可能更愿意设置更短的限制。

```shell

plugins:
  - search:
      min_search_length: 2
```

**默认值**: 3

##### **lang**

一个语言列表，用于构建搜索索引，这些语言由其 [ISO 639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) 语言代码标识。使用 [Lunr 语言](https://github.com/MihaiValentin/lunr-languages#lunr-languages-----)，支持以下语言

*   `ar`：阿拉伯语
*   `da`：丹麦语
*   `nl`：荷兰语
*   `en`：英语
*   `fi`：芬兰语
*   `fr`：法语
*   `de`：德语
*   `hu`：匈牙利语
*   `it`：意大利语
*   `ja`：日语
*   `no`：挪威语
*   `pt`：葡萄牙语
*   `ro`：罗马尼亚语
*   `ru`：俄语
*   `es`：西班牙语
*   `sv`：瑞典语
*   `th`：泰语
*   `tr`：土耳其语
*   `vi`：越南语

您可以 [贡献其他语言](https://github.com/MihaiValentin/lunr-languages/blob/master/CONTRIBUTING.md)。

警告

虽然搜索支持一起使用多种语言，但最好不要添加其他语言，除非您确实需要它们。每添加一种语言都会增加带宽要求，并使用更多浏览器资源。通常，最好将每个 MkDocs 实例保留为单一语言。

注意

Lunr 语言目前不包含对中文或其他亚洲语言的支持。但是，一些用户报告说使用日语获得了不错的效果。

**默认值**：如果设置了 `theme.locale` 的值，则为该值，否则为 `[en]`。

##### **prebuild\_index**

可以选择生成所有页面的预构建索引，这将为较大的站点提供一些性能改进。在启用之前，请确认您正在使用的主题明确支持使用预构建索引（内置主题支持）。设置为 `true` 以启用。

警告

此选项要求安装 [Node.js](https://node.org.cn/) 并且命令 `node` 位于系统路径上。如果由于任何原因，对 `node` 的调用失败，则会发出警告，并且构建会继续进行，不会中断。您可以在构建时使用 `--strict` 标志，使这种故障引发错误而不是发出警告。

注意

在较小的站点上，不建议使用预构建索引，因为它会显著增加带宽要求，而不会对您的用户造成明显的改善。但是，对于较大的站点（数百个页面），带宽增加相对较小，您的用户会注意到搜索性能的显著提高。

**默认值**：`False`

##### **indexing**

配置搜索索引器在构建页面索引时将使用的策略。如果您项目的规模很大，并且索引占用了大量的磁盘空间，此属性尤其有用。

```shell

plugins:
  - search:
      indexing: 'full'
```

###### 选项

| 选项 | 描述 |
| --- | --- |
| `full` | 索引每个页面的标题、章节标题和全文。 |
| `sections` | 索引每个页面的标题和章节标题。 |
| `titles` | 仅索引每个页面的标题。 |

**默认值**：`full`

### 环境变量

在大多数情况下，配置选项的值直接在配置文件中设置。但是，作为一种选择，配置选项的值可以设置为环境变量的值，使用 `!ENV` 标签。例如，要将 `site_name` 选项的值设置为变量 `SITE_NAME` 的值，YAML 文件可以包含以下内容

```shell

site_name: !ENV SITE_NAME
```

如果环境变量未定义，则配置设置将被分配一个 `null`（或 Python 中的 `None`）值。可以将默认值定义为列表中的最后一个值。像这样

```shell

site_name: !ENV [SITE_NAME, 'My default site name']
```

也可以使用多个后备变量。请注意，最后一个值不是环境变量，而必须是作为默认值使用的值，如果未定义任何指定的环境变量，则使用该值。

```shell

site_name: !ENV [SITE_NAME, OTHER_NAME, 'My default site name']
```

在环境变量中定义的简单类型，例如字符串、布尔值、整数、浮点数、日期戳和空值，将被解析，就好像它们直接在 YAML 文件中定义一样，这意味着该值将被转换为适当的类型。但是，复杂类型，例如列表和键值对，不能在单个环境变量中定义。

有关更多详细信息，请参阅 [pyyaml\_env\_tag](https://github.com/waylan/pyyaml-env-tag) 项目。

### 相对于当前文件或站点的路径

1.5 版新增

某些 Markdown 扩展可能会从了解当前正在处理的 Markdown 文件的路径或当前站点的根路径中受益。为此，特殊标签 \`!relative\` 可用于配置文件中的大多数上下文中，尽管唯一已知的用例是在 [`markdown_extensions`](#markdown_extensions) 中。

以下是可能值的示例

```shell

- !relative  
- !relative $docs_dir  
- !relative $config_dir  
- !relative $config_dir/some/child/dir  
```

(此处，\`$docs\_dir\` 和 \`$config\_dir\` 是当前_唯一_识别的特殊前缀。)

示例

```shell

markdown_extensions:
  - pymdownx.snippets:
      base_path: !relative  
```

这允许 [pymdownx.snippets](https://facelessuser.github.io/pymdown-extensions/extensions/snippets/) 扩展包含相对于当前 Markdown 文件的文件，而没有此标签，它将无法知道。

注意

即使是默认情况，任何扩展的基路径在技术上都是_当前工作目录_，尽管假设它是_mkdocs.yml 的目录_。所以，即使您不希望路径是相对路径，为了改善默认行为，始终建议使用此习惯用法

```shell

markdown_extensions:
  - pymdownx.snippets:
      base_path: !relative $config_dir  
```

配置继承
------------------------------------------

通常，单个文件将保存站点的完整配置。但是，一些组织可能会维护多个站点，这些站点共享一个共同的配置。与其为每个站点维护单独的配置，不如在父配置文件中定义共同的配置选项，每个站点的主要配置文件都继承自该父配置文件。

要定义配置文件的父级，请将 \`INHERIT\`（全部大写）键设置为父文件的路径。该路径必须相对于主要文件的路径。

为了将配置选项与父配置合并，这些选项必须定义为键值对。具体来说，[markdown\_extensions](#markdown_extensions) 和 [plugins](#plugins) 选项必须使用不使用列表项（以 \`-\` 开头的行）的替代语法。

例如，假设公共（父）配置在 \`base.yml\` 中定义

```shell

theme:
  name: mkdocs
  locale: en
  highlightjs: true

markdown_extensions:
  toc:
    permalink: true
  admonition: {}
```

然后，对于“foo”站点，主要配置文件将定义在 \`foo/mkdocs.yml\` 中

```shell

INHERIT: ../base.yml
site_name: Foo Project
site_url: https://example.com/foo
```

在运行 \`mkdocs build\` 时，\`foo/mkdocs.yml\` 中的文件将作为配置文件传入。MkDocs 然后将解析该文件，检索并解析父文件 \`base.yml\`，并将这两个文件深度合并。这将导致 MkDocs 收到以下合并的配置

```shell

site_name: Foo Project
site_url: https://example.com/foo

theme:
  name: mkdocs
  locale: en
  highlightjs: true

markdown_extensions:
  toc:
    permalink: true
  admonition: {}
```

深度合并允许您在主要配置文件中添加和/或覆盖各种值。例如，假设对于一个站点，您想要添加对定义列表的支持，使用不同的符号作为永久链接，并定义不同的分隔符。在该站点的主要配置文件中，您可以执行以下操作

```shell

INHERIT: ../base.yml
site_name: Bar Project
site_url: https://example.com/bar

markdown_extensions:
  def_list: {}
  toc:
    permalink: 
    separator: "_"
```

在这种情况下，上面的配置将与 \`base.yml\` 深度合并，并生成以下配置

```shell

site_name: Bar Project
site_url: https://example.com/bar

theme:
  name: mkdocs
  locale: en
  highlightjs: true

markdown_extensions:
  def_list: {}
  toc:
    permalink: 
    separator: "_"
  admonition: {}
```

注意，\`admonition\` 扩展是从父配置中保留的，\`def\_list\` 扩展已添加，\`toc.permalink\` 的值已替换，\`toc.separator\` 的值已添加。

您可以替换或合并任何键的值。但是，任何非键始终会被替换。因此，您无法将项目附加到列表。您必须重新定义整个列表。

由于 [nav](#nav) 配置由嵌套列表组成，这意味着您无法合并导航项。当然，您可以用新的配置替换整个 \`nav\` 配置。但是，通常期望整个导航将在项目的“主要配置文件”中定义。

警告

提醒一下，所有基于路径的配置选项必须相对于主要配置文件，MkDocs 在合并时不会更改路径。因此，在继承自多个不同站点的父文件中定义路径可能无法按预期工作。通常最好只在主要配置文件中定义基于路径的选项。

继承也可以用作在命令行中快速覆盖键的方法 - 通过使用标准输入作为配置文件。例如

```shell

echo '{INHERIT: mkdocs.yml, site_name: "Renamed site"}' | mkdocs build -f -
```

MkDocs - 使用 Markdown 的项目文档。

**用法**

```shell

mkdocs [OPTIONS] COMMAND [ARGS]...
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-V`, `--version` | 布尔值 | 显示版本并退出。 | `False` |
| `-q`, `--quiet` | 布尔值 | 静默警告 | `False` |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `--color` / `--no-color` | 布尔值 | 强制启用或禁用输出的颜色和换行。默认值为自动检测。 | 无 |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |

**子命令**

*   _[build](#mkdocs-build)_: 构建 MkDocs 文档
*   _[get-deps](#mkdocs-get-deps)_: 显示从 mkdocs.yml 中的插件推断出的所需 PyPI 包
*   _[gh-deploy](#mkdocs-gh-deploy)_: 将您的文档部署到 GitHub Pages
*   _[new](#mkdocs-new)_: 创建一个新的 MkDocs 项目
*   _[serve](#mkdocs-serve)_: 运行内置开发服务器

mkdocs build
-----------------------------------------------

构建 MkDocs 文档

**用法**

```shell

mkdocs build [OPTIONS]
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-c`, `--clean` / `--dirty` | 布尔值 | 在构建之前从 site\_dir 中删除旧文件（默认值）。 | `True` |
| `-f`, `--config-file` | 文件名 | 提供一个特定的 MkDocs 配置。这可以是一个文件名，或者 '-' 从 stdin 读取。 | 无 |
| `-s`, `--strict` / `--no-strict` | 布尔值 | 启用严格模式。这将导致 MkDocs 在出现任何警告时中止构建。 | 无 |
| `-t`, `--theme` | 选择（`mkdocs` | `readthedocs`） | 构建文档时要使用的主题。 | 无 |
| `--use-directory-urls` / `--no-directory-urls` | 布尔值 | 在构建页面时使用目录 URL（默认值）。 | 无 |
| `-d`, `--site-dir` | 路径 | 要输出文档构建结果的目录。 | 无 |
| `-q`, `--quiet` | 布尔值 | 静默警告 | `False` |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |

mkdocs get-deps
-----------------------------------------------------

显示从 mkdocs.yml 中的插件推断出的所需 PyPI 包

**用法**

```shell

mkdocs get-deps [OPTIONS]
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `-f`, `--config-file` | 文件名 | 提供一个特定的 MkDocs 配置。这可以是一个文件名，或者 '-' 从 stdin 读取。 | 无 |
| `-p`, `--projects-file` | 文本 | 声明所有已知与 MkDocs 相关的项目的注册表文件的 URL 或本地路径。 | `https://raw.githubusercontent.com/mkdocs/catalog/main/projects.yaml` |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |

mkdocs gh-deploy
-------------------------------------------------------

将您的文档部署到 GitHub Pages

**用法**

```shell

mkdocs gh-deploy [OPTIONS]
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-c`, `--clean` / `--dirty` | 布尔值 | 在构建之前从 site\_dir 中删除旧文件（默认值）。 | `True` |
| `-m`, `--message` | 文本 | 在提交到 GitHub Pages 远程分支时要使用的提交消息。Commit {sha} 和 MkDocs {version} 可用作扩展 | 无 |
| `-b`, `--remote-branch` | 文本 | 要提交到 GitHub Pages 的远程分支。这将覆盖配置中指定的 value | 无 |
| `-r`, `--remote-name` | 文本 | 要提交到 GitHub Pages 的远程名称。这将覆盖配置中指定的 value | 无 |
| `--force` | 布尔值 | 强制推送到存储库。 | `False` |
| `--no-history` | 布尔值 | 用一个新的提交替换整个 Git 历史记录。 | `False` |
| `--ignore-version` | 布尔值 | 忽略使用旧版本的 MkDocs 部署构建的检查。 | `False` |
| `--shell` | 布尔值 | 在调用 Git 时使用 shell。 | `False` |
| `-f`, `--config-file` | 文件名 | 提供一个特定的 MkDocs 配置。这可以是一个文件名，或者 '-' 从 stdin 读取。 | 无 |
| `-s`, `--strict` / `--no-strict` | 布尔值 | 启用严格模式。这将导致 MkDocs 在出现任何警告时中止构建。 | 无 |
| `-t`, `--theme` | 选择（`mkdocs` | `readthedocs`） | 构建文档时要使用的主题。 | 无 |
| `--use-directory-urls` / `--no-directory-urls` | 布尔值 | 在构建页面时使用目录 URL（默认值）。 | 无 |
| `-d`, `--site-dir` | 路径 | 要输出文档构建结果的目录。 | 无 |
| `-q`, `--quiet` | 布尔值 | 静默警告 | `False` |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |

mkdocs new
-------------------------------------------

创建一个新的 MkDocs 项目

**用法**

```shell

mkdocs new [OPTIONS] PROJECT_DIRECTORY
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-q`, `--quiet` | 布尔值 | 静默警告 | `False` |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |

mkdocs serve
-----------------------------------------------

运行内置开发服务器

**用法**

```shell

mkdocs serve [OPTIONS]
```

**选项**

| 名称 | 类型 | 描述 | 默认值 |
| --- | --- | --- | --- |
| `-a`, `--dev-addr` | 文本 | 用于在本地提供文档的 IP 地址和端口（默认值：localhost:8000） | 无 |
| `--no-livereload` | 布尔值 | 禁用开发服务器中的实时重新加载。 | `False` |
| `--dirty` | 文本 | 仅重新构建已更改的文件。 | `False` |
| `-c`, `--clean` | 文本 | 构建网站，没有任何 `mkdocs serve` 的影响 - 纯粹的 `mkdocs build`，然后服务。 | `False` |
| `--watch-theme` | 布尔值 | 将主题包含在要监视以进行实时重新加载的文件列表中。在不使用实时重新加载时忽略。 | `False` |
| `-w`, `--watch` | 路径 | 要监视以进行实时重新加载的目录或文件。可以多次提供。 | `[]` |
| `-f`, `--config-file` | 文件名 | 提供一个特定的 MkDocs 配置。这可以是一个文件名，或者 '-' 从 stdin 读取。 | 无 |
| `-s`, `--strict` / `--no-strict` | 布尔值 | 启用严格模式。这将导致 MkDocs 在出现任何警告时中止构建。 | 无 |
| `-t`, `--theme` | 选择（`mkdocs` | `readthedocs`） | 构建文档时要使用的主题。 | 无 |
| `--use-directory-urls` / `--no-directory-urls` | 布尔值 | 在构建页面时使用目录 URL（默认值）。 | 无 |
| `-q`, `--quiet` | 布尔值 | 静默警告 | `False` |
| `-v`, `--verbose` | 布尔值 | 启用详细输出 | `False` |
| `--help` | 布尔值 | 显示此消息并退出。 | `False` |


部署您的文档到各种托管提供商的基本指南

* * *

GitHub Pages
-------------------------------------

如果您在 [GitHub](https://github.com/) 上托管项目的源代码，您可以轻松地使用 [GitHub Pages](https://pages.github.com/) 托管项目的文档。有两种基本类型的 [GitHub Pages 网站](https://githubdocs.cn/en/pages/getting-started-with-github-pages/about-github-pages#types-of-github-pages-sites)：项目页面网站和用户和组织页面网站。它们几乎相同，但有一些重要的区别，在部署时需要不同的工作流程。

### 项目页面

项目页面网站更简单，因为网站文件将部署到项目存储库中的一个分支（默认情况下为 `gh-pages`）。在您 `checkout` 项目源文档所在的 git 存储库的主要工作分支（通常是 `master`）后，运行以下命令

```shell

mkdocs gh-deploy
```

就是这样！在幕后，MkDocs 会构建您的文档并使用 [ghp-import](https://github.com/davisp/ghp-import) 工具将它们提交到 `gh-pages` 分支并将 `gh-pages` 分支推送到 GitHub。

使用 `mkdocs gh-deploy --help` 获取 `gh-deploy` 命令可用选项的完整列表。

请注意，您将无法在将构建的站点推送到 GitHub 之前查看它。因此，您可能需要先使用 `build` 或 `serve` 命令验证对文档所做的任何更改，并在本地查看构建的文件。

警告

如果您使用的是 `gh-deploy` 命令，则永远不要手动编辑页面存储库中的文件，因为下次运行该命令时您将丢失工作。

警告

如果在运行 `mkdocs gh-deploy` 的本地存储库中存在未跟踪的文件或未提交的工作，这些文件将包含在部署的页面中。

### 组织和用户页面

用户和组织页面网站与特定项目无关，网站文件部署到名为 GitHub 帐户名的专用存储库的 `master` 分支中。因此，您需要在我们的本地系统上拥有两个存储库的工作副本。例如，考虑以下文件结构

```shell

my-project/
    mkdocs.yml
    docs/
orgname.github.io/
```

在对项目进行更新并验证更新后，您需要将目录更改为 `orgname.github.io` 存储库，并从那里调用 `mkdocs gh-deploy` 命令

```shell

cd ../orgname.github.io/
mkdocs gh-deploy --config-file ../my-project/mkdocs.yml --remote-branch master
```

请注意，您需要显式地指向 `mkdocs.yml` 配置文件，因为它不再位于当前工作目录中。您还需要通知部署脚本提交到 `master` 分支。您可以使用 [remote\_branch](https://mkdocs.cn/user-guide/configuration/#remote_branch) 配置设置覆盖默认值，但是如果您忘记在运行部署脚本之前更改目录，它将提交到项目的 `master` 分支，这可能不是您想要的。

### 自定义域名

GitHub Pages 包含对使用 [自定义域名](https://help.github.com/articles/adding-or-removing-a-custom-domain-for-your-github-pages-site) 用于您的网站的支持。除了 GitHub 文档中记录的步骤之外，您还需要执行一个额外的步骤，以便 MkDocs 可以与您的自定义域名一起使用。您需要将 `CNAME` 文件添加到 [docs\_dir](https://mkdocs.cn/user-guide/configuration/#docs_dir) 的根目录。该文件必须在一行上包含一个裸域名或子域名（请参见 MkDocs 的自己的 [CNAME 文件](https://github.com/mkdocs/mkdocs/blob/master/docs/CNAME) 作为示例）。您可以手动创建文件，也可以使用 GitHub 的 Web 界面设置自定义域名（在设置 / 自定义域名下）。如果您使用 Web 界面，GitHub 会为您创建 `CNAME` 文件并将其保存到您的“页面”分支的根目录中。为了防止该文件在您下次部署时被删除，您需要将该文件复制到您的 `docs_dir`。通过将该文件正确包含在您的 `docs_dir` 中，MkDocs 会将该文件包含在您的构建站点中，并在您每次运行 `gh-deploy` 命令时将其推送到您的“页面”分支。

如果您在使用自定义域名时遇到问题，请参阅 GitHub 关于 [自定义域名故障排除](https://help.github.com/articles/troubleshooting-custom-domains/) 的文档。

Read the Docs
---------------------------------------

[Read the Docs](https://readthedocs.org/) 提供免费的文档托管。您可以使用 Git 版本控制系统导入您的文档。Read the Docs 开箱即用地支持 MkDocs。按照其网站上的 [说明](https://docs.readthedocs.io/en/stable/intro/getting-started-with-mkdocs.html) 将存储库中的文件正确排列，创建一个帐户并将其指向您的公开托管存储库。如果配置正确，您的文档将在您将提交推送到公共存储库时更新。

其他提供商
---------------------------------

任何可以提供静态文件的托管提供商都可以用于提供 MkDocs 生成的文档。虽然无法记录如何将文档上传到所有托管提供商，但以下准则应提供一些一般帮助。

当您构建网站（使用 `mkdocs build` 命令）时，所有文件都将写入分配给 [site\_dir](https://mkdocs.cn/user-guide/configuration/#site_dir) 配置选项（默认值为 `"site"`）的目录，该目录位于您的 `mkdocs.yaml` 配置文件中的目录。通常，您只需要将该目录的内容复制到托管提供商服务器的根目录。根据您的托管提供商的设置，您可能需要使用图形或命令行 [ftp](https://en.wikipedia.org/wiki/File_Transfer_Protocol)、[ssh](https://en.wikipedia.org/wiki/Secure_Shell) 或 [scp](https://en.wikipedia.org/wiki/Secure_copy) 客户端来传输文件。

例如，来自命令行的典型命令集可能如下所示

```shell

mkdocs build
scp -r ./site user@host:/path/to/server/root
```

当然，您需要将 `user` 替换为您在托管提供商处拥有的用户名，并将 `host` 替换为相应的域名。此外，您还需要调整 `/path/to/server/root` 以匹配主机文件系统的配置。

有关详细信息，请参阅您的主机的文档。您可能需要在他们的文档中搜索“ftp”或“上传网站”。

本地文件
----------------------------

您可能不需要将文档托管在服务器上，而是可以直接分发文件，然后可以使用 `file://` 方案在浏览器中查看这些文件。

请注意，由于所有现代浏览器的安全设置，某些内容将无法正常工作，某些功能可能根本无法使用。事实上，需要以非常特定的方式自定义一些设置。

*   [site\_url](https://mkdocs.cn/user-guide/configuration/#site_url):
    
    `site_url` 必须设置为一个空字符串，这会指示 MkDocs 构建您的网站，以便它可以与 `file://` 方案一起使用。
    
    ```shell
    
    site_url: ""
    ```
    
*   [use\_directory\_urls](https://mkdocs.cn/user-guide/configuration/#use_directory_urls):
    
    将 `use_directory_urls` 设置为 `false`。否则，页面之间的内部链接将无法正常工作。
    
    ```shell
    
    use_directory_urls: false
    ```
    
*   [search](https://mkdocs.cn/user-guide/configuration/#search):
    
    您需要禁用搜索插件，或者使用专门设计用于与 `file://` 方案一起使用的第三方搜索插件。要禁用所有插件，请将 `plugins` 设置设置为一个空列表。
    
    ```shell
    
    plugins: []
    ```
    
    如果您启用了其他插件，只需确保 `search` 不包含在列表中即可。
    

在编写文档时，必须确保所有内部链接都使用相对 URL，如 [所述](https://mkdocs.cn/user-guide/writing-your-docs/#internal-links)。请记住，您的文档的每个读者都将使用不同的设备，并且文件很可能位于该设备上的不同位置。

如果您希望您的文档离线查看，您可能还需要注意您选择的主题。许多主题使用 CDN 用于各种支持文件，这些文件需要实时互联网连接。您需要选择一个直接在主题中包含所有支持文件的主题。

当您构建网站（使用 `mkdocs build` 命令）时，所有文件都将写入分配给 [site\_dir](https://mkdocs.cn/user-guide/configuration/#site_dir) 配置选项（默认值为 `"site"`）的目录，该目录位于您的 `mkdocs.yaml` 配置文件中的目录。通常，您只需要复制该目录的内容并将其分发给您的读者。或者，您可以选择使用第三方工具将 HTML 文件转换为其他文档格式。

404 页面
----------------------------

当 MkDocs 构建文档时，它将在 [构建目录](https://mkdocs.cn/user-guide/configuration/#site_dir) 中包含一个 404.html 文件。当部署到 [GitHub](#github-pages) 时，此文件将自动使用，但仅在自定义域上使用。其他 Web 服务器可以配置为使用它，但此功能并不总是可用。有关详细信息，请参阅您选择的服务器的文档。