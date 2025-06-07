Simple game loop
```Python
import pygame as pg
pg.init()

size = (512, 512)
screen = pg.display.set_mode(size)

running = True
while running:
    screen.fill((0, 0, 0)) 
    for event in pg.event.get():
        if event.type == pg.QUIT:
            running = False
    pg.display.flip()

pg.quit()
```
### Useful functions:
```Python
surface.blit(image, (0, 0)) # display image at (0, 0)
pg.display.flip() # flips buffers (pygame uses double buffering)
pg.draw.rect(screen, color, pygame.Rect(x, y, w, h))
pg.draw.ellipse(surface, color, rect)
pg.draw.line(surface, p1, p2, width) # Also has pg.draw.lines()
pg.draw.circle(surface, color, radius)
pg.draw.polygon(surface, color, points, width)
pg.image.frombuffer(bytes(b), img_size, "RGB")	
clock = pg.time.Clock()
clock.tick(fps) # sets framerate 
```

> [!example]
> ```Python
> 	##### EVENTS
> 	# event types: KEYDOWN, KEYUP, QUIT etc.
> 	if event.type in (pygame.KEYDOWN, pygame.KEYUP):
> 		key_name = pygame.key.name(event.key)
> 
> 	##### TEXT
> 	font = pygame.font.SysFont("Times new Roman", 72)  
> 	text = font.render("Hello, Pygame", True, (158, 16, 16)) 
> 	screen.blit(text, size)
> 
> 	##### SPRITES
> 	class MySprite(pygame.sprite.Sprite):
> 		def __init__(self, pos, size=[20,20], color=(0, 0, 0)):
> 			super().__init__()
> 			pygame.sprite.Sprite.__init__(self)  
> 			self.image = pygame.Surface(size)  
> 			self.image.fill(color)  
> 			self.rect = self.image.get_rect()  
> 			self.rect.center = pos
> 	
> 	player = MySprite([10, 20])
> 	wall = MySprite([40, 30])
> 	sprite_group = pygame.sprite.Group()  
> 	sprite_group.add(player)
> 	sprite_group.add(wall)
> 	sprite_group.draw(screen)
> 	# Collision between sprites
> 	pg.sprite.spritecollide(sprite, sprite_group, collided=True)
> 
> 	##### Time
> 	clock = pygame.time.Clock()
> 	clock.tick(fps) # sets framerate 
> ```

> [!note]
> - Pygame uses double buffering
> - By default Pygame has no frame limit
> - Pyglet is extension library for Pygame which adds image, sound, music, video loading, multiple windows and monitors etc. 
