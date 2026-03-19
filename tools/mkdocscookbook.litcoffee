MkDocs 安装
详细指南。

需求
MkDocs 需要您系统上安装的最新版本的 Python 和 Python 包管理器 pip。

您可以从命令行检查是否已经安装了这些包。

$ python --version
Python 3.8.2
$ pip --version
pip 20.0.2 from /usr/local/lib/python3.8/site-packages/pip (python 3.8)
如果您已经安装了这些包，您可以跳过到 安装 MkDocs。

安装 Python
使用您选择的包管理器安装 Python，或者从 python.org 下载适用于您系统的安装程序并运行它。

注意

如果您在 Windows 上安装 Python，请确保选中将 Python 添加到 PATH 的复选框，如果安装程序提供此选项（默认情况下通常是关闭的）。

Add Python to PATH

安装 pip
如果您使用的是最新版本的 Python，Python 包管理器 pip 很可能默认安装。但是，您可能需要将 pip 升级到最新版本。

pip install --upgrade pip
如果您需要首次安装 pip，请下载 get-pip.py。然后运行以下命令来安装它

python get-pip.py
安装 MkDocs
使用 pip 安装 mkdocs 包

pip install mkdocs
您现在应该在系统上安装了 mkdocs 命令。运行 mkdocs --version 检查一切是否正常工作。

$ mkdocs --version
mkdocs, version 1.2.0 from /usr/local/lib/python3.8/site-packages/mkdocs (Python 3.8)
注意

如果您想安装 MkDocs 的手册页，click-man 工具可以为您生成并安装它们。只需运行以下两个命令

pip install click-man
click-man --target path/to/man/pages mkdocs
有关为什么手册页不是由 pip 自动生成和安装的解释，请参阅 click-man 文档。

注意

如果您使用的是 Windows，上述某些命令可能无法正常工作。

一个快速解决方案可能是用 python -m 作为前缀，例如

python -m pip install mkdocs
python -m mkdocs
为了获得更永久的解决方案，您可能需要编辑 PATH 环境变量以包含 Python 安装的 Scripts 目录。最近版本的 Python 包含一个脚本供您执行此操作。导航到您的 Python 安装目录（例如 C:\Python38\），打开 Tools，然后打开 Scripts 文件夹，并通过双击运行 win_add2path.py 文件。或者，您可以下载 脚本 并运行它 (python win_add2path.py)。

编写文档
如何布局和编写 Markdown 源文件。

文件布局
您的文档源代码应编写为普通的 Markdown 文件（参见下面的 使用 Markdown 编写），并放置在 文档目录 中。默认情况下，此目录将命名为 docs，并且将存在于项目顶层，与 mkdocs.yml 配置文件并列。

您可以创建的最简单的项目将类似于以下内容

mkdocs.yml
docs/
    index.md
按照惯例，您的项目主页应该命名为 index.md（有关详细信息，请参见下面的 索引页）。以下任何文件扩展名都可用于您的 Markdown 源文件：markdown、mdown、mkdn、mkd、md。包含在您的文档目录中的所有 Markdown 文件将在构建的站点中渲染，而不管任何设置。

注意

以点开头的文件和目录（例如：.foo.md 或 .bar/baz.md）会被 MkDocs 忽略。这可以通过 exclude_docs 配置 覆盖。

您还可以通过创建多个 Markdown 文件来创建多页文档

mkdocs.yml
docs/
    index.md
    about.md
    license.md
您使用的文件布局决定了为生成的页面使用的 URL。鉴于上述布局，将为以下 URL 生成页面

/
/about/
/license/
您还可以将 Markdown 文件包含在嵌套目录中，如果这更适合您的文档布局。

docs/
    index.md
    user-guide/getting-started.md
    user-guide/configuration-options.md
    license.md
嵌套目录内的源文件将导致生成具有嵌套 URL 的页面，如下所示

/
/user-guide/getting-started/
/user-guide/configuration-options/
/license/
在 文档目录 中未识别为 Markdown 文件（通过其文件扩展名）的任何文件都将由 MkDocs 不做修改地复制到构建的站点中。有关详细信息，请参见下面的 如何链接到图像和媒体。

索引页
当请求目录时，默认情况下，大多数 Web 服务器将在该目录中返回索引文件（通常名为 index.html），如果存在的话。出于这个原因，上面所有示例中的主页都命名为 index.md，MkDocs 将在构建站点时将其渲染为 index.html。

许多代码库托管网站通过在浏览目录内容时显示 README 文件的内容来提供对 README 文件的特殊处理。因此，MkDocs 允许您将索引页命名为 README.md 而不是 index.md。这样，当用户浏览您的源代码时，代码库主机可以将该目录的索引页显示为 README 文件。但是，当 MkDocs 渲染您的站点时，该文件将被重命名为 index.html，以便服务器将其作为正确的索引文件提供服务。

如果在同一个目录中都找到了 index.md 文件和 README.md 文件，则使用 index.md 文件，而忽略 README.md 文件。

配置页面和导航
mkdocs.yml 文件中的 nav 配置设置定义了哪些页面包含在全局站点导航菜单中，以及该菜单的结构。如果没有提供，导航将通过发现 文档目录 中的所有 Markdown 文件来自动创建。自动创建的导航配置始终按文件名按字母数字排序（除了索引文件始终在子部分中列出第一个）。如果您希望您的导航菜单以不同的方式排序，则需要手动定义您的导航配置。

一个最小的导航配置可能看起来像这样

nav:
  - index.md
  - about.md
导航配置中的所有路径都必须相对于 docs_dir 配置选项。如果该选项设置为默认值 docs，则上述配置的源文件将位于 docs/index.md 和 docs/about.md 中。

上面的示例将导致在顶层创建两个导航项，并从 Markdown 文件的内容中推断其标题，或者，如果文件中没有定义标题，则从文件名中推断。要在 nav 设置中覆盖标题，请在文件名之前添加一个标题。

nav:
  - Home: index.md
  - About: about.md
请注意，如果在导航中为页面定义了标题，则该标题将在整个站点中用于该页面，并将覆盖页面本身中定义的任何标题。

导航子部分可以通过将相关页面一起列在节标题下创建。例如

nav:
  - Home: index.md
  - User Guide:
    - Writing your docs: writing-your-docs.md
    - Styling your docs: styling-your-docs.md
  - About:
    - License: license.md
    - Release Notes: release-notes.md
使用上述配置，我们有三个顶层项目：“首页”、“用户指南”和“关于”。“首页”是到站点主页的链接。在“用户指南”部分中列出了两个页面：“编写文档”和“设置文档样式”。在“关于”部分中列出了另外两个页面：“许可”和“发布说明”。

请注意，部分不能分配页面。部分只是子页面和子部分的容器。您可以根据需要将部分嵌套得尽可能深。但是，请注意，不要通过过度复杂嵌套使您的用户难以浏览站点导航。虽然部分可能反映您的目录结构，但它们不必这样做。

在您的导航配置中未列出的任何页面仍将被渲染并包含在构建的站点中，但是它们不会从全局导航中链接，也不会包含在 previous 和 next 链接中。此类页面将“隐藏”，除非直接链接到它们。

使用 Markdown 编写
MkDocs 页面必须使用 Markdown 编写，Markdown 是一种轻量级标记语言，它可以生成易于阅读、易于编写的纯文本文档，这些文档可以以可预测的方式转换为有效的 HTML 文档。

MkDocs 使用 Python-Markdown 库将 Markdown 文档渲染为 HTML。Python-Markdown 几乎完全符合 参考实现，尽管有一些非常小的 差异。

除了所有 Markdown 实现通用的基本 Markdown 语法 之外，MkDocs 还包括对使用 Python-Markdown 扩展 扩展 Markdown 语法的支持。有关如何启用扩展的详细信息，请参见 MkDocs 的 markdown_extensions 配置设置。

MkDocs 默认包含一些扩展，这些扩展将在下面重点介绍。

内部链接
MkDocs 允许您通过使用常规 Markdown 链接 来互连您的文档。但是，如以下所述，为 MkDocs 特别格式化这些链接有一些额外的优势。

链接到页面
在文档页面之间链接时，您可以简单地使用常规 Markdown 链接 语法，包括您要链接到的 Markdown 文档的相对路径。

Please see the [project license](license.md) for further details.
当 MkDocs 构建运行时，这些 Markdown 链接将自动转换为指向相应 HTML 页面的 HTML 超链接。

警告

不正式支持使用链接的绝对路径。相对路径由 MkDocs 调整以确保它们始终相对于页面。绝对路径根本不会被修改。这意味着使用绝对路径的链接可能在您的本地环境中运行良好，但一旦您将它们部署到生产服务器，它们可能会中断。

如果目标文档文件在另一个目录中，则需要确保在链接中包含任何相对目录路径。

Please see the [project license](../about/license.md) for further details.
MkDocs 使用 toc 扩展为 Markdown 文档中的每个标题生成一个 ID。您可以使用该 ID 来链接到目标文档内的某个部分，方法是使用锚点链接。生成的 HTML 将正确转换链接的路径部分，并将锚点部分保持不变。

Please see the [project license](about.md#license) for further details.
请注意，ID 是根据标题的文本创建的。所有文本都转换为小写，任何不允许的字符（包括空格）都转换为连字符。然后将连续的连字符简化为一个连字符。

toc 扩展提供了一些配置设置，您可以在 mkdocs.yml 配置文件中设置这些设置以更改默认行为

permalink

在每个标题末尾生成永久链接。默认值：False。

当设置为 True 时，段落符号 (¶ 或 &para;) 用作链接文本。当设置为字符串时，提供的字符串用作链接文本。例如，要使用井号 (#) 代替，请执行以下操作

markdown_extensions:
  - toc:
      permalink: "#"
baselevel

标题的基线。默认值：1。

此设置允许自动调整标题级别以适合 HTML 模板的层次结构。例如，如果页面中的 Markdown 文本不应包含任何高于级别 2 (<h2>) 的标题，请执行以下操作

markdown_extensions:
  - toc:
      baselevel: 2
然后，您文档中的任何标题都会增加 1。例如，标题 # Header 将在 HTML 输出中渲染为级别 2 标题 (<h2>)。

separator

单词分隔符。默认值：-。

替换生成的 ID 中空格的字符。如果您更喜欢下划线，那么请执行以下操作

markdown_extensions:
  - toc:
      separator: "_"
请注意，如果您想定义上述多个设置，则必须在 markdown_extensions 配置选项中的单个 toc 条目下执行此操作。

markdown_extensions:
  - toc:
      permalink: "#"
      baselevel: 2
      separator: "_"
链接到图像和媒体
除了 Markdown 源文件之外，您还可以将其他文件类型包含在您的文档中，这些文件将在生成您的文档站点时被复制过去。这些可能包括图像和其他媒体。

例如，如果您的项目文档需要包含 GitHub Pages CNAME 文件 和 PNG 格式的屏幕截图图像，那么您的文件布局可能如下所示

mkdocs.yml
docs/
    CNAME
    index.md
    about.md
    license.md
    img/
        screenshot.png
要在文档源文件中包含图像，只需使用任何常规 Markdown 图像语法即可

Cupcake indexer is a snazzy new project for indexing small cakes.

![Screenshot](img/screenshot.png)

*Above: Cupcake indexer in progress*
现在，当您构建文档时，您的图像将被嵌入，并且如果您使用 Markdown 编辑器处理文档，也应该预览该图像。

从原始 HTML 链接
Markdown 允许文档作者在 Markdown 语法无法满足作者需求时回退到原始 HTML。MkDocs 在这方面没有限制 Markdown。但是，由于 Markdown 解析器会忽略所有原始 HTML，因此 MkDocs 无法验证或转换包含在原始 HTML 中的链接。在原始 HTML 中包含内部链接时，您需要手动将链接格式化以适合渲染的文档。

元数据
MkDocs 支持 YAML 和 MultiMarkdown 样式的元数据（通常称为 front-matter）。元数据由在 Markdown 文档开头定义的一系列关键字和值组成，这些关键字和值在文档被 Python-Markdown 处理之前会被剥离。键值对由 MkDocs 传递给页面模板。因此，如果主题包含支持，则任何键的值都可以显示在页面上或用于控制页面渲染。有关可能支持的哪些键的信息（如果有），请参阅主题的文档。

除了在模板中显示信息之外，MkDocs 还支持一些预定义的元数据键，这些键可以改变 MkDocs 对特定页面的行为。以下键受支持

template

要与当前页面一起使用的模板。

默认情况下，MkDocs 使用主题的 main.html 模板来渲染 Markdown 页面。您可以使用 template 元数据键来为特定页面定义不同的模板文件。模板文件必须在主题环境中定义的路径上可用。

title

文档要使用的“标题”。

MkDocs 将尝试以下列顺序确定文档的标题

在文档的 nav 配置设置中定义的标题。

在文档的 title 元数据键中定义的标题。

文档主体第一行的 1 级 Markdown 标题。
（Setext 样式 标题仅在 MkDocs 1.5 之后支持。）

文档的文件名。

找到页面标题后，MkDoc 不会继续检查上述列表中的任何其他来源。

YAML 样式元数据
YAML 样式元数据由 YAML 键值对组成，这些键值对用 YAML 样式分隔符包装以标记元数据的开始和/或结束。文档的第一行必须是 ---。元数据在包含结束分隔符的第一行结束（--- 或 ...）。分隔符之间的内容被解析为 YAML。

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
YAML 能够检测数据类型。因此，在上面的示例中，title、summary 和 some_url 的值为字符串，authors 的值为字符串列表，date 的值为 datetime.date 对象。请注意，YAML 键区分大小写，MkDocs 期望键全部小写。YAML 的顶层必须是一组键值对，这将导致返回 Python dict。如果返回任何其他类型，或者 YAML 解析器遇到错误，则 MkDocs 不会将该部分识别为元数据，页面的 meta 属性将为空，并且该部分不会从文档中删除。

MultiMarkdown 样式元数据
MultiMarkdown 样式元数据使用由 MultiMarkdown 项目首次引入的格式。数据由在 Markdown 文档开头定义的一系列关键字和值组成，如下所示

Title:   My Document
Summary: A brief description of my document.
Authors: Waylan Limberg
         Tom Christie
Date:    January 23, 2018
blank-value:
some_url: https://example.com

This is the first paragraph of the document.
关键字不区分大小写，可以包含字母、数字、下划线和连字符，并且必须以冒号结尾。值包含冒号后面行上的任何内容，甚至可以为空。

如果一行缩进了 4 个或更多空格，则该行被假定为前一个关键字值的附加行。一个关键字可以有任意多的行。所有行都合并成一个字符串。

第一个空行结束文档的所有元数据。因此，文档的第一行不能为空。

注意

MkDocs 不支持 YAML 样式分隔符（--- 或 ...）用于 MultiMarkdown 样式元数据。实际上，MkDocs 依赖于分隔符的存在或不存在来确定使用的是 YAML 样式元数据还是 MultiMarkdown 样式元数据。如果检测到分隔符，但分隔符之间的内容不是有效的 YAML 元数据，则 MkDocs 不会尝试将内容解析为 MultiMarkdown 样式元数据。

表格
tables 扩展为 Markdown 添加了基本表格语法，该语法在多个实现中很流行。语法相当简单，通常仅适用于简单表格数据。

一个简单的表格如下所示

First Header | Second Header | Third Header
------------ | ------------- | ------------
Content Cell | Content Cell  | Content Cell
Content Cell | Content Cell  | Content Cell
如果需要，可以在表格的每一行中添加前导和尾部管道

| First Header | Second Header | Third Header |
| ------------ | ------------- | ------------ |
| Content Cell | Content Cell  | Content Cell |
| Content Cell | Content Cell  | Content Cell |
通过在分隔符行中添加冒号来指定每列的对齐方式

First Header | Second Header | Third Header
:----------- |:-------------:| -----------:
Left         | Center        | Right
Left         | Center        | Right
请注意，表格单元格不能包含任何块级元素，也不能包含多行文本。但是，它们可以包含 Markdown 语法中定义的内联 Markdown，如 Markdown 的 语法 规则所定义。

此外，表格必须用空行包围。表格前后必须有空行。

带围栏的代码块
带围栏的代码块 扩展为定义不缩进的代码块添加了一种备用方法。

第一行应该包含 3 个或更多个反引号（`）字符，最后一行应该包含相同数量的反引号字符（`）

```
Fenced code blocks are like Standard
Markdown’s regular code blocks, except that
they’re not indented and instead rely on
start and end fence lines to delimit the
code block.
```
使用这种方法，可以在第一行反引号之后可选地指定语言，这会告知任何语法高亮器使用的语言

```python
def fn():
    pass
```
请注意，带围栏的代码块不能缩进。因此，它们不能嵌套在列表项、引用块等中。

选择主题
选择和配置主题。

MkDocs 包含两个内置主题 (mkdocs 和 readthedocs)，如下所述。但是，还有许多 第三方主题 可供选择。

要选择主题，请在您的 mkdocs.yml 配置文件中设置 theme 配置选项。

theme:
  name: readthedocs
mkdocs
默认主题，它是作为自定义 Bootstrap 主题构建的，支持 MkDocs 的几乎所有功能。

MkDocs theme in light mode
除了默认的 主题配置选项 之外，mkdocs 主题还支持以下选项

color_mode: 将主题的默认颜色模式设置为 light、dark 或 auto 之一。auto 模式将根据用户设备的系统配置切换到 light 或 dark。默认值：light。

user_color_mode_toggle: 在导航栏中启用切换菜单，允许用户从浏览器中选择他们喜欢的 color_mode（浅色、深色、自动）并在将来页面加载时保存他们的偏好。切换菜单在第一次页面加载时的默认选择是设置为 color_mode 的值。默认值：false。

color mode toggle menu

nav_style: 调整顶部导航栏的视觉样式。设置为 primary、dark 或 light 之一。默认值：primary。此选项独立于 color_mode 选项，必须单独定义。

highlightjs: 使用 highlight.js JavaScript 库启用代码块中源代码的突出显示。默认值：True。

hljs_style: highlight.js 库为代码块中突出显示源代码提供了许多不同的 样式（颜色变化）。在 light 模式下，将其设置为所需样式的名称。默认值：github。

hljs_style_dark: 在 dark 模式下，将其设置为所需 highlight.js 样式的名称。默认值：github_dark。

hljs_languages: 默认情况下，highlight.js 只支持 23 种常用语言。在此处列出其他语言以包含对它们的 support。

theme:
  name: mkdocs
  highlightjs: true
  hljs_languages:
    - yaml
    - rust
analytics: 定义分析服务的配置选项。目前，仅通过 gtag 选项支持 Google Analytics v4。

gtag: 要启用 Google Analytics，请将其设置为 Google Analytics v4 跟踪 ID，该 ID 使用 G- 格式。请参阅 Google 的文档以 为网站和/或应用程序设置 Analytics（GA4） 或 升级到 Google Analytics 4 属性。

theme:
  name: mkdocs
  analytics:
    gtag: G-ABC123
当设置为默认值（null）时，Google Analytics 将被禁用。

shortcuts: 定义键盘快捷键。

theme:
  name: mkdocs
  shortcuts:
    help: 191    # ?
    next: 78     # n
    previous: 80 # p
    search: 83   # s
所有值必须是数字键码。最好使用所有键盘上都可用的键。您可以使用 https://keycode.info/ 来确定给定键的键码。

help: 显示一个帮助模态，其中列出了键盘快捷键。默认值：191（?）

next: 导航到“下一页”。默认值：78（n）

previous: 导航到“上一页”。默认值：80（p）

search: 显示搜索模态。默认值：83（s）

navigation_depth: 侧边栏中导航树的最大深度。默认值：2。

locale: 用于构建主题的区域设置（语言/位置）。如果您的区域设置尚未支持，它将回退到默认值。

此主题支持以下区域设置

en: 英语（默认）
de: 德语
es: 西班牙语
fa: 波斯语
fr: 法语
id: 印度尼西亚语
it: 意大利语
ja: 日语
nb: 挪威语 (Bokmål)
nl: 荷兰语
nn: 挪威语 (Nynorsk)
pl: 波兰语
pt_BR: 葡萄牙语 (巴西)
ru: 俄语
tr: 土耳其语
uk: 乌克兰语
zh_CN: 中文（简体，中国）
zh_TW: 中文（繁体，台湾）
有关详细信息，请参阅有关 本地化主题 的指南。

readthedocs
由 Read the Docs 服务使用的默认主题的克隆，它提供了与其父主题相同的限制功能集。与它的父主题一样，只支持两个级别的导航。

ReadTheDocs

除了默认的 主题配置选项 之外，readthedocs 主题还支持以下选项

highlightjs: 使用 highlight.js JavaScript 库启用代码块中源代码的突出显示。默认值：True。

hljs_languages: 默认情况下，highlight.js 只支持 23 种常用语言。在此处列出其他语言以包含对它们的 support。

theme:
  name: readthedocs
  highlightjs: true
  hljs_languages:
    - yaml
    - rust
analytics: 定义分析服务的配置选项。

gtag: 要启用 Google Analytics，请将其设置为 Google Analytics v4 跟踪 ID，该 ID 使用 G- 格式。请参阅 Google 的文档以 为网站和/或应用程序设置 Analytics（GA4） 或 升级到 Google Analytics 4 属性。

theme:
  name: readthedocs
  analytics:
    gtag: G-ABC123
当设置为默认值（null）时，Google Analytics 将被禁用。

anonymize_ip: 要为 Google Analytics 启用匿名 IP 地址，请将其设置为 True。默认值：False。

include_homepage_in_sidebar: 在侧边栏菜单中列出首页。由于 MkDocs 要求首页在 nav 配置选项中列出，因此此设置允许首页包含在侧边栏中或从侧边栏中排除。请注意，站点名称/徽标始终链接到首页。默认值：True。

prev_next_buttons_location: bottom、top、both 或 none 之一。相应地显示“下一页”和“上一页”按钮。默认值：bottom。

navigation_depth: 侧边栏中导航树的最大深度。默认值：4。

collapse_navigation: 仅在侧边栏中包含当前页面的页面部分标题。默认值：True。

titles_only: 仅在侧边栏中包含页面标题，不包括所有页面的所有部分标题。默认值：False。

sticky_navigation: 如果为 True，则当您滚动页面时，侧边栏将与主页面内容一起滚动。默认值：True。

locale: 用于构建主题的区域设置（语言/位置）。如果您的区域设置尚未支持，它将回退到默认值。

此主题支持以下区域设置

en: 英语（默认）
de: 德语
es: 西班牙语
fa: 波斯语
fr: 法语
id: 印度尼西亚语
it: 意大利语
ja: 日语
nl: 荷兰语
pl: 波兰语
pt_BR: 葡萄牙语 (巴西)
ru: 俄语
tr: 土耳其语
uk: 乌克兰语
zh_CN: 中文（简体，中国）
zh_TW: 中文（繁体，台湾）
有关详细信息，请参阅有关 本地化主题 的指南。

logo: 要在您的项目中设置徽标而不是纯文本 site_name，请将此变量设置为图像的位置。默认值：null。

第三方主题
可以在 社区 wiki 页面和 排名目录 中找到第三方主题列表。如果您创建了自己的主题，请将其添加到其中。

警告

安装 MkDocs 主题意味着安装 Python 包并执行作者在其中放置的任何代码。因此，请谨慎行事；没有尝试进行沙盒化。

自定义主题
更改主题以满足您的需求。

如果您想对现有主题进行一些调整，则无需从头开始创建自己的主题。对于只需一些 CSS 和/或 JavaScript 的微调，您可以使用 docs_dir。但是，对于更复杂的自定义（包括覆盖模板），您将需要使用主题 custom_dir设置。

使用 docs_dir
extra_css 和 extra_javascript 配置选项可用于对现有主题进行调整和自定义。要使用它们，您只需在文档目录中包含 CSS 或 JavaScript 文件即可。

例如，要更改文档中标题的颜色，请创建一个名为（例如）style.css 的文件，并将其放在文档 Markdown 旁边。在该文件中添加以下 CSS。

h1 {
  color: red;
}
然后您需要将其添加到 mkdocs.yml 中

extra_css:
  - style.css
完成这些更改后，在运行 mkdocs serve 时应该可以看到它们 - 如果您已经运行了它，您应该会看到 CSS 更改被自动拾取，文档将更新。

注意

任何额外的 CSS 或 JavaScript 文件都将在页面内容之后添加到生成的 HTML 文档中。如果您希望包含 JavaScript 库，您可能可以使用主题custom_dir更好地包含库。

使用主题 custom_dir
theme.custom_dir 配置选项可用于指向一个目录，其中包含覆盖父主题中的文件的文件。父主题将是 theme.name 配置选项中定义的主题。custom_dir 中与父主题中文件同名的任何文件将替换父主题中同名文件。custom_dir 中的任何其他文件都将添加到父主题中。custom_dir 的内容应与父主题的目录结构相匹配。您可以包含模板、JavaScript 文件、CSS 文件、图像、字体或主题中包含的任何其他媒体。

注意

为了使此功能正常工作，theme.name 设置必须设置为已知的已安装主题。如果 name 设置改为设置为 null（或未定义），则没有主题可以覆盖，并且 custom_dir 的内容必须是一个完整的独立主题。有关更多信息，请参阅主题开发者指南。

例如，mkdocs 主题（浏览源代码）包含以下目录结构（部分）

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
要覆盖该主题中包含的任何文件，请在您的 docs_dir 旁边创建一个新目录

mkdir custom_theme
然后将您的 mkdocs.yml 配置文件指向新目录

theme:
  name: mkdocs
  custom_dir: custom_theme/
要覆盖 404 错误页面（“文件未找到”），请在 custom_theme 目录中添加一个名为 404.html 的新模板文件。有关模板中可以包含的内容的信息，请查看主题开发者指南。

要覆盖网站图标，您可以在 custom_theme/img/favicon.ico 中添加一个新的图标文件。

要包含 JavaScript 库，请将库复制到 custom_theme/js/ 目录中。

您的目录结构现在应该如下所示

- docs/
  - index.html
- custom_theme/
  - img/
    - favicon.ico
  - js/
    - somelib.js
  - 404.html
- config.yml
注意

父主题（在 name 中定义）中包含但在 custom_dir 中未包含的任何文件仍将被使用。custom_dir 仅会覆盖/替换父主题中的文件。如果您想删除文件或从头开始构建主题，那么您应该查看主题开发者指南。

覆盖模板块
内置主题在其模板块中实现了许多部分，这些块可以在 main.html 模板中单独覆盖。只需在您的 custom_dir 中创建一个 main.html 模板文件，并在该文件中定义替换块即可。只需确保 main.html 扩展 base.html。例如，要更改 MkDocs 主题的标题，您的替换 main.html 模板将包含以下内容

{% extends "base.html" %}

{% block htmltitle %}
<title>Custom title goes here</title>
{% endblock %}
在上面的示例中，您在自定义 main.html 文件中定义的 htmltitle 块将用于代替父主题中定义的默认 htmltitle 块。您可以重新定义任意数量的块，只要这些块在父主题中定义即可。例如，您可以用另一个服务的 Google Analytics 脚本替换 Google Analytics 脚本，或用您自己的搜索功能替换搜索功能。您需要查阅您正在使用的父主题以确定哪些块可供覆盖。MkDocs 和 ReadTheDocs 主题提供以下块

site_meta：包含文档头部中的元标签。
htmltitle：包含文档头部中的页面标题。
styles：包含样式表的链接标签。
libs：包含页面标题中包含的 JavaScript 库（jQuery 等）。
scripts：包含页面加载后应执行的 JavaScript 脚本。
analytics：包含分析脚本。
extrahead：<head> 中的空块，用于插入自定义标签/脚本等。
site_name：包含导航栏中的网站名称。
site_nav：包含导航栏中的网站导航。
search_button：包含导航栏中的搜索框。
next_prev：包含导航栏中的下一页和上一页按钮。
repo：包含导航栏中的仓库链接。
content：包含页面的页面内容和目录。
footer：包含页面页脚。
您可能需要查看源模板文件以确保您的修改与网站结构兼容。有关您可以在自定义块中使用的变量列表，请参阅模板变量。有关块的更完整说明，请查看Jinja 文档。

组合 custom_dir 和模板块
将 JavaScript 库添加到 custom_dir 将使其可用，但不会将其包含在 MkDocs 生成的页面中。因此，需要从 HTML 向库添加一个链接。

从上面的目录结构开始（已截断）

- docs/
- custom_theme/
  - js/
    - somelib.js
- config.yml
需要向模板添加一个指向 custom_theme/js/somelib.js 文件的链接。由于 somelib.js 是一个 JavaScript 库，因此它应该放在 libs 块中。但是，仅包含新脚本的新 libs 块将替换父模板中定义的块，并且父模板中对库的任何链接都将被删除。为了避免破坏模板，可以使用super 块，并在块内调用 super

{% extends "base.html" %}

{% block libs %}
    {{ super() }}
    <script src="{{ base_url }}/js/somelib.js"></script>
{% endblock %}
请注意，使用了base_url 模板变量来确保链接始终相对于当前页面。

现在生成的页面将包含指向模板提供的库以及 custom_dir 中包含的库的链接。对 custom_dir 中包含的任何其他 CSS 文件也需要这样做。

