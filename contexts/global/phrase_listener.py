from talon.engine import engine


def on_phrase_post(j):
    # print(j)
    phrase = " ".join(j.get('phrase', []))
    if phrase:
        with open("last_phrase.txt", "w") as fh:
            fh.write(phrase)


engine.register('post:phrase', on_phrase_post)