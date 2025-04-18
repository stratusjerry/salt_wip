
## `salt-ssh` (`3006.10`) flags


| flag(s)               | Description                           |
|-                      |-                                      |
| `--version`             | show program's version number and exit |
| `-V`, `--versions-report` | Show program's dependencies version number and exit. |
| `-h`, `--help `           | show this help message and exit |
| `--saltfile=`SALTFILE   | Specify the path to a Saltfile. If not passed, one will be searched for in the current working directory. |
| `-c` CONFIG_DIR, `--config-dir=`CONFIG_DIR | Pass in an alternative configuration directory. Default: '/etc/salt'. |
| `--jid=`JID             | Pass a JID to be used instead of generating one. |
| `--hard-crash`          | Raise any original exception rather than exiting gracefully. Default: False. |
| `--no-parse=`argname1,argname2,... | Comma-separated list of named CLI arguments (i.e. argname=value) which should not be parsed as Python data types |
| `-r`, `--raw`, `--raw-shell` | Don't execute a salt routine on the targets, execute a raw shell command. |
| `--roster=`ROSTER       | Define which roster system to use, this defines if a database backend, scanner, or custom roster system is used. Default: 'flat'. |
| `--roster-file=`ROSTER_FILE | Define an alternative location for the default roster file location. The default roster file is called roster and is found in the same directory as the master config file. |
| `--refresh`, `--refresh-cache` | Force a refresh of the master side data cache of the target's data. This is needed if a target's grains have been changed and the auto refresh timeframe has not been reached.
| `--max-procs=`SSH_MAX_PROCS | Set the number of concurrent minions to communicate with. This value defines how many processes are opened up at a time to manage connections, the more running processes the faster communication should be. Default: 25. |
| `--extra-filerefs=`EXTRA_FILEREFS | Pass in extra files to include in the state tarball. |
| `--min-extra-modules=`MIN_EXTRA_MODS | One or comma-separated list of extra Python modules to be included into Minimal Salt. |
| `--thin-extra-modules=`THIN_EXTRA_MODS | One or comma-separated list of extra Python modules to be included into Thin Salt. |
| `-v`, `--verbose`         | Turn on command verbosity, display jid. |
| `-s`, `--static`          | Return the data from minions as a group after they all return. |
| `-w`, `--wipe`            | Remove the deployment of the salt files when done executing. |
| `-W`, `--rand-thin-dir`   | Select a random temp dir to deploy on the remote system. The dir will be cleaned after the execution. |
| `-t`, `--regen-thin`, `--thin` | Trigger a thin tarball regeneration. This is needed if custom grains/modules/states have been added or updated. |
| `--python2-bin=`PYTHON2_BIN | Path to a python2 binary which has salt installed. |
| `--python3-bin=`PYTHON3_BIN | Path to a python3 binary which has salt installed. |
| `--pre-flight`              | Run the defined ssh_pre_flight script in the roster |

Target Options: Target selection options.
| flag(s)          | Description                           |
|-                 |-                                      |
| `-H`, `--hosts`      | List all known hosts to currently visible or other specified rosters |
| `-E`, `--pcre`       | Instead of using shell globs to evaluate the target servers, use pcre regular expressions. |
| `-L`, `--list`       | Instead of using shell globs to evaluate the target servers, take a comma or whitespace delimited list of servers. |
| `-G`, `--grain`      | Instead of using shell globs to evaluate the target use a grain value to identify targets, the syntax for the target is the grain key followed by a globexpression: "os:Arch*". |
| `-P`, `--grain-pcre` | Instead of using shell globs to evaluate the target use a grain value to identify targets, the syntax for the target is the grain key followed by a pcre regular expression: "os:Arch.*". |
| `-N`, `--nodegroup`  | Instead of using shell globs to evaluate the target use one of the predefined nodegroups to identify a list of targets. |
| `-R`, `--range`      | Instead of using shell globs to evaluate the target use a range expression to identify targets. Range expressions look like %cluster. |
| `--delimiter=`DELIMITER | Change the default delimiter for matching in multi-level data structures. Default: ':'. |

Output Options: Configure your preferred output format.
| flag(s)          | Description                           |
|-                 |-                                      |
| `--out=`OUTPUT, `--output=`OUTPUT | Print the output from the 'salt-ssh' command using the specified outputter.
| `--out-indent=`OUTPUT_INDENT, `--output-indent=`OUTPUT_INDENT | Print the output indented by the provided value in spaces. Negative values disables indentation. Only applicable in outputters that support indentation.
| `--out-file=`OUTPUT_FILE, `--output-file=`OUTPUT_FILE | Write the output to the specified file. |
| `--out-file-append`, `--output-file-append` | Append the output to the specified file. |
| `--no-color`, `--no-colour` | Disable all colored output. |
| `--force-color`, `--force-colour` |Force colored output. |
| `--state-output=`STATE_OUTPUT, `--state_output=`STATE_OUTPUT | Override the configured state_output value for minion output. One of 'full', 'terse', 'mixed', 'changes' or 'filter'. Default: 'none'. |
| `--state-verbose=`STATE_VERBOSE, `--state_verbose=`STATE_VERBOSE | Override the configured state_verbose value for minion output. Set to True or False. Default: none. |

SSH Options: Parameters for the SSH client.
| flag(s)          | Description                           |
|-                 |-                                      |
| `--remote-port-forwards=`SSH_REMOTE_PORT_FORWARDS | Setup remote port forwarding using the same syntax as with the -R parameter of ssh. A comma separated list of port forwarding definitions will be translated into multiple -R parameters. |
| `--ssh-option=`SSH_OPTIONS | Equivalent to the -o ssh command option. Passes options to the SSH client in the format used in the client configuration file. Can be used multiple times. |

Authentication Options: Parameters affecting authentication.
| flag(s)          | Description                           |
|-                 |-                                      |
| `--priv=`SSH_PRIV     | Ssh private key file. |
| `--priv-passwd=`SSH_PRIV_PASSWD | Passphrase for ssh private key file. |
| `-i`, `--ignore-host-keys` | By default ssh host keys are honored and connections will ask for approval. Use this option to disable StrictHostKeyChecking. |
| `--no-host-keys`         | Removes all host key checking functionality from SSH session. |
| `--user=`SSH_USER     | Set the default user to attempt to use when authenticating. |
| `--passwd=`SSH_PASSWD | Set the default password to attempt to use when authenticating. |
| `--askpass`           | Interactively ask for the SSH password with no echo - avoids password in process args and stored in history. |
| `--key-deploy`        | Set this flag to attempt to deploy the authorized ssh key with all minions. This combined with --passwd can make initial deployment of keys very fast and easy. |
| `--identities-only`   | Use the only authentication identity files configured in the ssh_config files. See IdentitiesOnly flag in man ssh_config. |
| `--sudo`              | Run command via sudo. |
| `--update-roster`     | If hostname is not found in the roster, store the information into the default roster file (flat). |

Scan Roster Options: Parameters affecting scan roster.
| flag(s)          | Description                           |
|-                 |-                                      |
| `--scan-ports=`SSH_SCAN_PORTS | Comma-separated list of ports to scan in the scan roster. |
| `--scan-timeout=`SSH_SCAN_TIMEOUT | Scanning socket timeout for the scan roster. \

Logging Options: Logging options which override any settings defined on the configuration files.
| flag(s)          | Description                           |
|-                 |-                                      |
| `-l` LOG_LEVEL, `--log-level=`LOG_LEVEL | Console logging log level. One of 'all', 'garbage', 'trace', 'debug', 'profile', 'info', 'warning', 'error', 'critical', 'quiet'. Default: 'warning'. The following log levels are INSECURE and may log sensitive data: all, debug, garbage, profile, trace |
| `--log-file=`SSH_LOG_FILE | Log file path. Default: '/var/log/salt/ssh'. |
| `--log-file-level=`LOG_LEVEL_LOGFILE | Logfile logging log level. One of 'all', 'garbage', 'trace', 'debug', 'profile', 'info', 'warning', 'error', 'critical', 'quiet'. Default: 'warning'. The following log levels are INSECURE and may log sensitive data: all, debug, garbage, profile, trace |
