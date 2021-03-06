module dropper_thirty_one(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop31X, drop31Y,
						 output [1599:0] arrow31,
						 output logic score31);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=160;  // Center position on the X axis
    parameter [9:0] Y_start=100;  // Center position on the Y axis
    parameter [9:0] Y_Max=400;     // Bottommost point on the Y axis
	 logic finish_on;
	 enum logic [3:0] {Halted, Normal, End} State, Next_state;
	 
	 always_ff @ (posedge frame_clk )
    begin
		if(Reset)
		begin
			State <= Halted;
		end	
		else if(State == Halted)
		begin
			counter = 0;
			score31 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2180)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score31 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score31 = 1'b1;
						else
						begin
							arrow_Y_Pos = (arrow_Y_Pos + arrow_Y_Motion); 
							counter = counter + 1;
						end
					end
				State <= Next_state;
			end
		else
			State <= Next_state;
    end
	 
	 always_comb
	 begin
		Next_state = State;
		finish_on = 1'b0;
		arrow_X_Pos = X_start;
		unique case(State)
			Halted:
			begin
				finish_on = 1'b0;
				if(keycode == 8'h2c)
					Next_state = Normal;
			end
			Normal:
				begin
				if(counter < 2180)
				begin
					Next_state = Normal;
					end
				else
					begin
						if ( (arrow_Y_Pos + 40) >= Y_Max )  
							begin
									finish_on = 1'b1; 
									Next_state = End;
							end
						 else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							begin
									finish_on = 1'b1;
									Next_state = End;
							end
						 else
							begin
								  Next_state = Normal;
							end
					end
				end
			End:
				begin
				finish_on = 1;
				if(keycode == 8'h01)
					Next_state = Halted;
				end
		endcase
					
	 end
    assign drop31X = arrow_X_Pos;
   
    assign drop31Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow31 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow31[420] <= 1'b1;
arrow31[421] <= 1'b1;
arrow31[460] <= 1'b1;
arrow31[461] <= 1'b1;
arrow31[500] <= 1'b1;
arrow31[501] <= 1'b1;
arrow31[502] <= 1'b1;
arrow31[503] <= 1'b1;
arrow31[540] <= 1'b1;
arrow31[541] <= 1'b1;
arrow31[542] <= 1'b1;
arrow31[543] <= 1'b1;
arrow31[580] <= 1'b1;
arrow31[581] <= 1'b1;
arrow31[582] <= 1'b1;
arrow31[583] <= 1'b1;
arrow31[584] <= 1'b1;
arrow31[585] <= 1'b1;
arrow31[620] <= 1'b1;
arrow31[621] <= 1'b1;
arrow31[622] <= 1'b1;
arrow31[623] <= 1'b1;
arrow31[624] <= 1'b1;
arrow31[625] <= 1'b1;
arrow31[648] <= 1'b1;
arrow31[649] <= 1'b1;
arrow31[650] <= 1'b1;
arrow31[651] <= 1'b1;
arrow31[652] <= 1'b1;
arrow31[653] <= 1'b1;
arrow31[654] <= 1'b1;
arrow31[655] <= 1'b1;
arrow31[656] <= 1'b1;
arrow31[657] <= 1'b1;
arrow31[658] <= 1'b1;
arrow31[659] <= 1'b1;
arrow31[660] <= 1'b1;
arrow31[661] <= 1'b1;
arrow31[662] <= 1'b1;
arrow31[663] <= 1'b1;
arrow31[664] <= 1'b1;
arrow31[665] <= 1'b1;
arrow31[666] <= 1'b1;
arrow31[667] <= 1'b1;
arrow31[688] <= 1'b1;
arrow31[689] <= 1'b1;
arrow31[690] <= 1'b1;
arrow31[691] <= 1'b1;
arrow31[692] <= 1'b1;
arrow31[693] <= 1'b1;
arrow31[694] <= 1'b1;
arrow31[695] <= 1'b1;
arrow31[696] <= 1'b1;
arrow31[697] <= 1'b1;
arrow31[698] <= 1'b1;
arrow31[699] <= 1'b1;
arrow31[700] <= 1'b1;
arrow31[701] <= 1'b1;
arrow31[702] <= 1'b1;
arrow31[703] <= 1'b1;
arrow31[704] <= 1'b1;
arrow31[705] <= 1'b1;
arrow31[706] <= 1'b1;
arrow31[707] <= 1'b1;
arrow31[728] <= 1'b1;
arrow31[729] <= 1'b1;
arrow31[730] <= 1'b1;
arrow31[731] <= 1'b1;
arrow31[732] <= 1'b1;
arrow31[733] <= 1'b1;
arrow31[734] <= 1'b1;
arrow31[735] <= 1'b1;
arrow31[736] <= 1'b1;
arrow31[737] <= 1'b1;
arrow31[738] <= 1'b1;
arrow31[739] <= 1'b1;
arrow31[740] <= 1'b1;
arrow31[741] <= 1'b1;
arrow31[742] <= 1'b1;
arrow31[743] <= 1'b1;
arrow31[744] <= 1'b1;
arrow31[745] <= 1'b1;
arrow31[746] <= 1'b1;
arrow31[747] <= 1'b1;
arrow31[748] <= 1'b1;
arrow31[749] <= 1'b1;
arrow31[768] <= 1'b1;
arrow31[769] <= 1'b1;
arrow31[770] <= 1'b1;
arrow31[771] <= 1'b1;
arrow31[772] <= 1'b1;
arrow31[773] <= 1'b1;
arrow31[774] <= 1'b1;
arrow31[775] <= 1'b1;
arrow31[776] <= 1'b1;
arrow31[777] <= 1'b1;
arrow31[778] <= 1'b1;
arrow31[779] <= 1'b1;
arrow31[780] <= 1'b1;
arrow31[781] <= 1'b1;
arrow31[782] <= 1'b1;
arrow31[783] <= 1'b1;
arrow31[784] <= 1'b1;
arrow31[785] <= 1'b1;
arrow31[786] <= 1'b1;
arrow31[787] <= 1'b1;
arrow31[788] <= 1'b1;
arrow31[789] <= 1'b1;
arrow31[808] <= 1'b1;
arrow31[809] <= 1'b1;
arrow31[810] <= 1'b1;
arrow31[811] <= 1'b1;
arrow31[812] <= 1'b1;
arrow31[813] <= 1'b1;
arrow31[814] <= 1'b1;
arrow31[815] <= 1'b1;
arrow31[816] <= 1'b1;
arrow31[817] <= 1'b1;
arrow31[818] <= 1'b1;
arrow31[819] <= 1'b1;
arrow31[820] <= 1'b1;
arrow31[821] <= 1'b1;
arrow31[822] <= 1'b1;
arrow31[823] <= 1'b1;
arrow31[824] <= 1'b1;
arrow31[825] <= 1'b1;
arrow31[826] <= 1'b1;
arrow31[827] <= 1'b1;
arrow31[848] <= 1'b1;
arrow31[849] <= 1'b1;
arrow31[850] <= 1'b1;
arrow31[851] <= 1'b1;
arrow31[852] <= 1'b1;
arrow31[853] <= 1'b1;
arrow31[854] <= 1'b1;
arrow31[855] <= 1'b1;
arrow31[856] <= 1'b1;
arrow31[857] <= 1'b1;
arrow31[858] <= 1'b1;
arrow31[859] <= 1'b1;
arrow31[860] <= 1'b1;
arrow31[861] <= 1'b1;
arrow31[862] <= 1'b1;
arrow31[863] <= 1'b1;
arrow31[864] <= 1'b1;
arrow31[865] <= 1'b1;
arrow31[866] <= 1'b1;
arrow31[867] <= 1'b1;
arrow31[900] <= 1'b1;
arrow31[901] <= 1'b1;
arrow31[902] <= 1'b1;
arrow31[903] <= 1'b1;
arrow31[904] <= 1'b1;
arrow31[905] <= 1'b1;
arrow31[940] <= 1'b1;
arrow31[941] <= 1'b1;
arrow31[942] <= 1'b1;
arrow31[943] <= 1'b1;
arrow31[944] <= 1'b1;
arrow31[945] <= 1'b1;
arrow31[980] <= 1'b1;
arrow31[981] <= 1'b1;
arrow31[982] <= 1'b1;
arrow31[983] <= 1'b1;
arrow31[1020] <= 1'b1;
arrow31[1021] <= 1'b1;
arrow31[1022] <= 1'b1;
arrow31[1023] <= 1'b1;
arrow31[1060] <= 1'b1;
arrow31[1061] <= 1'b1;
arrow31[1100] <= 1'b1;
arrow31[1101] <= 1'b1;


	 end
   else
		 arrow31 <= 1'b0;
end
endmodule