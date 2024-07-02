extends Sprite3D

export var anim_col = 0
var camera = null

func set_camera(cam):
	camera = cam

func _process(_delta):
	if camera == null:
		return
	
	var player_fwd = -camera.global_transform.basis.z
	var fwd = global_transform.basis.z
	var left = global_transform.basis.x
	
	# dot products (dar uma olhada no que são)
	var l_dot = left.dot(player_fwd)
	var f_dot = fwd.dot(player_fwd)
	
	# encarando o jogador
	var row = 0
	flip_h = false
	
	if f_dot < -0.85:
		row = 0 # sprite frontal
	elif f_dot > 0.85:
		row = 4 # sprite traseiro
	else:
		flip_h = l_dot > 0 #vira pro lado certo
		if abs(f_dot) < 0.3:
			row = 2 # sprite perpendicular pra esquerda
		elif f_dot < 0:
			row = 1 # sprite frente esquerda
		else:
			row = 3 # sprite traiseira esquerda
	
	# configura o frame certo
	frame_coords.x = anim_col
	frame_coords.y = row
