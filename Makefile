.PHONY: prompts prompts-single prompts-subagents

prompts:
	python3 system-prompt/builder.py --all

prompts-single:
	python3 system-prompt/builder.py --single

prompts-subagents:
	python3 system-prompt/builder.py --subagents

