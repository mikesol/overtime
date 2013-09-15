import pygame
import pygame.midi

class MidiIO:         
    def __init__(self, device_id = None, inst=0):
        pygame.midi.init()

        if device_id is None:
            self.output_id = pygame.midi.get_default_output_id()
        else:
            self.output_id = device_id

        port = self.output_id

        print ("using output_id :%s:" % port)

        self.midi_out = pygame.midi.Output(port, 0)
        self.midi_out.set_instrument(inst)

        self.pressed = False

    def noteOn(self, note=60, vel=100):
        if not self.pressed:
            self.midi_out.note_on(note, vel)
            self.pressed = 1
    def noteOff(self, note=60, vel=100):
        self.midi_out.note_off(note)
        self.pressed = 0