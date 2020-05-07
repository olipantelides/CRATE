# CRATE - A Simple Framework For Bottle

CRATE gives you a simple framework to quickly create python websites with the automated creation of an API

## REQUIREMENTS
You will need to install bottlePy using:

```
$ sudo pip install bottle              # recommended
$ sudo easy_install bottle             # alternative without pip
$ sudo apt-get install python-bottle   # works for debian, ubuntu, ...
```

## STRUCTURE

```
CRATE
    - data
    - static
        - images
        - scripts
        - styles
    - views
        - index.tpl
        - components
```

What are components?
```
Components are resuable interface elements such as a websites header or footer
```

## API

How do I whitelist the function to use in the API?

```python
methods = {
        "POST":[],
        "GET": ["myFunction"],
        "PUT": [],
        "DELETE": [],
        "PATCH": []
    }
```
Simply just add your function name into one or more methods as above with `myFunction`.
