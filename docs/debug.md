---
layout: page
title: Debug Information
permalink: /debug
---

# Debug Information

## Site Configuration

- **site.baseurl**: {{ site.baseurl }}
- **site.url**: {{ site.url }}
- **page.url**: {{ page.url }}
- **page.path**: {{ page.path }}

## All Pages

{% for page in site.pages %}
- **{{ page.title }}**: {{ page.url }}
{% endfor %}

## Site Data

```
{{ site | jsonify }}
```