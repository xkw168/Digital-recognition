LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.all;--����U����
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
--����ʵ��
ENtitY averagefilter IS
GENERIC(width: integer:= 8);-- - - ~ i~.~l~}] ,~,.~J~l~jJ~ ,-~q'l)2}y/l~ ~/ll~i~
PORT(
     clk:in STD_LOGIC;
     m11,m12,m13:in STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0);-- - - I~t~ Isl~--,~l~
     m21, m22, m23 : in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;-- - - ~J~ 13 ~Z.~I~J~
     m31 ,m32,m33:in STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0);-- - - I~J~ 13 ~ -~.~l~J~i[~
      mid:out STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0)-- - - dp{l~l~j'~ 1~ q~/~i
      );
END averagefilter;
--- - ~g~ht
ARCHITECtURE art OF averagefilter IS
signal tmp: STD_LOGIC_VECTOR(WIDTH + 2 DOWNTO 0) ;
signal max1, mid1, min1: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal max2,mid2,min2: STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0) ;
signal max3,mid3,min3: STD_LOGIC_VECTOR(WIDTH- 1 DOWNTO 0) ;
signal max_min: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal mid_mid: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
signal min_max: STD_LOGIC_VECTOR(WIDTH - 1 DOWNTO 0) ;
BEGIN
--tmp <= (m11+m12+m13 +m21+m22+m23+m31 +m32);
--tmp <= ("00"&m11+"00"&m12) +("00"&m13 +"000"&m21)+ ("000"&m22+ "000"&m23) + ("000"&m31 +"000"&m32);

tmp <=conv_std_logic_vector(( conv_integer(m11)+conv_integer(m12) +conv_integer(m13) +conv_integer(m21)+ conv_integer(m22)+ conv_integer(m23) +conv_integer(m31) +conv_integer(m32) ) ,11);
mid <= tmp(WIDTH + 2 DOWNTO 3);
end art;

