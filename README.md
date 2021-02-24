
# Sign In Canada BDD Tests

## Setup

1. checkout this repo from git
2. run `npm install`

## Run the tests

In a CLI, run `npm run test`

Use other CSP buttons than DEV3 with an environmental variable, for example, `CSP_HOST="DEV 4 - Naeem" npm run test`

## Run simulated DEV3 CDP

1. In a cli, run `npm run sim-dev3`
2. In another CLI, run `CSP_HOST="_local" npm run test`

## Login tests

create a `.env` file with the appropriate credentials;

```
GCKEY_USER=testuser1
GCKEY_PASSWORD=<password1>
GCKEY_USER_2=testuser2
GCKEY_PASSWORD_2=<password2>
```


