module pannel (
	input  PLD_MCLK,
	// EPL interface
	input  EPL_RESETN,	
	output EPL_RSTOUT,	
	input  EPL_SCLK,	
	inout  EPL_SDI,	
	inout  EPL_SDO,		
	inout  EPL_SLE,		
	inout  EPL_SRDY,	
	// LCD controller
	output LCD_ENBL,
	output LCD_BL_PWM,
	output LCD_BL_EN,
	input  TS_NINTRQ,
	output TS_SPI_SDO,
	input  TS_BUSY,
	input  TS_SPI_SDI,
	input  TS_SPI_CSN,
	input  TS_SPI_SCLK,
	// KEY
	inout  BUT_UP,
	inout  BUT_DN,
	inout  BUT_LFT,
	inout  BUT_RHT,
	inout  BUT_ENT,
	inout  BUT_ESC,
	inout  [5:0] BUT_ST,
	//Encoder
	input  BUT_REX1,
	input  BUT_REX2,
	input  BUT_DN_RIN1,
	input  BUT_DN_RIN2,
	inout  BUT_DN_RINk,
	output LED_G3,
	output LED_B3,
	output LED_R3,
	output LED_G2,
	output LED_B2,
	output LED_R2,
	output LED_G1,
	output LED_B1,
	output LED_R1,
	output LED_G0,
	output LED_B0,
	output LED_R0
);
   assign LCD_BL_EN = 1'b1;
	assign LCD_BL_PWM = 1'b0;
	assign LCD_ENBL = 1'b1;

	qsys u0 (
        .qsys_serial_host_0_sdo   (EPL_SDO),      // qsys_serial_host_0.sdo
        .qsys_serial_host_0_sdi   (EPL_SDI),     //                   .sdi
        .qsys_serial_host_0_clk   (EPL_SCLK),    //                   .clk
        .qsys_serial_host_0_sle   (EPL_SLE),     //                   .sle
        .qsys_serial_host_0_srdy  (EPL_SRDY),    //                   .srdy
        .qsys_serial_host_0_reset (!EPL_RESETN), //                   .reset
		  
		  //.fan_motor_driver_0_export (LCD_BL_PWM), // fan_motor_driver_0.export
        		  
        .position_encoder_0_A     (BUT_DN_RIN1),     // position_encoder_0.A
        .position_encoder_0_B     (BUT_DN_RIN2),     //                   .B
        .position_encoder_0_Z     (1'b1),            //                   .Z
        .position_encoder_1_A     (BUT_REX1),        // position_encoder_1.A
        .position_encoder_1_B     (BUT_REX2),        //                   .B
        .position_encoder_1_Z     (1'b1),            //                   .Z

        .pio32_0_P0                (BUT_UP),         //                   .P0		  
		  .pio32_0_P1                (BUT_DN),         //            pio32_0.P1
        .pio32_0_P2                (BUT_LFT),        //                   .P2
        .pio32_0_P3                (BUT_RHT),        //                   .P3
        .pio32_0_P4                (BUT_ENT),        //                   .P4
        .pio32_0_P5                (BUT_ESC),        //                   .P5
        .pio32_0_P6                (BUT_ST[0]),      //                   .P6
        .pio32_0_P7                (BUT_ST[1]),      //                   .P7
        .pio32_0_P8                (BUT_ST[2]),      //                   .P8
        .pio32_0_P9                (BUT_ST[3]),      //                   .P9
        .pio32_0_P10               (BUT_ST[4]),      //                   .P10
        .pio32_0_P11               (BUT_ST[5]),      //                   .P11
        .pio32_0_P12               (BUT_DN_RINk),    //                   .P12
        .pio32_0_P13               (),      		     //                   .P13
        .pio32_0_P14               (),               //                   .P14
        .pio32_0_P15               (),               //                   .P15
        .pio32_0_P16               (),               //                   .P16
        .pio32_0_P17               (),               //                   .P17
        .pio32_0_P18               (),               //                   .P18
        .pio32_0_P19               (),               //                   .P19
        .pio32_0_P20               (),               //                   .P20
        .pio32_0_P21               (),               //                   .P21
        .pio32_0_P22               (),               //                   .P22
        .pio32_0_P23               (),               //                   .P23
        .pio32_0_P24               (),               //                   .P24
        .pio32_0_P25               (),               //                   .P25
        .pio32_0_P26               (),               //                   .P26
        .pio32_0_P27               (),               //                   .P27
        .pio32_0_P28               (),               //                   .P28
        .pio32_0_P29               (),               //                   .P29
        //.pio32_0_P30               (LCD_BL_EN),      //                   .P30
        //.pio32_0_P31               (LCD_ENBL),       //                   .P31

        .basic_funcled_0_R         (LED_R0),         //    basic_funcled_0.R
        .basic_funcled_0_G         (LED_G0),         //                   .G
        .basic_funcled_0_B         (LED_B0),         //                   .B
		  .basic_funcled_1_R         (LED_R1),         //    basic_funcled_1.R
        .basic_funcled_1_G         (LED_G1),         //                   .G
        .basic_funcled_1_B         (LED_B1),         //                   .B
        .basic_funcled_2_R         (LED_R2),         //    basic_funcled_2.R
        .basic_funcled_2_G         (LED_G2),         //                   .G
        .basic_funcled_2_B         (LED_B2),         //                   .B
        .basic_funcled_3_R         (LED_R3),         //    basic_funcled_3.R
        .basic_funcled_3_G         (LED_G3),         //                   .G
        .basic_funcled_3_B         (LED_B3)          //    
		  
    );

	
endmodule