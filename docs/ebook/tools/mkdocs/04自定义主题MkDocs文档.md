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