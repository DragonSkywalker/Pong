extends ParallaxBackground

const SCROLL_SPEED = 0.1

func _process(delta):
	scroll_offset.x -= SCROLL_SPEED
