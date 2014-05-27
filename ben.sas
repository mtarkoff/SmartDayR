Filename TMO "C:\Users\mtarkoff\Documents\Misc\Chi\TMO.xls";

data ben;
 input id Bro $15.  ;
 datalines;
1 Evan
2 Chris
3 Max
4 Joe
5 Matt
6 Ben
7 Tom
;run;

%macro BEN;
	%do i=1 %to 7;
		data ben&i;
		  set ben;

		  if id in (1 2 3 4 5 6) then do;
           random=ranuni(0)*100;
		  end;
		  else if id then random=.;
		run;

		proc sort data=ben&i; 
		  by random; 
		run;

		data ben&i;
		  set ben&i;
                 if _n_ = 1 then t=.;
			if _n_ in (2 3 4) then t=1;
            if _n_ in (5 6 7) then t=2;
			
			groom=.;
			 if _n_ = 1 then do; groom=(ranuni(0)*100); 
			 end;
			 if random = . and t = . then do;
			  if groom <50 then t=1; else t=2;
			 end;
			 if t=1 then team='Nichtas';
			 if t=2 then team='Coach C';

			 drop id;
			 
		run;

	%end;

%mend;

%ben;
data GAMED;
 input games $15.  ;
 datalines;
Case Race
Civil War
Flip
Baseball
Quarters
Horse Race
Relay
;
data gamed2;
 set gamed;
  random=ranuni(0);
  run;

proc sort data=gamed2; by random; run;

data gamed3;
 set gamed2;
    game+1;
	drop random;
run;

 proc export data=gamed3
 				dbms=excel replace
				outfile=TMO;
				SHEET=KEY;
run;

%macro exportd;
%do i=1 %to 7;
proc export data=ben&i
			dbms=excel replace
			outfile=TMO;
			sheet=GAME&i;
run;
 %end;
 %mend;

 %exportd;


