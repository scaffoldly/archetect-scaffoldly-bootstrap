# Scaffoldly Bootstrap Archetype

## Building

After installing [Archetect](https://github.com/archetect/archetect), run the
following command:

```shell
 rm -fr archetect-out
 archetect render . archetect-out
```

Or headless:

```shell
 rm -fr archetect-out && archetect render . -a nonlive_domain='foo.dev' -a live_domain='foo.com' -- archetect-out
```
