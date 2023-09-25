 /********************************************************
 * Title    : Tang-Nano Party Parrot
 * Date     : 2020/05/17
 * Design   : kingyo
 ********************************************************/
// MIT License
//
// Copyright (c) 2020 kingyo
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

module top (
    // CLK
    // input   wire            mco,    // 24MHz - unnecessary for MiSTer
    input   wire            clk36m,  // system clock
    input   wire            clk9m,   // pixel clock
    input   wire            i_res_n, // active low reset

    // Button
    input   wire            btn_a,
    input   wire            btn_b,

    // LCD
    output  wire            lcd_clk,
    output  wire            lcd_hsync,
    output  wire            lcd_vsync,
    output  wire            lcd_de,
    output  wire    [15:0]  lcd_data
    );

    /**************************************************************
     *  Wires - Unnecessary now that we added clk input ports above
     *************************************************************/
    // wire            clk36m;
    // wire            clk9m;

    /**************************************************************
     *  PLL - Unnecessary for MiSTer
     *************************************************************/
    // Gowin_PLL Gowin_PLL_isnt (
    //     .clkin ( mco ),         // input clkin
    //     .clkout ( clk36m ),     // output clkout
    //     .clkoutd ( clk9m )      // output clkoutd
    // );

    /**************************************************************
     *  LCD Controller
     *************************************************************/
    LCD_Controller LCD_Controller_inst (
        .i_clk ( clk9m ),
        .i_clk_fast ( clk36m ),
        .i_res_n ( i_res_n ),
        .i_btn_a ( btn_a ),
        .i_btn_b ( btn_b ),
        .o_clk ( lcd_clk ),
        .o_hsync ( lcd_hsync ),
        .o_vsync ( lcd_vsync ),
        .o_de ( lcd_de ),
        .o_lcd_data ( lcd_data[15:0] )
    );

endmodule
