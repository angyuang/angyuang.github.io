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

大多数网站的推荐设置（最大严格度）```shell
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

如果为一组键值对，则可以定义以下嵌套键

块

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