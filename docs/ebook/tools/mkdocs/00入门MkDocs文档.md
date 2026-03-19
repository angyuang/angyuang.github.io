
一个入门教程！

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