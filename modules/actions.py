import subprocess

from talon import Module, app, clip, ui, applescript

from typing import Callable

from . import mic
from .. import formatting
mod = Module()

mic_state = True


# noinspection PyMethodParameters,PyMethodMayBeStatic
@mod.action_class
class Actions:
    def copy_bundle():
        """Copy application bundle"""
        bundle = ui.active_app().bundle
        clip.set(bundle)
        app.notify("Copied app bundle", body="{}".format(bundle))

    def current_engine() -> str:
        """Get string describing current current_engine"""
        # noinspection PyUnresolvedReferences
        from talon import speech_system
        return str(speech_system.engine)

    def sh(cmd: str) -> str:
        """Run a shell command."""
        subprocess.check_output(cmd, shell=True)

    def format(formatters: list, phrase: list) -> str:
        """Format phrase with formatters"""
        return formatting.formatted_text(phrase, *formatters)

    def camel(phrase: list) -> str:
        """Format phrase with camelCase"""
        return formatting.formatted_text(phrase, formatting.GOLANG_PRIVATE)

    def uppercamel(phrase: list) -> str:
        """Format phrase with UpperCamelCase"""
        return formatting.formatted_text(phrase, formatting.GOLANG_PUBLIC)

    def dotted(phrase: list) -> str:
        """Format phrase with dotted.words"""
        return formatting.formatted_text(phrase, formatting.DOT_SEPARATED)

    def dashed(phrase: list) -> str:
        """Format phrase with dashed-words"""
        return formatting.formatted_text(phrase, formatting.DASH_SEPARATED)

    def downscored(phrase: list) -> str:
        """Format phrase with downscored_words"""
        return formatting.formatted_text(phrase, formatting.DOWNSCORE_SEPARATED)

    def sentence(phrase: list) -> str:
        """Format phrase with Sentence formatting"""
        return formatting.formatted_text(phrase, formatting.SENTENCE)

    def lowsmash(phrase: list) -> str:
        """Format phrase with lowsmashwords"""
        return formatting.formatted_text(phrase, formatting.LOWSMASH)

    def jargon(phrase: list) -> list:
        """Replace jargon in phrase."""
        return formatting.replace_jargon(phrase)

    def talon_hotkey():
        """Toggle talon state."""
        current = mic.get_input_volume()
        if current:
            mic.set_input_volume(0)
        else:
            mic.auto_mic_volume()

    def applescript(script: str) -> str:
        """Run applescript"""
        return applescript.run(script)
