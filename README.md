# goto

The `goto` command allows you to define keywords associated with paths in your system. Running the command `goto KEY` (_KEY_ being a previosuly defined keyword) will cd you into the path associated with _KEY_. Run `goto -h` for more info.

## Installation

To install clone the repo and then run the following commands from the downloaded folder:
```bash
    chmod +x INSTALL.sh
	./INSTALL.sh
```
And then either `source ~/.bash.rc` or open a new terminal to use the command.

To change the installation path run `./INSTALL.sh -d [/desired/absolute/path]` instead.
