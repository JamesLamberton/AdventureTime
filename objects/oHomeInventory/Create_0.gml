slot_num = 12;

row_length = 4;
cell_size = 17;
bottom_border = 13;
gap = 1;
border_size = 3;
inventory = array_create(slot_num,-1);//empty slot is -1 not 0

list_of_item_sprites = [sArrowInv, sScarletInv,sHealthPotionInv,bloodswordinv];//list of all item sprites
list_of_item_object_reference = [oBolt,oYellowSword,oHealthPotion,oDemonSword];//list of all item objects, must direcly corespond to item sprites

open = 0;
draw_select = 0;
type = "Home";

scarlet = -1;
blood_sword = -1;

found_slot = 0;

home_or_personal = -1;//-1 if mouse over home, 1 if mouse ovfer personal