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