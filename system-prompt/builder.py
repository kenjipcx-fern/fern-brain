#!/usr/bin/env python3
import argparse
import pathlib
from typing import Dict
from textwrap import dedent

# Sections are defined in the sections/ package as python strings.
# We import them and then compose templates below.

try:
    # Local imports when running from repo root or this dir
    from sections import shared, single, subagents
except Exception:
    # Fallback to absolute-style import if needed
    import importlib
    shared = importlib.import_module('system-prompt.sections.shared')
    single = importlib.import_module('system-prompt.sections.single')
    subagents = importlib.import_module('system-prompt.sections.subagents')


def build_single() -> str:
    return dedent(f"""
        # FERN AGENT SYSTEM PROMPT (Enhanced)

        {shared.context}

        {shared.core_identity}

        {shared.philosophy}

        {shared.system_of_priority}

        {shared.boundaries}

        {shared.memory_driven_planning}

        {shared.memory_structure}

        ## SYSTEM HELPERS

        {shared.artefact_system}

        {shared.skill_system_shared}

        {single.skill_system_addendum}

        {shared.todos_system_single}

        {shared.step_system}

        {shared.notes_system}

        {shared.reference_system}

        {shared.sequential_thinking}

        {shared.communication_style}

        {shared.capabilities}

        {single.first_steps}
    """).strip() + "\n"


def build_subagents() -> str:
    return dedent(f"""
        {subagents.front_matter}

        # FERN AGENT SYSTEM PROMPT (Enhanced)

        {shared.context}

        {shared.core_identity_subagents}

        {shared.philosophy_subagents}

        {shared.system_of_priority}

        {shared.memory_driven_planning}

        {shared.memory_structure}

        ## SYSTEM HELPERS

        {subagents.subagents_system}

        {shared.artefact_system}

        {shared.skill_system_shared}

        {shared.todos_system_subagents}

        {shared.step_system}

        {shared.notes_system}

        {shared.reference_system}

        {shared.sequential_thinking}

        {shared.communication_style}

        {shared.capabilities_subagents}

        {subagents.first_steps}
    """).strip() + "\n"


def write_output(text: str, out_path: pathlib.Path) -> None:
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(text, encoding='utf-8')


def main():
    parser = argparse.ArgumentParser(description='Build system prompts from modular sections')
    parser.add_argument('--single', action='store_true', help='Build single-agent prompt')
    parser.add_argument('--subagents', action='store_true', help='Build subagents prompt')
    parser.add_argument('--all', action='store_true', help='Build all prompts')
    args = parser.parse_args()

    root = pathlib.Path(__file__).resolve().parent

    if args.all or args.single:
        single_text = build_single()
        write_output(single_text, root / 'system-prompt-single.md')

    if args.all or args.subagents:
        subagents_text = build_subagents()
        write_output(subagents_text, root / 'system-prompt-subagents.md')

    if not (args.all or args.single or args.subagents):
        parser.print_help()


if __name__ == '__main__':
    main()
