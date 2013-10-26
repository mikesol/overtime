# -*- encoding: utf-8 -*-
import pydot

g = pydot.Dot()
sushi = "Sushi."
g.add_node(pydot.Node(sushi))
drunk = "Bourré de saké."
g.add_node(pydot.Node(drunk))
tea = "Cérémonie du thé."
g.add_node(pydot.Node(tea))
sumo = "Sumo."
g.add_node(pydot.Node(sumo))
geisha = "Geisha."
g.add_node(pydot.Node(geisha))
noh = "Théâtre Nô."
g.add_node(pydot.Node(noh))
#haiku = "Haiku."
g.add_node(pydot.Node(haiku))
bomb = "Bombe."
g.add_node(pydot.Node(bomb))
festival = "Festival bouddhiste."
g.add_node(pydot.Node(festival))
garden = "Jardin."
g.add_node(pydot.Node(garden))
karaoke = "Karaoke."
g.add_node(pydot.Node(karaoke))
robot = "Robot."
g.add_node(pydot.Node(robot))
#cars = "Voitures."
#g.add_node(pydot.Node(cars))
seppuku = "Seppuku."
g.add_node(pydot.Node(seppuku))
origami = "Origami."
g.add_node(pydot.Node(origami))
shoes = "Enlever ses chaussures."
g.add_node(pydot.Node(shoes))
mask = "Masque chirurgical."
g.add_node(pydot.Node(mask))
pokemon = "Pokémon."
g.add_node(pydot.Node(pokemon))
mario = "Mario."
g.add_node(pydot.Node(mario))
shogi = "Shogi / go."
g.add_node(pydot.Node(shogi))
baseball = "Base-ball."
g.add_node(pydot.Node(baseball))
kfc = "KFC"
g.add_node(pydot.Node(kfc))
anime = "Animé."
g.add_node(pydot.Node(anime))
dolphin = "Manger des dauphins."
g.add_node(pydot.Node(dolphin))
dolls = "Poupées en tant que sexe symbole."
g.add_node(pydot.Node(dolls))
old = "Vénération des personnes âgées."
g.add_node(pydot.Node(old))
fan = "Culture de supporteur."
g.add_node(pydot.Node(fan))
bride = "Mariée sur Internet."
g.add_node(pydot.Node(bride))
kitty = "Hello Kitty."
g.add_node(pydot.Node(kitty))

g.add_edge(pydot.Edge(robot, kfc, label="goes into"))
g.add_edge(pydot.Edge(dolphin, kfc, label="goes into"))
g.add_edge(pydot.Edge(kitty, kfc, label="goes into"))
g.add_edge(pydot.Edge(bride, seppuku, label="stands behind"))
g.add_edge(pydot.Edge(pokemon, seppuku, label="final before"))
g.add_edge(pydot.Edge(bomb, kfc, label="creates"))

OUTFI = file('plusDeBlanco.pdf','w')
OUT = g.create(format="pdf", prog="neato")
OUTFI.write(OUT)
OUTFI.close()
#g.write('plusDeBlanco.dot')

'''
Tu es aveugle à mon amour.
Tu glandes dans ton œuf comme si de rien n'était.
Je ne te donnerai plus à manger.
J'ai honte de toi.
Je rachaterai ton petit frère...
...et je vendrai ton lithium sur PriceMinster.

Marie makes origami and takes care of tamagachi while singing traditional song.

Ryan hands Eudes knife.
Both R&M take off shoes.
Mike takes out briefcase with tea ceremony.
Lay down, kimonos, pour tea.

Surgical mask, sumo, take photos while...
Postman arrives with mail order bride. 
Dumps out sushi in KFC on head, becomes Mario.
Bumps square to make airplane that drops bomb, resulting in KFC.
Dolphin, clubs, into KFC.

Marie moves to hold knife over Eudes.  Buffers with hello kitty.
Ryan, as Ash, chooses Pikachu, who starts to eat Eudes.
Ryan then pours water, money, and salt for Harae.
'''
