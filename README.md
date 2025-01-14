# Installation

- Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the dev requirements ([dbt](https://www.getdbt.com/), [pre-commit](https://pre-commit.com/))
- Run `pre-commit install` to set up your git hook scripts. This will set your hooks so that the next time you commit, pre-commit will be invoked (note: on its first invocation, pre-commit will need to install its own dependencies which may take a minute; these dependencies will be installed outside of your project and will be available from that moment onwards).

```bash
$ pip install -r requirements.txt
$ pre-commit install
```

# Working with Pre-Commit
- Pre-commit is configured to run various checks automatically when you attempt to commit your code.
- Pre-commit will only run against changed files to keep its execution as quick as possible.
- On its first execution, pre-commit will install any dependencies it needs into a virtual environment (located outside of this repo); this may take a few minutes on its first run, but every following run will reuse that env and as a result will be much quicker.

## Working with SQLFluff
- SQLFluff lint is configured as a pre-commit hook that runs on commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run SQLFluff lint manually, or would like to run it in fix mode, you can do so with the following commands which will run them through pre-commit. 
```bash
pre-commit run --hook-stage commit sqlfluff-lint --all-files
pre-commit run --hook-stage manual sqlfluff-fix --all-files
```

## Working with YAMLLint
- YAMLLint is configured as a pre-commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run YAMLLint manually, you can do so with the following command which will run it through pre-commit.
```bash
pre-commit run --hook-stage commit yamllint
```

## Working with dbt-checkpoint
- dbt-checkpoint is configured as a set of pre-commit hooks, so in most cases no explicit commands are needed. These hooks will ensure the dbt project is following standard convention. This will only list errors and will not fix any errors if found.
- If you would like to run dbt-checkpoint manually, you can do so with the following command which will run it through pre-commit. Replace `{{dbt-checkpoint hook_id}}` with the name of the hook you want to run (e.g. `check-model-has-tests`).
```bash
pre-commit run {{dbt-checkpoint hook_id}} --hook-stage commit --all-files


# Run all pre-commit hooks on all files
pre-commit run --hook-stage commit --all-files

# Run SQLFluff Lint against all files
pre-commit run --hook-stage commit sqlfluff-lint --all-files

# Run SQLFluff fix against all files
pre-commit run --hook-stage manual sqlfluff-fix --all-files

# Run YAMLLint lint against all files
pre-commit run --hook-stage commit yamllint --all-files

# Run a dbt-checkpoint hook against all files, replace {{dbt-checkpoint hook_id}}
# with the name of the hook you'd like to run (e.g. check-model-has-tests).
pre-commit run {{dbt-checkpoint hook_id}} --hook-stage commit --all-files