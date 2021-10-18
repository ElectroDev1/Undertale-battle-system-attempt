/// @description
#macro DIALOGUE      0
#macro PORTRAIT      1
#macro SCRIPTS       2

canclose=true;

//Textbox surface ID
textboxSurf   = -4;
rotation      = 0;
center_x      = 0;
center_y      = 0;

Txoffset=0;
Tyoffset=0;


//Textbox sprites
textboxSprite = spr_textbox;


///Text part
#region
textFont      = fnt_dialogue;
textColour    = c_white;
textEffect    =  0;
textMargin_X  = 10;
textMargin_Y  = 36;
#endregion

///Portrait part
#region
portraitSprite = -1;
portraitMarginX = 28;
portraitMarginY = 36;
#endregion

Message[DIALOGUE][0]      = "*No message could be/nfound, LMAO";
Message[PORTRAIT][0]      = -1;
Message[SCRIPTS]          = -1;

MessagePosition = 0;

TextPosition = 0;
TypeSpeed = 1;
onwait=TypeSpeed;

script_done = 0;
