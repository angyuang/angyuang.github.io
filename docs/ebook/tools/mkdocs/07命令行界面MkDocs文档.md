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