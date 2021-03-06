module dropper_twenty_nine29(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop29X, drop29Y,
						 output [1599:0] arrow29,
						 output logic score29);
	logic [9:0] arrow_X_Pos, arrow_Y_Pos, arrow_Y_Motion;
	logic [11:0] counter;
    parameter [9:0] X_start=500;  // Center position on the X axis
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
			score29 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <2060)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score29 = 1'b0;	
						else if ((keycode == 8'h4f|| keycode_second == 8'h4f) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score29 = 1'b1;
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
				if(counter < 2060)
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
						 else if ((keycode == 8'h4f|| keycode_second == 8'h4f) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
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
    assign drop29X = arrow_X_Pos;
   
    assign drop29Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow29 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow29[420] <= 1'b1;
arrow29[421] <= 1'b1;
arrow29[460] <= 1'b1;
arrow29[461] <= 1'b1;
arrow29[500] <= 1'b1;
arrow29[501] <= 1'b1;
arrow29[502] <= 1'b1;
arrow29[503] <= 1'b1;
arrow29[540] <= 1'b1;
arrow29[541] <= 1'b1;
arrow29[542] <= 1'b1;
arrow29[543] <= 1'b1;
arrow29[580] <= 1'b1;
arrow29[581] <= 1'b1;
arrow29[582] <= 1'b1;
arrow29[583] <= 1'b1;
arrow29[584] <= 1'b1;
arrow29[585] <= 1'b1;
arrow29[620] <= 1'b1;
arrow29[621] <= 1'b1;
arrow29[622] <= 1'b1;
arrow29[623] <= 1'b1;
arrow29[624] <= 1'b1;
arrow29[625] <= 1'b1;
arrow29[648] <= 1'b1;
arrow29[649] <= 1'b1;
arrow29[650] <= 1'b1;
arrow29[651] <= 1'b1;
arrow29[652] <= 1'b1;
arrow29[653] <= 1'b1;
arrow29[654] <= 1'b1;
arrow29[655] <= 1'b1;
arrow29[656] <= 1'b1;
arrow29[657] <= 1'b1;
arrow29[658] <= 1'b1;
arrow29[659] <= 1'b1;
arrow29[660] <= 1'b1;
arrow29[661] <= 1'b1;
arrow29[662] <= 1'b1;
arrow29[663] <= 1'b1;
arrow29[664] <= 1'b1;
arrow29[665] <= 1'b1;
arrow29[666] <= 1'b1;
arrow29[667] <= 1'b1;
arrow29[688] <= 1'b1;
arrow29[689] <= 1'b1;
arrow29[690] <= 1'b1;
arrow29[691] <= 1'b1;
arrow29[692] <= 1'b1;
arrow29[693] <= 1'b1;
arrow29[694] <= 1'b1;
arrow29[695] <= 1'b1;
arrow29[696] <= 1'b1;
arrow29[697] <= 1'b1;
arrow29[698] <= 1'b1;
arrow29[699] <= 1'b1;
arrow29[700] <= 1'b1;
arrow29[701] <= 1'b1;
arrow29[702] <= 1'b1;
arrow29[703] <= 1'b1;
arrow29[704] <= 1'b1;
arrow29[705] <= 1'b1;
arrow29[706] <= 1'b1;
arrow29[707] <= 1'b1;
arrow29[728] <= 1'b1;
arrow29[729] <= 1'b1;
arrow29[730] <= 1'b1;
arrow29[731] <= 1'b1;
arrow29[732] <= 1'b1;
arrow29[733] <= 1'b1;
arrow29[734] <= 1'b1;
arrow29[735] <= 1'b1;
arrow29[736] <= 1'b1;
arrow29[737] <= 1'b1;
arrow29[738] <= 1'b1;
arrow29[739] <= 1'b1;
arrow29[740] <= 1'b1;
arrow29[741] <= 1'b1;
arrow29[742] <= 1'b1;
arrow29[743] <= 1'b1;
arrow29[744] <= 1'b1;
arrow29[745] <= 1'b1;
arrow29[746] <= 1'b1;
arrow29[747] <= 1'b1;
arrow29[748] <= 1'b1;
arrow29[749] <= 1'b1;
arrow29[768] <= 1'b1;
arrow29[769] <= 1'b1;
arrow29[770] <= 1'b1;
arrow29[771] <= 1'b1;
arrow29[772] <= 1'b1;
arrow29[773] <= 1'b1;
arrow29[774] <= 1'b1;
arrow29[775] <= 1'b1;
arrow29[776] <= 1'b1;
arrow29[777] <= 1'b1;
arrow29[778] <= 1'b1;
arrow29[779] <= 1'b1;
arrow29[780] <= 1'b1;
arrow29[781] <= 1'b1;
arrow29[782] <= 1'b1;
arrow29[783] <= 1'b1;
arrow29[784] <= 1'b1;
arrow29[785] <= 1'b1;
arrow29[786] <= 1'b1;
arrow29[787] <= 1'b1;
arrow29[788] <= 1'b1;
arrow29[789] <= 1'b1;
arrow29[808] <= 1'b1;
arrow29[809] <= 1'b1;
arrow29[810] <= 1'b1;
arrow29[811] <= 1'b1;
arrow29[812] <= 1'b1;
arrow29[813] <= 1'b1;
arrow29[814] <= 1'b1;
arrow29[815] <= 1'b1;
arrow29[816] <= 1'b1;
arrow29[817] <= 1'b1;
arrow29[818] <= 1'b1;
arrow29[819] <= 1'b1;
arrow29[820] <= 1'b1;
arrow29[821] <= 1'b1;
arrow29[822] <= 1'b1;
arrow29[823] <= 1'b1;
arrow29[824] <= 1'b1;
arrow29[825] <= 1'b1;
arrow29[826] <= 1'b1;
arrow29[827] <= 1'b1;
arrow29[848] <= 1'b1;
arrow29[849] <= 1'b1;
arrow29[850] <= 1'b1;
arrow29[851] <= 1'b1;
arrow29[852] <= 1'b1;
arrow29[853] <= 1'b1;
arrow29[854] <= 1'b1;
arrow29[855] <= 1'b1;
arrow29[856] <= 1'b1;
arrow29[857] <= 1'b1;
arrow29[858] <= 1'b1;
arrow29[859] <= 1'b1;
arrow29[860] <= 1'b1;
arrow29[861] <= 1'b1;
arrow29[862] <= 1'b1;
arrow29[863] <= 1'b1;
arrow29[864] <= 1'b1;
arrow29[865] <= 1'b1;
arrow29[866] <= 1'b1;
arrow29[867] <= 1'b1;
arrow29[900] <= 1'b1;
arrow29[901] <= 1'b1;
arrow29[902] <= 1'b1;
arrow29[903] <= 1'b1;
arrow29[904] <= 1'b1;
arrow29[905] <= 1'b1;
arrow29[940] <= 1'b1;
arrow29[941] <= 1'b1;
arrow29[942] <= 1'b1;
arrow29[943] <= 1'b1;
arrow29[944] <= 1'b1;
arrow29[945] <= 1'b1;
arrow29[980] <= 1'b1;
arrow29[981] <= 1'b1;
arrow29[982] <= 1'b1;
arrow29[983] <= 1'b1;
arrow29[1020] <= 1'b1;
arrow29[1021] <= 1'b1;
arrow29[1022] <= 1'b1;
arrow29[1023] <= 1'b1;
arrow29[1060] <= 1'b1;
arrow29[1061] <= 1'b1;
arrow29[1100] <= 1'b1;
arrow29[1101] <= 1'b1;


	 end
   else
		 arrow29 <= 1'b0;
end
endmodule