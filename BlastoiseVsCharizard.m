
function OMGITS3D()
clc;
clear;
global curChar;




c='l';
figure('NumberTitle','off',...
       'Name','Make sure window is in focus',...
       'Menubar','none',...
       'Position',[1000 728 1000 200],...
       'KeyPressFcn',@dispkeyevent);
uicontrol('Style','text',...
          'String','USE WASD AND MOUSE TO MOVE ',...
          'FontSize',10,...
          'FontWeight','bold',...
          'Units','normalized','Position',[.25 .8 .5 .1]);
uicontrol('Style','text',...
          'String','Charizards Health',...
          'FontWeight','bold',...
          'Units','normalized','Position',[.1 .6 .24 .1]);
uicontrol('Style','text',...
          'String','Dragons Health',...
          'FontWeight','bold',...
          'Units','normalized','Position',[.3 .6 .24 .1]);
uicontrol('Style','text',...
          'String','Key',...
          'FontWeight','bold',...
          'Units','normalized','Position',[.5 .6 .24 .1]);
uicontrol('Style','text',...
          'String','Defense Timer',...
          'FontWeight','bold',...
          'Units','normalized','Position',[.7 .6 .24 .1]);

htxt6 = uicontrol('Style','text',...
                 'String','',...
                 'FontWeight','normal',...
                 'Units','normalized','Position',[.1 .375 .24 .2]);
htxt7 = uicontrol('Style','text',...
                 'String','',...
                 'FontWeight','normal',...
                 'Units','normalized','Position',[.3 .375 .24 .2]);
htxt8 = uicontrol('Style','text',...
                 'String','',...
                 'FontWeight','normal',...
                 'Units','normalized','Position',[.5 .375 .24 .2]);
htxt9 = uicontrol('Style','text',...
                 'String','',...
                 'FontWeight','normal',...
                 'Units','normalized','Position',[.7 .375 .24 .2]);


function dispkeyevent(~, event)

    c = event.Character;
    curChar=c;
    set(htxt6,'String',dragonhealth)
    set(htxt7,'String',trexhealth)
    set(htxt8,'String',event.Key)
    set(htxt9,'String',defensecounter)
  
    end

uicontrol('Style','text',...
          'String','Use Q to attack and E to defend. Press space to jump',...
          'FontSize',10,...
          'FontWeight','bold',...
          'Units','normalized','Position',[.25 .1 .5 .3]);%.25 .8 .5 .1

%%MUSIC PRELOAD HERE%%

[y,Fs] = audioread('battlesong.wav');
battlesong = audioplayer(y, Fs);

[y,Fs] = audioread('victorytheme.mp3');
victorytheme = audioplayer(y, Fs);

[y,Fs] = audioread('lowhp.wav');
lowhp = audioplayer(y, Fs);

[y,Fs] = audioread('blastoise.wav');
blastoise = audioplayer(y, Fs);

[y,Fs] = audioread('grrr.wav');
charizard = audioplayer(y, Fs);

[y,Fs] = audioread('finalblast.wav');
finalblast = audioplayer(y, Fs);


[y,Fs] = audioread('finalfinal.wav');
finalfinal = audioplayer(y, Fs);


[y,Fs] = audioread('blastoiseyelling.wav');
blastoiseyelling = audioplayer(y, Fs);

[y,Fs] = audioread('upintheair.wav');
upintheair = audioplayer(y, Fs);


%%MUSIC END%%

coords = get(0,'PointerLocation'); 
mousex=coords(1);
mousey=coords(2);

world=vrworld('vrmount2.wrl');
open(world);
fig= view(world, '-internal');
%properties=vrfigure(world);
%vrfigure(world).Fullscreen=true;
vrdrawnow;
dragonattack='start';
trex= vrnode(world, 'blastoise');
dragon=vrnode(world,'charizard');
ball=vrnode(world,'sphere');
ball2=vrnode(world,'sphere2');
marker2=vrnode(world,'marker2');
humantorch=vrnode(world,'HumanTorch');
defense=vrnode(world,'defense');
reload(world);
count=0;
i=1;
dragonmode=true; %true for defensive false for offensive.
attackthebitchdragon=0;
ballthrow=0;
merrygoround=false;
y=0;
x=50;
zcar=185;
l=pi;
ml=pi;
cx=0;
cy=0;
cz=0;
bcord=[-100 -100 -100];
dy=0;
dx=50;
dz=6;
%global thetwoends;
thetwoends=[50 0 6; 50 0 185];
%global chariend;
chariend=1;
trexhealth=150;
dragonhealth=100;
chariheight=30;
jump=false;
mx=0;
my=y+20;
mz=0;
fireball=false;
fireballshooter=false;
fastcome=false;
attackcord=[mx my mz];
dragon.translation=[dx dy dz];
interval=[ 0 0 0];
falldown=false;
jump=false;
checker=0;
shoot=false;
shoothuman=false;
arr=zeros(50,3);
arr(1,:)=[0 0 0];

rot=zeros(50,4);
rot(1,:)=[0 0 0 0];

screensize=get(0,'MonitorPositions');
screenxmax=screensize(1,3);

chariattackcord=zeros(50,3);
chariattackcord(1,:)=[0 0 0];

chariattackrot=zeros(50,4);
chariattackrot(1,:)=[0 0 0 0];

arr2=zeros(100,3);
arr2(1,:)=[0 0 0];

defensemode=false;
defensecounter=100;

rot2=zeros(50,4);
rot2(1,:)=[0 0 0 1];
trans=false;

markercord=[x+((20)*sin(l)) my zcar+((20)*cos(l))];
intervalcalc=0;
counter2=1;
%pause(10);
coordcounter=1;
    modes={'yoyo';'start';'scareattack';'attack1';'attack2';'defensemode';'defensemode';'standby2'};
    modecounter=1;
dragonattack=modes(modecounter);

play(battlesong);
while true

    curChar=lower(curChar);


     if (curChar==' ')
         jump=true;
         curChar=4;

     elseif curChar=='s'
         zcar=zcar-cos(l);
         x=x-sin(l);
    if(strcmp(dragonattack,'yoyo'))
        modecounter=modecounter+1;
        dragonattack=modes(modecounter);
    end
     elseif curChar=='w'
        zcar=zcar+2.5*cos(l);
        x=x+2.5*sin(l);
     
    if(strcmp(dragonattack,'yoyo'))
        modecounter=modecounter+1;
        
        dragonattack=modes(modecounter);
    end
     elseif curChar=='d'
        zcar=zcar-sin(l);
         x=x-cos(l);
     
    if(strcmp(dragonattack,'yoyo'))
        modecounter=modecounter+1;
        
        dragonattack=modes(modecounter);
    end
     elseif curChar=='a'
        zcar=zcar+sin(l);
         x=x+cos(l);
     
    if(strcmp(dragonattack,'yoyo'))
        modecounter=modecounter+1;
        
        dragonattack=modes(modecounter);
    end
     elseif curChar=='q'
         ballthrow=1;
         attackthebitchdragon=1;
         attackcord=[mx my mz];
         intervalcalc=1;
         
         i=0;
         
   
     
    elseif curChar=='e' 
        if(defensecounter==100)
        defensemode=true;
        play(blastoiseyelling);
        end
        curChar='4';
        
     elseif curChar=='1'
        % merrygoround=true;
     elseif curChar=='2'
        % fireballshooter=true;
         curChar=4;
     %elseif curChar=='.'
        
      %   checker=input('Enter checker: ');
     
     elseif curChar=='6'
        modecounter=modecounter+1;
        dragonattack=modes(modecounter);
        curChar='4';
    elseif curChar=='7'
        modecounter=1;
        dragonattack=modes(modecounter);
        curChar=4;
        
     elseif curChar==';'
        a=[x y zcar];
        disp(a);
        disp(bcord);
        disp(l);
     end
     
    
     if(dragonhealth>0)    
    play(battlesong);
     else
         stop(battlesong);
end

 if coordcounter>50   
coords = get(0,'PointerLocation'); 
changecoord=[coords(1)-mousex coords(2)-mousey];

mousex=coords(1);
mousey=coords(2);
if(coordcounter==51)
    changecoord=[0 0];
end
 else
     changecoord=[0 0];
 end
     
     
     
     
     
     
     
     if(l>2*pi) 
         l=0;
     elseif (l<0)
         l=2*pi;
     end
     %dragon.translation=[dx dy dz];
     trex.translation=[x y zcar];
     trex.rotation = [0,1,0, l];
     %marker2.translation=[mx my mz];
     if (ballthrow==1)
        bcord=[x+(6*sin(l)) y+11 zcar+(6*cos(l))];%+((1)*sin(l)) y+3 zcar+((10)*cos(l))];
        ball.translation=bcord;
        ballthrow=0;
        play(blastoise);
        curChar='4';
     end
     if intervalcalc==1
         for j=1:3
         interval(j)=(attackcord(j)-bcord(j))/2;
         end
         intervalcalc=0;
         curChar='4';
     end
     if attackthebitchdragon==1
         if i<15
             ball.scale=[0.2*i 0.2*i 0.2*i];
             
         end
         
         if i>10
         for j=1:3
             bcord(j)=bcord(j)+interval(j);
         end
         end
         ball.rotation=[0 0 1 i*pi/4];
            i=i+1;
     end
         
     ball.translation=bcord;
     
     %%%%%%%% MARKER START
     
     mx=x+(80*sin(ml));
     my=my+(changecoord(2)/10);
     mz=zcar+(80*cos(ml));
     if(my>y+80)
        my=y+80;
    elseif(my<y+10)
    my=y+10;
     end
     
     if(changecoord(1)==0 && mousex==1)
         changecoord(1)=-50;
     elseif (changecoord(1)==0 && mousex==screenxmax)
         changecoord(1)=50;
     end
     
     ml=ml-(changecoord(1)/400);
     
     if(ml>2*pi) 
         ml=0;
         l=0;
     elseif (ml<0)
         ml=2*pi;
         l=2*pi;
     end
     
     
     
     if(ml<l-(pi/4))
         %ml=l-(pi/4);
         l=ml+(pi/4);
         
     elseif (ml>l+(pi/4))
         %ml=l+(pi/4);
        l=ml-(pi/4);
        
     end
     
     
     %markercord=[x+((20)*sin(l)) my zcar+((20)*cos(l))];
     marker2.translation=[mx my mz];
     marker2.rotation=[0,1,0,ml];

     
     
     
     
     
     %%% MARKER FINISH
     
    if strcmp(dragonattack,'start')==1

    [arr2,rot2]=beginningflyscene(dx,dy,dz,l,chariheight);
    trans=true;
    dragonattack='standby';
    
    elseif trans==false && strcmp(dragonattack,'scareattack')==1
    [arr2,rot2]=scaresequence(x,y,zcar,dx,dy,dz);
    trans=true;
    play(upintheair);
    dragonattack='standby';
    end
    
    if(strcmp(dragonattack,'attack1'))
        if(chariend==1)
            dragonattack='shoot';
        else
            merrygoround=true;
        end
    elseif(strcmp(dragonattack,'attack2'))
        if(chariend==1)
        dragonattack='shoothuman';
        else
            merrygoround=true;
        end
    end
    
if trans==true && isempty(arr2)==0
 
         dragon.translation=[arr2(1,1) arr2(1,2) arr2(1,3)];
         dragon.rotation=[rot2(1,1) rot2(1,2) rot2(1,3) rot2(1,4)];
         dx=arr2(1,1);
         dy=arr2(1,2);
         dz=arr2(1,3);
         arr2(1,:)=[];
         rot2(1,:)=[];
         if(isempty(arr2)==1)
             trans=false;
             modecounter=modecounter+1;
             dragonattack=modes(modecounter);
        end
     
end

if strcmp(dragonattack,'shoot')
    [chariattackcord, chariattackrot]=generateattackcord(x,y,zcar,dx,dy,dz,l);
    shoot=true;
    play(finalblast);
    dragonattack='standby';
end
if shoot==true && isempty(chariattackcord)==0
    ball2.translation=[chariattackcord(1,1) chariattackcord(1,2) chariattackcord(1,3)];
    
    if(length(chariattackcord)>=10)
        ball2.scale=[0.1*(20-length(chariattackcord)) 0.1*(20-length(chariattackcord)) 0.1*(20-length(chariattackcord))];
    end
    
    if((chariattackcord(1,1)<(x+20) && chariattackcord(1,1)>(x-20)))
         if(chariattackcord(1,2)<(y+20) && chariattackcord(1,2)>(y-20))
             if(chariattackcord(1,3)<(zcar+20) && chariattackcord(1,3)>(zcar-20))
         trexhealth=trexhealth-10;
        fprintf('Blastoise hit. Health: %i \n', trexhealth);
        ball2.translation=[-100 -100 -100];
        chariattackcord(:,:)=[];
        chariattackrot(:,:)=[];
             end
         end
     end
     
    if(isempty(chariattackcord)==0)
    chariattackcord(1,:)=[];
    chariattackrot(1,:)=[];
    end
    if(isempty(chariattackcord)==1)
        shoot=false;
        modecounter=modecounter+1;
       dragonattack=modes(modecounter); 
    end
end


if strcmp(dragonattack,'shoothuman')
    [chariattackcord, chariattackrot]=generateattackcord(x,y,zcar,dx,dy,dz,l);
    shoothuman=true;
    torchscale=0.05;
    dragonattack='standby';
    play(finalfinal);
end
if shoothuman==true && isempty(chariattackcord)==0
    
    humantorch.translation=[chariattackcord(1,1) chariattackcord(1,2) chariattackcord(1,3)];
    %ball2.rotation=[chariattackrot(1,1) chariattackrot(1,2) chariattackrot(1,3) chariattackrot(1,4)];
    
    if(length(chariattackcord)>=10)
        humantorch.scale=[torchscale torchscale torchscale];
        
    end
    
    if((chariattackcord(1,1)<(x+20) && chariattackcord(1,1)>(x-20)))
         if(chariattackcord(1,2)<(y+20) && chariattackcord(1,2)>(y-20))
             if(chariattackcord(1,3)<(zcar+20) && chariattackcord(1,3)>(zcar-20))
         trexhealth=trexhealth-20;
        fprintf('Blastoise hit. Health: %i \n', trexhealth);
       
        humantorch.translation=[-100 -100 -100];
        chariattackcord(:,:)=[];
        chariattackrot(:,:)=[];
             end
         end
     end
    
     if(isempty(chariattackcord)==0)
    
    chariattackcord(1,:)=[];
    chariattackrot(1,:)=[];
     end
    
    if torchscale<0.2
    torchscale=torchscale+0.05;
    end
    
    if(isempty(chariattackcord)==1)
        shoothuman=false;
        
        modecounter=modecounter+1;
       
             dragonattack=modes(modecounter);
    end
end
    if strcmp(dragonattack,'defensemode')
       [arr2, rot2,chariend]=generatestrafing(x,y,zcar,dx,dy,dz,chariend,thetwoends);
       trans=true;
       dragonattack='standby'; 
    end

     %%%%% ATTACK 1 %%%%%%%%%%%%%%5
     
     if fireballshooter==true
         kk=0;
         dy=chariheight;
         [arr2, rot2, kk]=generatefireballshooter(x,y,zcar,dx,dy,dz,l,markercord);
         fireballshooter=false;
         fastcome=true;
     end
   
     if (fastcome==true && isempty(arr2)==0)
         
         dragon.translation=[arr2(1,1) arr2(1,2) arr2(1,3)];
         dragon.rotation=[rot2(1,1) rot2(1,2) rot2(1,3) rot2(1,4)];
         
         dx=arr2(1,1);
         dy=arr2(1,2);
         dz=arr2(1,3);
       
         arr2(1,:)=[];
         rot2(1,:)=[];
         %if(length(arr2)<=50)
         %    dragon.center=[0 0 0];
         %end
         if(isempty(arr2)==1)
             fastcome=false;
             
             modecounter=modecounter+1;
             dragonattack=modes(modecounter);
         end
     end
         
     
     %%%%%ATTACK 2%%%%%%%%%%%%%5
     
       if merrygoround==true
         dy=chariheight;
           arr=generatemerrygoround(x,y,zcar,dx,dy,dz);
         merrygoround=false;
         fireball=true;
       end
     
     if(fireball==true)
         dragon.translation=[arr(counter2,1) arr(counter2,2) arr(counter2,3)];
         
         dx=arr(counter2,1);
         dy=arr(counter2,2);
         dz=arr(counter2,3);
         
         counter2=counter2+1;
         dragon.rotation=[1 1 0 3.85];
         if(counter2==length(arr))
             fireball=false;
             counter2=1;
             modecounter=modecounter+1;
             dragonattack=modes(modecounter);
         end
     end
     
     
     if i>50
         attackthebitchdragon=0;
         %curChar='4';
         interval=[0 0 0];
     end
     
     %%JUMP BLASTOISE JUMP%%
     if jump==true
         if falldown==true && y>0
             
             y=y-1;
         elseif y<10
             y=y+1;
         elseif y==10
             falldown=true;
        
         end
         if(y==0)
             falldown=false;
             jump=false;
         end
     end
     
     if((bcord(1)<(dx+20) && bcord(1)>(dx-20)))
         if(bcord(2)<(dy+20) && bcord(2)>(dy-20))
             if(bcord(3)<(dz+20) && bcord(3)>(dz-20))
         dragonhealth=dragonhealth-10;
        fprintf('Charizard hit. Health: %i \n', dragonhealth);
        bcord=[-100 -100 -100];
        i=50;
        attackthebitchdragon=0;
             end
         end
     end
     
     %%%CHARI IS DEAD
     
     if(dragonhealth==0)
         trans=true;
         dragonattack='dead';
         [arr2,rot2,l]= charizarddeathsequence(x,y,zcar,dx,dy,dz,l,chariend,thetwoends);
         stop(battlesong);
         play(victorytheme);
        trex.rotation=[0 1 0 l];
        dragonhealth=-1;
     end
     
     if trans==false&& dragonhealth==-1
         dragonhealth=-2;
         
         disp('Blasty wins!');
         break;
     end
     
     %%%BLASTY DEFENSE CURL%%%
     
     if (defensemode==true && defensecounter>0)
         defense.translation=[x y zcar];
         defensecounter=defensecounter-1;
         if(defensecounter<=0)
             defensemode=false;
             defense.translation=[-100 -100 -100];
         end
     end
     if defensemode==false
         if defensecounter<100
             defensecounter=defensecounter+1;
         end
     end
     
     if trexhealth<=50
         play(lowhp);
     end
     
     if(strcmp(dragonattack,'standby2'))
         modecounter=3;
         dragonattack=modes(modecounter);
     end
     
     
     
     if(zcar>190)
         zcar=190;
     elseif (zcar<0)
         zcar=0;
     end
     if(x<0)
         x=0;
     elseif(x>100)
         x=100;
     end
     
     
     
     
     vrdrawnow;
      
     pause(0.05);
     count=count+1;
     coordcounter=coordcounter+1;
end


uicontrol('Style','text',...
          'String','Blastoise WINS! Thanks for playing.  ',...
          'FontSize',10,...
          'FontWeight','bold',...
          'Units','normalized','Position',[.25 .1 .5 .3]);

end

function [arr2, rot2,chariend]=generatestrafing(x,y,zcar,dx,dy,dz,chariend,thetwoends)
%r=30;
if sqrt( power(dx-x,2) + power(dy-y,2) +power(dz-zcar,2))>50
    [arr2, rot2]=generatestrafingfar(x,y,zcar,dx,dy,dz,chariend);
else
    [arr2, rot2,chariend]=generatestrafingclose(x,y,zcar,dx,dy,dz,chariend,thetwoends);
    %disp('too close');
end
end

function [arr2, rot2]= generatestrafingfar(x,y,zcar,dx,dy,dz,chariend)
r=10;
if chariend==1
    rotation=[1 0 0 pi/2];
    dy=30;
else
    rotation=[0 0 1 3.22];
    dy=30+50;
end
arr2(1,:)=[dx dy dz];
rot2(1,:)=[1 0 0 pi/2];
for j=0:pi/10:pi/2
    arr2(end+1,:)=[arr2(end,1)+(r*cos(j)) dy arr2(end,3)+(r*sin(j))];
    rot2(end+1,:)=rotation;
end
for j=pi/2:-pi/10:-pi/2
    arr2(end+1,:)=[arr2(end,1)-(r*cos(j)) dy arr2(end,3)-(r*sin(j))];
    rot2(end+1,:)=rotation;
end
for j=-pi/2:pi/10:0
    arr2(end+1,:)=[arr2(end,1)+(r*cos(j)) dy arr2(end,3)+(r*sin(j))];
    rot2(end+1,:)=rotation;
end

end

function [arr2,rot2,chariend]=generatestrafingclose(x,y,zcar,dx,dy,dz,chariend,thetwoends)
r=50;
if chariend==1
    point=thetwoends(2,:);
    rotation=[1 0 0 2.47];
else
    point=thetwoends(1,:);
    rotation=[0 0 1 3.22];
end
interval=[point(1)-dx 0 point(3)-dz]/10;
arr2(1,:)=[dx dy dz];
rot2(1,:)=rotation;
for j=2:10
    arr2(j,:)=[arr2(j-1,1)+interval(1) dy arr2(j-1,3)+interval(3)];
    rot2(j,:)=rotation;

end
arr2(end+1,:)=point;
rot2(end+1,:)=rotation;
if chariend==1
    chariend=2;
elseif chariend==2
    chariend=1;
end

[arr3,rot3]=generatestrafingfar(x,y,zcar,arr2(end,1),dy,arr2(end,3),chariend);
 arr2=[arr2 ;arr3];
 rot2=[rot2;rot3];

end

function[arr2, rot2,l]= charizarddeathsequence(x,y,zcar,dx,dy,dz,l,chariend,thetwoends)
if(chariend==1)
   l=pi;
   interval=[x-dx 5-dy zcar-20-dz]/25;
   for i=1:25
   rot2(i,:)=[1 0 0 (pi/2)+i*0.0686];
   arr2(i,:)=[dx+i*interval(1) dy+i*interval(2) dz+i*interval(3)];
   end
elseif (chariend==2)
    l=0;
    interval=[x-dx 5-dy zcar+20-dz]/15;
    for i=1:21
        if i<7
        rot2(i,:)=[0 0 1 3.15-(i*0.132)];
        elseif i>=7
            rot2(i,:)=[0 0 1 rot2(end,4)+0.132];
        end
        arr2(i,:)=[dx+i*interval(1) dy+i*interval(2) dz+i*interval(3)];
    end
end
end

function [chariattackcord,chariattackrot]=generateattackcord(x,y,zcar,dx,dy,dz,l)
for j=1:10 
chariattackcord(j,:)=[dx-(6*sin(l)) dy+11 dz-(6*cos(l))];
chariattackrot(j,:)=[0 0 1 j*pi/4];
end
    
interval=[x-chariattackcord(1,1) y-chariattackcord(1,2) zcar-chariattackcord(1,3)]/10;
for i=1:15
    chariattackcord(end+1,:)=[chariattackcord(end,1)+interval(1) chariattackcord(end,2)+interval(2) chariattackcord(end,3)+interval(3)];
    chariattackrot(end+1,:)=[0 0 1 i*pi/4];
end
end

function [arr2, rot2]= beginningflyscene(dx, dy, dz, l, chariheight)

interval=[0 (chariheight-dy) 0]/10;
arr2(1,:)=[dx dy dz];
rot2(1,:)=[1 0 0 pi/2];
for j=2:10
    arr2(j,:)=[arr2(j-1,1)+interval(1) arr2(j-1,2)+interval(2) arr2(j-1,3)+interval(3)];
    rot2(j,:)=[1 0 0 pi/2];
end
end

function [arr2,rot2,kk]=generatefireballshooter(x,y,zcar,dx,dy,dz,l,markercord)
interval=[ markercord(1)-dx dy markercord(3)-dz]/8;
arr2(1,:)=[dx dy dz];
rot2(1,:)=[1 0 0 2.8];
for j=2:9
    arr2(j,:)=[arr2(j-1,1)+interval(1) dy arr2(j-1,3)+interval(3)];
    rot2(j,:)=[1 0 0 2.8];
end
arr2(end+1,:)=[markercord(1) dy markercord(3)];
rot2(end+1,:)=[1 0 0 2.8];
for i=1:3:150
    arr2(end+1,:)=[x+((20+i)*sin(l)) dy zcar+((20+i)*cos(l))];
    rot2(end+1,:)=[1 0 0 2.8];
end
kk=length(arr2);
for k=1:50
    arr2(end+1,:)=arr2(kk-k,:);
    rot2(end+1,:)=[0 0 1 pi];
end

end

function [arr2, rot2]=scaresequence(x,y,zcar,dx,dy,dz)
r=50;
interval=[x+r-dx 0 zcar+r-dz]/10;
arr2(1,:)=[dx dy dz];
rot2(1,:)=[1 1 0 3.85];
for j=2:10
    arr2(j,:)=[arr2(j-1,1)+interval(1) dy arr2(j-1,3)+interval(3)];
    rot2(j,:)=[1 1 0 3.85];

end
arr2(end+1,:)=[x-r dy zcar+r];
rot2(end+1,:)=[1 1 0 3.85];


arr2(end+1,:)=[x-(r) dy zcar+(r)];
rot2(end+1,:)=[0 0 1 pi/2];
interval=[x-(r)-dx 0 zcar+(r)-dz]/-10;
for j=12:22
    arr2(j,:)=[arr2(j-1,1)+interval(1) dy arr2(j-1,3)+interval(3)];
    rot2(j,:)=[0 0 1 pi/2];
end
arr2(end+1,:)=[dx dy dz];
rot2(end+1,:)=[1 0 0 pi/2];
end

function [arr]= generatemerrygoround(x,y,zcar,dx,dy,dz)
r=50;
interval=[x+(r*cos(4*pi))-dx dy zcar+(r*sin(4*pi))-dz]/10;
arr(1,:)=[dx dy dz];
for j=2:10
    arr(j,:)=[arr(j-1,1)+interval(1) dy arr(j-1,3)+interval(3)];
end
arr(end,:)=[x+(r*cos(4*pi)) dy zcar+(r*sin(4*pi))];
for i=4*pi:-pi/20:0
    arr(end+1,:)=[x+(r*cos(i)) dy zcar+(r*sin(i))];
end

end
