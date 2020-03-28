from talon import Module, app, clip, ui

mod = Module()


# noinspection PyMethodParameters,PyMethodMayBeStatic
@mod.action_class
class Actions:
    def copy_bundle():
        """Copy application bundle"""
        bundle = ui.active_app().bundle
        clip.set(bundle)
        app.notify("Copied app bundle", body="{}".format(bundle))