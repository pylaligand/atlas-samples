# Atlas samples

This repo contains reproductions for Atlas issues.

## Setup

```
make install
```

## Issues

### Unable to disable the PG110 lint ([ticket](https://github.com/ariga/atlas/issues/3280))

```
make -C pg110 lint
```

Observe the warning despite the `atlas:nolint PG110` on the lone migration file:
```
atlas migrate lint --env repro --latest 10
Analyzing changes until version table (1 migration in total):

  -- analyzing version table
    -- non-optimal columns alignment:
      -- L1: Table "users" has 8 redundant bytes of padding per row. To reduce disk
         space, the optimal order of the columns is as follows: "created_at",
         "updated_at", "deleted_at", "email", "external_id", "name", "id"
         https://atlasgo.io/lint/analyzers#PG110
  -- ok (90.668µs)

  -------------------------
  -- 53.901506ms
  -- 1 version with warnings
  -- 1 schema change
  -- 1 diagnostic
```

The issue persists even if the `nolint` statement is moved right above the
guilty statement.
The issue goes away with a blanket `atlas:nolint`.
