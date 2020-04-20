import typing as t

from talon import applescript

# noinspection PyUnresolvedReferences
from talon_plugins import microphone


def use_mic(mic_name):
    mic = microphone.manager.active_mic()
    if mic is not None and mic.name == mic_name:
        return
    # noinspection PyUnresolvedReferences
    mics = {i.name: i for i in list(microphone.manager.menu.items)}
    if mic_name in mics:
        microphone.manager.menu_click(mics[mic_name])


# XXX Settings in a  talon file?
mic_settings = {
    "Plantronics Blackwire 435": 100,
    "ATR2USB": 80,
    "AndreaMA": 35,
    "Yeti Stereo Microphone": 50,
}


def auto_mic_volume():
    mics = {i.name: i for i in list(microphone.manager.menu.items)}
    for m in mic_settings:
        if m in mics:
            set_input_volume(mic_settings[m])


def get_input_volume() -> int:
    return int(applescript.run("input volume of (get volume settings)"))


def set_input_volume(m: int):
    applescript.run(f"set volume input volume {m}")
