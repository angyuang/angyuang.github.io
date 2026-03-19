
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