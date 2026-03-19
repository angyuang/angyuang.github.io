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