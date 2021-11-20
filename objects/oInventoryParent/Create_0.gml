row_length = 3;
cell_size = 17;
bottom_border = 13;
gap = 1;
border_size = 3;
inventory = array_create(INVENTORY_SLOTS_SMALL,-1);//empty slot is -1 not 0

list_of_item_sprites = [sArrowInv, sScarletInv,sHealthPotionInv,bloodswordinv];//list of all item sprites
list_of_item_object_reference = [oBolt,oYellowSword,oHealthPotion,oDemonSword];//list of all item objects, must direcly corespond to item sprites
open = 0;
draw_select = -1;
description_scarlet = 0;
description_demon_sword = 0;
text_box = 0;
equip_enable = 0;
first_open = 1;

INVENTORY_TYPE = "Parent";//can be "Player", "Home", "Shop"