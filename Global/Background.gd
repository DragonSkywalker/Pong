extends ParallaxBackground

const SCROLL_SPEED = 5

func _process(delta):
	scroll_offset.x -= SCROLL_SPEED * delta
