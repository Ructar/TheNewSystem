/*
!!!!!!!!!!!!!!!!!!!!!!!!!!
GenesisLoad by XenonDesign
!!!!!!!!!!!!!!!!!!!!!!!!!!
      version 2.05
*/

/*URL for the server logo
Leave it blank to use text instead*/
var l_serverImage = "https://img11.hostingpics.net/pics/699664204297201580140347606725899124669738124768n.png";

/*Custom server name configuration
Leave it blank for automatic server name*/
var l_serverName = "The Lost QC";

/*Use a video for the background?
Otherwise it will just use images*/
var l_bgVideo = false

/*Video background
Avaiable options:
"backgrounds/videos/aurora.webm"
"backgrounds/videos/bluefall.webm"
"backgrounds/videos/bluetilefloor.webm"
"backgrounds/videos/bluewhitecircles.webm"
"backgrounds/videos/bokehlens.webm"
"backgrounds/videos/cleanbokeh.webm"
"backgrounds/videos/coldnight.webm"
"backgrounds/videos/colorfulburst.webm"
"backgrounds/videos/dancingstars.webm"
"backgrounds/videos/dropsflares.webm"
"backgrounds/videos/focusorangebokeh.webm"
"backgrounds/videos/glimmering.webm"
"backgrounds/videos/glowingrings.webm"
"backgrounds/videos/greencircles.webm"
"backgrounds/videos/hues.webm"
"backgrounds/videos/inthedeep.webm"
"backgrounds/videos/modernflourish.webm"
"backgrounds/videos/orangeaura.webm"
"backgrounds/videos/warminside.webm"
"backgrounds/videos/yellowgreen.webm"

You can add custom backgrounds
Just make sure it is at webm VP8 format */
var l_background = "https://genesisgaming.ca/loading/backgrounds/videos/inthedeep.webm";

/*(Image-background only)
Place one or more images
Multiple images will automatically shuffle between them*/
var l_bgImages = [
	"https://img11.hostingpics.net/pics/251273back1.jpg",
	"https://img11.hostingpics.net/pics/137105back2.jpg",
	"https://img11.hostingpics.net/pics/415365back3.jpg"
];

/*Random background images order?*/
var l_bgImagesRandom = false;

/*(Image-background only)
Delay between background images changes
in milliseconds*/
var l_bgImageDuration = 5000;

/*(Image-background only)
Image background fade velocity
in milliseconds*/
var l_bgImageFadeVelocity = 2000;

/*Enable background overlay?*/
var l_bgOverlay = false;

/*Background darkening amount
0 for none (0%), 100 for pitch black (100%)*/
var l_bgDarkening = 50;

/*Music player
'true' or 'false' to enable music in the background*/
var l_music = true;

/*Display actual song's name?*/
var l_musicDisplay = true;

/*Music playlist
Place how much Youtube IDs/.ogg you want*/
var l_musicPlaylist = [
	{ogg: "loadsong.ogg", name: "TÜLPA & BLANKTS - Blueblack"}
];

/*Random music order?*/
var l_musicRandom = true;

/*Music volume
Choose a value between 0 and 100*/
var l_musicVolume = 12;

/*Enable custom messages?*/
var l_messagesEnabled = true;

/*Enter your custom messages below*/
var l_messages = [
"Bienvenue à tous sur The Lost QC !",
"Le Discord: discord.gg/45rXuvG",
"Le serveur est en développement constant."
];

/*Random message order?*/
var l_messagesRandom = true;

/*Delay between message changes
in milliseconds*/
var l_messagesDelay = 5000;

/*Messages fade time
in milliseconds*/
var l_messagesFade = 1000;
