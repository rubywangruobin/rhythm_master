module dropper_six(input Reset, frame_clk, 
						 input logic [7:0] keycode,keycode_second,
						 output [9:0] drop6X, drop6Y,
						 output [1599:0] arrow6,
						 output logic score6);
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
			score6 = 0;
			arrow_Y_Motion = 0; 
			arrow_Y_Pos = Y_start;
			State <= Next_state;
		end
		else if(State == Normal)
			begin
				if(counter <400)
					counter = counter + 1;
				else
					begin
						arrow_Y_Motion = 1;
						if ((arrow_Y_Pos + 40) >= Y_Max)
							score6 = 1'b0;	
						else if ((keycode == 8'h07|| keycode_second == 8'h07) & (arrow_Y_Pos + 40 >= 340) & (arrow_Y_Pos + 40 < 400))
							score6 = 1'b1;
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
				if(counter < 400)
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
    assign drop6X = arrow_X_Pos;
   
    assign drop6Y = arrow_Y_Pos;
	 always_comb
	 begin
	 arrow6 <= 1'b0;
	 if(finish_on == 0)
	 begin
	 arrow6[420] <= 1'b1;
arrow6[421] <= 1'b1;
arrow6[460] <= 1'b1;
arrow6[461] <= 1'b1;
arrow6[500] <= 1'b1;
arrow6[501] <= 1'b1;
arrow6[502] <= 1'b1;
arrow6[503] <= 1'b1;
arrow6[540] <= 1'b1;
arrow6[541] <= 1'b1;
arrow6[542] <= 1'b1;
arrow6[543] <= 1'b1;
arrow6[580] <= 1'b1;
arrow6[581] <= 1'b1;
arrow6[582] <= 1'b1;
arrow6[583] <= 1'b1;
arrow6[584] <= 1'b1;
arrow6[585] <= 1'b1;
arrow6[620] <= 1'b1;
arrow6[621] <= 1'b1;
arrow6[622] <= 1'b1;
arrow6[623] <= 1'b1;
arrow6[624] <= 1'b1;
arrow6[625] <= 1'b1;
arrow6[648] <= 1'b1;
arrow6[649] <= 1'b1;
arrow6[650] <= 1'b1;
arrow6[651] <= 1'b1;
arrow6[652] <= 1'b1;
arrow6[653] <= 1'b1;
arrow6[654] <= 1'b1;
arrow6[655] <= 1'b1;
arrow6[656] <= 1'b1;
arrow6[657] <= 1'b1;
arrow6[658] <= 1'b1;
arrow6[659] <= 1'b1;
arrow6[660] <= 1'b1;
arrow6[661] <= 1'b1;
arrow6[662] <= 1'b1;
arrow6[663] <= 1'b1;
arrow6[664] <= 1'b1;
arrow6[665] <= 1'b1;
arrow6[666] <= 1'b1;
arrow6[667] <= 1'b1;
arrow6[688] <= 1'b1;
arrow6[689] <= 1'b1;
arrow6[690] <= 1'b1;
arrow6[691] <= 1'b1;
arrow6[692] <= 1'b1;
arrow6[693] <= 1'b1;
arrow6[694] <= 1'b1;
arrow6[695] <= 1'b1;
arrow6[696] <= 1'b1;
arrow6[697] <= 1'b1;
arrow6[698] <= 1'b1;
arrow6[699] <= 1'b1;
arrow6[700] <= 1'b1;
arrow6[701] <= 1'b1;
arrow6[702] <= 1'b1;
arrow6[703] <= 1'b1;
arrow6[704] <= 1'b1;
arrow6[705] <= 1'b1;
arrow6[706] <= 1'b1;
arrow6[707] <= 1'b1;
arrow6[728] <= 1'b1;
arrow6[729] <= 1'b1;
arrow6[730] <= 1'b1;
arrow6[731] <= 1'b1;
arrow6[732] <= 1'b1;
arrow6[733] <= 1'b1;
arrow6[734] <= 1'b1;
arrow6[735] <= 1'b1;
arrow6[736] <= 1'b1;
arrow6[737] <= 1'b1;
arrow6[738] <= 1'b1;
arrow6[739] <= 1'b1;
arrow6[740] <= 1'b1;
arrow6[741] <= 1'b1;
arrow6[742] <= 1'b1;
arrow6[743] <= 1'b1;
arrow6[744] <= 1'b1;
arrow6[745] <= 1'b1;
arrow6[746] <= 1'b1;
arrow6[747] <= 1'b1;
arrow6[748] <= 1'b1;
arrow6[749] <= 1'b1;
arrow6[768] <= 1'b1;
arrow6[769] <= 1'b1;
arrow6[770] <= 1'b1;
arrow6[771] <= 1'b1;
arrow6[772] <= 1'b1;
arrow6[773] <= 1'b1;
arrow6[774] <= 1'b1;
arrow6[775] <= 1'b1;
arrow6[776] <= 1'b1;
arrow6[777] <= 1'b1;
arrow6[778] <= 1'b1;
arrow6[779] <= 1'b1;
arrow6[780] <= 1'b1;
arrow6[781] <= 1'b1;
arrow6[782] <= 1'b1;
arrow6[783] <= 1'b1;
arrow6[784] <= 1'b1;
arrow6[785] <= 1'b1;
arrow6[786] <= 1'b1;
arrow6[787] <= 1'b1;
arrow6[788] <= 1'b1;
arrow6[789] <= 1'b1;
arrow6[808] <= 1'b1;
arrow6[809] <= 1'b1;
arrow6[810] <= 1'b1;
arrow6[811] <= 1'b1;
arrow6[812] <= 1'b1;
arrow6[813] <= 1'b1;
arrow6[814] <= 1'b1;
arrow6[815] <= 1'b1;
arrow6[816] <= 1'b1;
arrow6[817] <= 1'b1;
arrow6[818] <= 1'b1;
arrow6[819] <= 1'b1;
arrow6[820] <= 1'b1;
arrow6[821] <= 1'b1;
arrow6[822] <= 1'b1;
arrow6[823] <= 1'b1;
arrow6[824] <= 1'b1;
arrow6[825] <= 1'b1;
arrow6[826] <= 1'b1;
arrow6[827] <= 1'b1;
arrow6[848] <= 1'b1;
arrow6[849] <= 1'b1;
arrow6[850] <= 1'b1;
arrow6[851] <= 1'b1;
arrow6[852] <= 1'b1;
arrow6[853] <= 1'b1;
arrow6[854] <= 1'b1;
arrow6[855] <= 1'b1;
arrow6[856] <= 1'b1;
arrow6[857] <= 1'b1;
arrow6[858] <= 1'b1;
arrow6[859] <= 1'b1;
arrow6[860] <= 1'b1;
arrow6[861] <= 1'b1;
arrow6[862] <= 1'b1;
arrow6[863] <= 1'b1;
arrow6[864] <= 1'b1;
arrow6[865] <= 1'b1;
arrow6[866] <= 1'b1;
arrow6[867] <= 1'b1;
arrow6[900] <= 1'b1;
arrow6[901] <= 1'b1;
arrow6[902] <= 1'b1;
arrow6[903] <= 1'b1;
arrow6[904] <= 1'b1;
arrow6[905] <= 1'b1;
arrow6[940] <= 1'b1;
arrow6[941] <= 1'b1;
arrow6[942] <= 1'b1;
arrow6[943] <= 1'b1;
arrow6[944] <= 1'b1;
arrow6[945] <= 1'b1;
arrow6[980] <= 1'b1;
arrow6[981] <= 1'b1;
arrow6[982] <= 1'b1;
arrow6[983] <= 1'b1;
arrow6[1020] <= 1'b1;
arrow6[1021] <= 1'b1;
arrow6[1022] <= 1'b1;
arrow6[1023] <= 1'b1;
arrow6[1060] <= 1'b1;
arrow6[1061] <= 1'b1;
arrow6[1100] <= 1'b1;
arrow6[1101] <= 1'b1;


	 end
   else
		 arrow6 <= 1'b0;
end
endmodule