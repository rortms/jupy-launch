# jupy-launch
Launches a jupyter server in an ansi term inside emacs rooted at your input directory and running under your input python environment.

# Why
To use EIN I would usually have to activate my desired conda environment, launch a jupyter server with no browser, copy the token from
the terminal output, and paste it after calling ein:notebooklist-login, all a bit of a pain. The two functions provided by jupy-launch.el
basically perform those steps. Maybe this functionality was already built into EIN? Anyways this way I got to practice writing a little bit
of elisp.

# To use
Place this somewhere in your configuration file, make sure jupy-launch.el is in your load path.

`(autoload 'jupy-launch "jupy-launch" "Startup Jupyter server in buffer" t)


It is assumed that you have set up pyvenv for your emacs. Then to launch,

`M-x jupy-launch

The minibuffer will prompt you to enter the directory you want to work from, then the python environment you want to work in. Then,

`M-x ein-get-psswd-and-login

Will log you in and open the EIN directory menu. Hope its helpful!
