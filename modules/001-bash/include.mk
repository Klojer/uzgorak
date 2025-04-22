SHELL_RC_FILE = ~/.bashrc

BEGIN_OF_ALIASES = \#Begin of Aliases
END_OF_ALIASES = \#End of Aliases
BEGIN_OF_ENV_VARS = \#Begin of Env vars
END_OF_ENV_VARS = \#End of Env vars
BEGIN_OF_EVALS = \#Begin of Evals
END_OF_EVALS = \#End of Evals

bash/alias/to-begin:
	sed -i '/$(BEGIN_OF_ALIASES)/a\$(VALUE)' $(SHELL_RC_FILE)

bash/alias/to-end:
	sed -i '/$(END_OF_ALIASES)/i\$(VALUE)' $(SHELL_RC_FILE)

bash/env-var/to-begin:
	sed -i '/$(BEGIN_OF_ENV_VARS)/a\$(VALUE)' $(SHELL_RC_FILE)

bash/env-var/to-end:
	sed -i '/$(END_OF_ENV_VARS)/i\$(VALUE)' $(SHELL_RC_FILE)

bash/eval/to-begin:
	sed -i '/$(BEGIN_OF_EVALS)/a\$(VALUE)' $(SHELL_RC_FILE)

bash/eval/to-end:
	sed -i '/$(END_OF_EVALS)/i\$(VALUE)' $(SHELL_RC_FILE)

# TODO: fix empty lines after remove
bash/remove-line:
	sed -i 's|$(VALUE)||g' $(SHELL_RC_FILE)
