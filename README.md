NEOVIM ALE BUG
==============

After u, dd delete 2 lines...

How to reproduce
----------------

### Clone the project

```bash
git clone git@github.com:apoutchika/bug-neovim-ale.git
cd bug-neovim-ale
```

### Build end run the container

```bash
docker build . -t testneovimbug && docker run -ti --rm testneovimbug /bin/bash
```

### Test Bug

Open file /app/test.js

```bash
nvim /app/test.js
```

Test this suite (no wait after u):

```bash
dd # delete line
ud # (fast) Redo last delete and click on d : this delete line !
```

The last d delete line ! Normal keys is udd, not ud :

```bash
dd # delete line
udd # (fast) Redo last delete and delete again : this delete 2 lines !
```

Try this suite (fast) :
```bash
dduddudduddudduddudd # delete all lines
```

Other suite
```bash
dd  # delete line
ujd # (fast) Delete line on bottom
ujd # (fast) Delete line on bottom
...
```
