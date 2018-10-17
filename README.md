# misc-util
Miscellaneous utilities that make it easier to make, manage, and run demos

## Demos

- [Simple Cluster](demos/simple-cluster/README.md)
- [Certificate Authority](demos/certificate-authority/README.md)
- [Auto-Failover Cluster](demos/auto-failover/README.md)

## Tools
- [Generate Signed Certificates](tools/simple-certificates/)


### `./start`
`start` provides a dead simple mechanism for starting a Conjur Appliance.

Start a V5 appliance master with:
```sh
$ ./start
```
The start command pulls down the latest version of the V5 appliance and CLI, and configures Conjur with the following:
* Account: `test`
* Admin password: `secret`

Once started, logs are streamed to the console.

`ctr-c` stops the appliance, and cleans up the environment.

### `./cli`
`cli` is a proxy script, sending all subsequent arguments to a Conjur CLI container. This provides a simple mechanism for loading policy and interacting with Conjur.

#### Loading policy
The policy folder contains sample policy which can be loaded with:
```sh
$ ./cli conjur policy load --replace root policy/users.yml
$ ./cli conjur policy load root policy/policy.yml
$ ./cli conjur policy load staging policy/apps/myapp.yml
$ ./cli conjur policy load production policy/apps/myapp.yml
$ ./cli conjur policy load root policy/application_grants.yml
$ ./cli conjur policy load root policy/hosts.yml
```

#### Setting/Retrieving a Variable
```
$ ./cli conjur variable values add production/myapp/database/username foo-bar
$ ./cli conjur variable value production/myapp/database/username
```

#### Validating Packages
This project can also be used to verify PRs, by installing the branch specific package (created by Jenkins).  To begin, download the `.deb` package.  After starting Conjur, packages can be installed with:

```
# Start Conjur
$ ./start
```
Next in a new tab:

```
$ ./install ~/Downloads/conjur-ui_2.10.9.1-e389f20_amd64.deb
```
The install script will install the package into the running Conjur appliance and restart the Conjur service.
