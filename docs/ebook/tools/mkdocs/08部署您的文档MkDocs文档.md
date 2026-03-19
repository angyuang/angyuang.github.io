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