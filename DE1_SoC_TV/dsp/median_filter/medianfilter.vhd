LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;--．』U工：
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
--定义实体
ENtitY medfilter IS
GENERIC(width: integer:= 8);-- - - ~ i~.~l~}] ,~,.~J~l~jJ~ ,-~q'l)2}y/l~ ~/ll~i~
PORT(
     clk:in STD_LOGIC;
     m11,m12,m13:in STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0);-- - - I~t~ Isl~--,~l~
     m21, m22, m23 : in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;-- - - ~J~ 13 ~Z.~I~J~
     m31 ,m32,m33:in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);-- - - I~J~ 13 ~ -~.~l~J~i[~
      mid:out STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0)-- - - dp{l~l~j'~ 1~ q~/~i
      );
END medfilter;
--- - ~g~ht
ARCHITECtURE art OF medfilter IS
--__,~,)j~E~$
COMPONENT tri_compare
GENERIC ( width: integer:= 8 ) ;
PORT(clk: in STD_LOGIC;
     a, b, c: in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
     max,mid,min:out STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0)
    );
END component;
signal max1, mid1, min1: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal max2,mid2,min2: STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0) ;
signal max3,mid3,min3: STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0) ;
signal max_min: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal mid_mid: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal min_max: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
BEGIN
--- - ~-~ ~L~~ t~ ~_~'i'/~
ul : tri_compare port map(clk,m11 ,m12,m13,max1 ,mid1 ,min1) ;
u2: tri_compare port map(clk,m21 ,m22,m23,max2,mid2,min2) ;
u3: tri_compare port map(clk,m31 ,m32,m33,max3,mid3,min3) ;
u4: tri_compare port map(clk,max1,max2,max3,min=>max_min);
u5: tri_compare port map(clk,mid1,mid2,mid3,mid=>mid_mid);
u6: tri_compare port map(clk, min1, min2, min3, max =>min_max) ;
--- - ~ 1~~ 4~ ~t~ t~ .~- ~ ~p~
u7: tri_compare port map(clk,max_min,mid_mid,min_max,mid) ;
end art;

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY tri_compare is   --             - - )~__~.~ tri_compare
GENERIC(width: integer:= 8) ;
PORT(clk : in STD_LOGIC;
      a,b,c: in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;-- - - ~/k.)~J~/l"~l~
      max, mid, min: out STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0)-- - - -~ ~ ~M~f~ ~ -~.'~'~
     );
END tri_compare;
ARCHITECTURE art OF tri_compare IS
BEGIN
PROCESS(clk)
BEGIN
if (clk'event and clk= '1') then
--~~
--~~~E~A~
if(a>=b and a>=c and b>=c) then
max<=a;
mid<=b;
min<=c;
    elsif (a>= b and a>= c and c>= b) then
    max<=a;
    mid<= c;
min<=b;
   elsif (b>=a and b>=c and a>=c) then
max<=b;
mid<=a;
min<= c;
   elsif (b>= a and b>= c and c>= a) then
max<=b;
mid<=c;
min<=a;
   elsif (c>= a and c>= b and a>= b) then
   max<= c;
   mid<=a;
   min<=b;
      elsif(c>=a and c>=b and b>=a) then
      max<= C;
      mid<= b;
      min<= a;
      end if;
     end if;
  end process;
end art;

