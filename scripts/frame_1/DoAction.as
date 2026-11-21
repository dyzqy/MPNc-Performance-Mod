var rightClick = new ContextMenu();
rightClick.hideBuiltInItems();
_root.menu = rightClick;
// 21/11/2026 dyzqy: As I call it, the Mask Trick! Because scrollRect makes it so anything beside what is supposed to be shown, isn't shown OR calculated!
_root.scrollRect = new flash.geom.Rectangle(0, 0, 850, 530);
Object.registerClass("world_map",MadnessWorldMap);
Object.registerClass("madness_world",MadWorld);
Object.registerClass("madness_particle",MadnessParticle);
Object.registerClass("madness_obstacle",MadnessObstacle);
Object.registerClass("madness_game_select",MadnessGameSelect);
Object.registerClass("madness_doors",MadnessDoors);
Object.registerClass("madness_character",MadnessCharacter);
Object.registerClass("madness_activator",MadnessActivator);
