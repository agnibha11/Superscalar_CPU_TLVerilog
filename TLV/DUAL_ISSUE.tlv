\TLV_version 1d --inlineGen --bestsv --noline: tl-x.org
\SV
   /*
   Copyright 2026 Redwood EDA, LLC
   Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
   The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
   */
\SV
   // Include WARP-V.
   // Included URL: "https://raw.githubusercontent.com/stevehoover/warp-v/92b113bd2f10191b1de69d51a8719ef1710aeb37/warp-v.tlv"// Included URL: "https://raw.githubusercontent.com/TL-X-org/tlv_lib/3543cfd9d7ef9ae3b1e5750614583959a672084d/fundamentals_lib.tlv"
   /* verilator lint_off WIDTH */
   /* verilator lint_off PINMISSING */
   /* verilator lint_off SELRANGE */
\SV
   module top(input wire clk, input wire reset, input wire [31:0] cyc_cnt, output wire passed, output wire failed);    /* verilator lint_save */ /* verilator lint_off UNOPTFLAT */  bit [256:0] RW_rand_raw; bit [256+63:0] RW_rand_vect; pseudo_rand #(.WIDTH(257)) pseudo_rand (clk, reset, RW_rand_raw[256:0]); assign RW_rand_vect[256+63:0] = {RW_rand_raw[62:0], RW_rand_raw};  /* verilator lint_restore */  /* verilator lint_off WIDTH */ /* verilator lint_off UNOPTFLAT */
\TLV
   /* verilator lint_on WIDTH */  // Let's be strict about bit widths.

   \SV_plus
      // The program in an instruction memory.
      logic [31:0] instrs [0:31];  // 32 entries: holds the 30-instruction program + NOP padding for the slot-1 fetch of PC+4.
      logic [40*8-1:0] instr_strs [0:31];
      assign instrs[0] = {12'b000000000000, 5'd0, 3'b000, 5'd5, 7'b0010011}; assign instrs[1] = {12'b000000001000, 5'd0, 3'b000, 5'd6, 7'b0010011}; assign instrs[2] = {12'b000000100000, 5'd0, 3'b000, 5'd7, 7'b0010011}; assign instrs[3] = {7'b0000000, 5'd6, 5'd5, 3'b010, 5'b00000, 7'b0100011}; assign instrs[4] = {12'b000000000100, 5'd5, 3'b000, 5'd5, 7'b0010011}; assign instrs[5] = {12'b111111111111, 5'd6, 3'b000, 5'd6, 7'b0010011}; assign instrs[6] = {1'b1, 6'b111111, 5'd7, 5'd5, 3'b100, 4'b1010, 1'b1, 7'b1100011}; assign instrs[7] = {12'b000000011100, 5'd0, 3'b000, 5'd8, 7'b0010011}; assign instrs[8] = {12'b000000000000, 5'd0, 3'b000, 5'd5, 7'b0010011}; assign instrs[9] = {12'b000000000000, 5'd5, 3'b010, 5'd6, 7'b0000011}; assign instrs[10] = {12'b000000000100, 5'd5, 3'b010, 5'd7, 7'b0000011}; assign instrs[11] = {1'b0, 6'b000000, 5'd6, 5'd7, 3'b101, 4'b0110, 1'b0, 7'b1100011}; assign instrs[12] = {7'b0000000, 5'd7, 5'd5, 3'b010, 5'b00000, 7'b0100011}; assign instrs[13] = {7'b0000000, 5'd6, 5'd5, 3'b010, 5'b00100, 7'b0100011}; assign instrs[14] = {12'b000000000100, 5'd5, 3'b000, 5'd5, 7'b0010011}; assign instrs[15] = {1'b1, 6'b111111, 5'd8, 5'd5, 3'b100, 4'b0100, 1'b1, 7'b1100011}; assign instrs[16] = {12'b111111111100, 5'd8, 3'b000, 5'd8, 7'b0010011}; assign instrs[17] = {1'b1, 6'b111110, 5'd8, 5'd0, 3'b100, 4'b1110, 1'b1, 7'b1100011}; assign instrs[18] = {12'b000000000000, 5'd0, 3'b000, 5'd5, 7'b0010011}; assign instrs[19] = {12'b000000000001, 5'd0, 3'b000, 5'd6, 7'b0010011}; assign instrs[20] = {12'b000000100000, 5'd0, 3'b000, 5'd7, 7'b0010011}; assign instrs[21] = {12'b000000000000, 5'd5, 3'b010, 5'd28, 7'b0000011}; assign instrs[22] = {1'b0, 6'b000000, 5'd6, 5'd28, 3'b001, 4'b1010, 1'b0, 7'b1100011}; assign instrs[23] = {12'b000000000100, 5'd5, 3'b000, 5'd5, 7'b0010011}; assign instrs[24] = {12'b000000000001, 5'd6, 3'b000, 5'd6, 7'b0010011}; assign instrs[25] = {1'b1, 6'b111111, 5'd7, 5'd5, 3'b100, 4'b1000, 1'b1, 7'b1100011}; assign instrs[26] = {1'b0, 6'b000000, 5'd0, 5'd0, 3'b000, 4'b0100, 1'b0, 7'b1100011}; assign instrs[27] = {7'b0000000, 5'd0, 5'd29, 3'b000, 5'd29, 7'b0110011}; assign instrs[28] = {7'b0000000, 5'd0, 5'd30, 3'b000, 5'd30, 7'b0110011}; assign instrs[29] = {7'b0000000, 5'd0, 5'd31, 3'b000, 5'd31, 7'b0110011}; assign instrs[30] = 32'h00000013; assign instrs[31] = 32'h00000013;  // Bubble sort of 8 words in data memory (init -> sort -> verify).

      // String representations of the instructions for debug, complicated by the need for "\" before "%".
      assign instr_strs[0] = "(I) ADDI t0,zero,0                      "; assign instr_strs[1] = "(I) ADDI t1,zero,8                      "; assign instr_strs[2] = "(I) ADDI t2,zero,32                     "; assign instr_strs[3] = "(S) SW t0,t1,0                          "; assign instr_strs[4] = "(I) ADDI t0,t0,4                        "; assign instr_strs[5] = "(I) ADDI t1,t1,-1                       "; assign instr_strs[6] = "(B) BLT t0,t2,init                      "; assign instr_strs[7] = "(I) ADDI s0,zero,28                     "; assign instr_strs[8] = "(I) ADDI t0,zero,0                      "; assign instr_strs[9] = "(I) LW t1,t0,0                          "; assign instr_strs[10] = "(I) LW t2,t0,4                          "; assign instr_strs[11] = "(B) BGE t2,t1,noswap                    "; assign instr_strs[12] = "(S) SW t0,t2,0                          "; assign instr_strs[13] = "(S) SW t0,t1,4                          "; assign instr_strs[14] = "(I) ADDI t0,t0,4                        "; assign instr_strs[15] = "(B) BLT t0,s0,inner                     "; assign instr_strs[16] = "(I) ADDI s0,s0,-4                       "; assign instr_strs[17] = "(B) BLT zero,s0,outer                   "; assign instr_strs[18] = "(I) ADDI t0,zero,0                      "; assign instr_strs[19] = "(I) ADDI t1,zero,1                      "; assign instr_strs[20] = "(I) ADDI t2,zero,32                     "; assign instr_strs[21] = "(I) LW t3,t0,0                          "; assign instr_strs[22] = "(B) BNE t3,t1,fail                      "; assign instr_strs[23] = "(I) ADDI t0,t0,4                        "; assign instr_strs[24] = "(I) ADDI t1,t1,1                        "; assign instr_strs[25] = "(B) BLT t0,t2,check                     "; assign instr_strs[26] = "(B) BEQ zero,zero,pass                  "; assign instr_strs[27] = "(R) ADD t4,t4,zero                      "; assign instr_strs[28] = "(R) ADD t5,t5,zero                      "; assign instr_strs[29] = "(R) ADD t6,t6,zero                      "; assign instr_strs[30] = "NOP                                     "; 
      assign instr_strs[31] = "NOP                                     ";
   |fetch
      
      
      /instr_mem[31:0]
         @5
            $instr[31:0] = *instrs[instr_mem];
            $instr_str[40*8-1:0] = *instr_strs[instr_mem];
            `BOGUS_USE($instr $instr_str)  

   // /=========\
   // | The CPU |
   |fetch
      // Provide a longer reset to cover the pipeline depth.
      @0
         $soft_reset = (1'b0) || *reset;
         $Cnt[7:0] <= $soft_reset   ? 8'b0 :       // reset
                      $Cnt == 8'hFF ? 8'hFF :      // max out to avoid wrapping
                                      $Cnt + 8'b1; // increment
         $reset = $soft_reset || $Cnt < 11;
      @1
         $fetch = ! $reset && ! /instr[0]$no_fetch;
         
         //Checkpoint 1
         
         $non_aborting_trap_cond_0 = (/instr[0]>>3$non_aborting_trap && !(1'b0 || /instr[0]>>3$no_fetch || /instr[0]>>3$second_issue || /instr[0]>>3$replay || /instr[0]>>3$aborting_trap) && $GoodPathMask[3]);
         $aborting_trap_cond_0     = (/instr[0]>>3$aborting_trap && !(1'b0 || /instr[0]>>3$no_fetch || /instr[0]>>3$second_issue || /instr[0]>>3$replay) && $GoodPathMask[3]);
         $non_pipelined_cond_0     = (/instr[0]>>3$non_pipelined && !(1'b0 || /instr[0]>>3$no_fetch || /instr[0]>>3$second_issue || /instr[0]>>3$replay) && $GoodPathMask[3]);
         $non_aborting_trap_cond_1 = (/instr[1]>>3$non_aborting_trap && !(1'b0 || /instr[1]>>3$no_fetch || /instr[1]>>3$second_issue || /instr[1]>>3$replay || /instr[1]>>3$aborting_trap) && (! >>3$slot0_redir_e3) && $GoodPathMask[3]);
         $aborting_trap_cond_1     = (/instr[1]>>3$aborting_trap && !(1'b0 || /instr[1]>>3$no_fetch || /instr[1]>>3$second_issue || /instr[1]>>3$replay) && (! >>3$slot0_redir_e3) && $GoodPathMask[3]);
         $non_pipelined_cond_1     = (/instr[1]>>3$non_pipelined && !(1'b0 || /instr[1]>>3$no_fetch || /instr[1]>>3$second_issue || /instr[1]>>3$replay) && (! >>3$slot0_redir_e3) && $GoodPathMask[3]);
         $indirect_jump_cond_0     = (/instr[0]>>2$indirect_jump && !(1'b0 || /instr[0]>>2$no_fetch || /instr[0]>>2$second_issue || /instr[0]>>2$replay) && $GoodPathMask[2]);
         $mispred_branch_cond_0    = (/instr[0]>>2$mispred_branch && !(1'b0 || /instr[0]>>2$no_fetch || /instr[0]>>2$second_issue || /instr[0]>>2$replay) && $GoodPathMask[2]);
         $jump_cond_0              = (/instr[0]>>2$jump && !(1'b0 || /instr[0]>>2$no_fetch || /instr[0]>>2$second_issue || /instr[0]>>2$replay) && $GoodPathMask[2]);
         $indirect_jump_cond_1     = (/instr[1]>>2$indirect_jump && !(1'b0 || /instr[1]>>2$no_fetch || /instr[1]>>2$second_issue || /instr[1]>>2$replay) && (! >>2$slot0_redir_e3) && $GoodPathMask[2]);
         $mispred_branch_cond_1    = (/instr[1]>>2$mispred_branch && !(1'b0 || /instr[1]>>2$no_fetch || /instr[1]>>2$second_issue || /instr[1]>>2$replay) && (! >>2$slot0_redir_e3) && $GoodPathMask[2]);
         $jump_cond_1              = (/instr[1]>>2$jump && !(1'b0 || /instr[1]>>2$no_fetch || /instr[1]>>2$second_issue || /instr[1]>>2$replay) && (! >>2$slot0_redir_e3) && $GoodPathMask[2]);
         $replay_cond_0            = (/instr[0]>>1$replay && !(1'b0 || /instr[0]>>1$no_fetch || /instr[0]>>1$second_issue) && $GoodPathMask[1]);
         $replay_cond_1            = (/instr[1]>>1$replay && !(1'b0 || /instr[1]>>1$no_fetch || /instr[1]>>1$second_issue) && (! >>1$slot0_redir_e2) && $GoodPathMask[1]);
         // Two-bit predictor: a predicted-taken branch redirects fetch to the branch
         // target at stage 2 (one stage earlier than a mispredict, which resolves at 3).
         $pred_taken_branch_cond_0 = (/instr[0]>>1$pred_taken_branch && !(1'b0 || /instr[0]>>1$no_fetch || /instr[0]>>1$second_issue || /instr[0]>>1$replay) && $GoodPathMask[1]);
         $pred_taken_branch_cond_1 = (/instr[1]>>1$pred_taken_branch && !(1'b0 || /instr[1]>>1$no_fetch || /instr[1]>>1$second_issue || /instr[1]>>1$replay) && (! >>1$slot0_redir_e2) && $GoodPathMask[1]);
         $second_issue_cond        = (/instr[0]>>0$second_issue && !(1'b0 || /instr[0]>>0$no_fetch) && $GoodPathMask[0]);
         $no_fetch_cond            = (/instr[0]>>0$no_fetch && !(1'b0) && $GoodPathMask[0]);
         
         // Good-path mask for the fetch groups in flight.
         $next_good_path_mask[3+1:0] =
            // Shift up and mask w/ redirect conditions.
            {$GoodPathMask[3:0]
              // Slot-0-triggered conditions keep original (single-issue) mask semantics:
              & ($no_fetch_cond            ? 4'b1110 : 4'b1111)
              & ($second_issue_cond        ? 4'b1110 : 4'b1111)
              & ($replay_cond_0            ? 4'b1100 : 4'b1111)
              & ($jump_cond_0              ? 4'b1100 : 4'b1111)
              & ($mispred_branch_cond_0    ? 4'b1100 : 4'b1111)
              & ($indirect_jump_cond_0     ? 4'b1100 : 4'b1111)
              & ($non_pipelined_cond_0     ? 4'b1000 : 4'b1111)
              & ($aborting_trap_cond_0     ? 4'b0000 : 4'b1111)
              & ($non_aborting_trap_cond_0 ? 4'b1000 : 4'b1111)
              & ($pred_taken_branch_cond_0 ? 4'b1110 : 4'b1111)
              // Slot-1-triggered conditions: the group survives (slot 0 must commit), so
              // aborting conditions clear one bit fewer than their slot-0 counterparts.
              & ($replay_cond_1            ? 4'b1110 : 4'b1111)
              & ($jump_cond_1              ? 4'b1100 : 4'b1111)
              & ($mispred_branch_cond_1    ? 4'b1100 : 4'b1111)
              & ($indirect_jump_cond_1     ? 4'b1100 : 4'b1111)
              & ($non_pipelined_cond_1     ? 4'b1000 : 4'b1111)
              & ($aborting_trap_cond_1     ? 4'b1000 : 4'b1111)
              & ($non_aborting_trap_cond_1 ? 4'b1000 : 4'b1111)
              // A predicted-taken branch is NON-aborting (the branch itself commits), so
              // for either slot it clears only the younger group -- same term as slot 0.
              & ($pred_taken_branch_cond_1 ? 4'b1110 : 4'b1111),
             1'b1}; // Shift in 1'b1 (fetch-valid).
         $GoodPathMask[3+1:0] <=
            <<1$reset ? 5'b0 :  // All bad-path (through self) on reset (next mask based on next reset).
            $next_good_path_mask;
         
         // Next PC. Priority: later stage first; within a stage, slot 0 before slot 1.
         {$next_pc[31:0], $next_no_fetch} =
            $reset ? {32'b0, 1'b0} :
            $non_aborting_trap_cond_0 ? {/instr[0]>>3$trap_target, 1'b0} :
            $aborting_trap_cond_0     ? {/instr[0]>>3$trap_target, 1'b0} :
            $non_pipelined_cond_0     ? {/instr[0]>>3$pc_inc, 1'b1} :
            $non_aborting_trap_cond_1 ? {/instr[1]>>3$trap_target, 1'b0} :
            $aborting_trap_cond_1     ? {/instr[1]>>3$trap_target, 1'b0} :
            $non_pipelined_cond_1     ? {/instr[1]>>3$pc_inc, 1'b1} :
            $indirect_jump_cond_0     ? {/instr[0]>>2$indirect_jump_target, 1'b0} :
            $mispred_branch_cond_0    ? {/instr[0]>>2$branch_redir_pc, 1'b0} :
            $jump_cond_0              ? {/instr[0]>>2$jump_target, 1'b0} :
            $indirect_jump_cond_1     ? {/instr[1]>>2$indirect_jump_target, 1'b0} :
            $mispred_branch_cond_1    ? {/instr[1]>>2$branch_redir_pc, 1'b0} :
            $jump_cond_1              ? {/instr[1]>>2$jump_target, 1'b0} :
            $replay_cond_0            ? {/instr[0]>>1$pc, 1'b0} :   // Refetch the group from slot 0.
            $replay_cond_1            ? {/instr[1]>>1$pc, 1'b0} :   // Refetch from slot 1's address: it becomes slot 0 of the next group.
            $pred_taken_branch_cond_0 ? {/instr[0]>>1$branch_target, 1'b0} :   // Speculatively follow slot 0's predicted-taken branch.
            $pred_taken_branch_cond_1 ? {/instr[1]>>1$branch_target, 1'b0} :   // Same for slot 1 (only if slot 0 did not redirect).
            $second_issue_cond        ? {>>0$Pc, 1'b0} :
            $no_fetch_cond            ? {>>0$Pc, 1'b1} :
                       {$Pc + 32'd8, 1'b0};   // Default: sequential fetch of the next group of two.
         // Then as state.
         $Pc[31:0] <= $next_pc;
         `BOGUS_USE($next_no_fetch)
      @2
         //Checkpoint 2
         $slot0_redir_e2 = /instr[0]$second_issue || /instr[0]$replay || /instr[0]$jump || /instr[0]$indirect_jump || /instr[0]$non_pipelined || /instr[0]$pred_taken_branch;
         
         // Bypass-source availability, shared by both consuming slots.
         $bypass_avail1_s0 = /instr[0]>>1$commit_dest_reg && ($GoodPathMask[1] || /instr[0]>>1$commit_second_issue);
         $bypass_avail1_s1 = /instr[1]>>1$commit_dest_reg && ($GoodPathMask[1] || /instr[1]>>1$commit_second_issue);
         $bypass_avail2_s0 = /instr[0]>>2$commit_dest_reg && ($GoodPathMask[2] || /instr[0]>>2$commit_second_issue);
         $bypass_avail2_s1 = /instr[1]>>2$commit_dest_reg && ($GoodPathMask[2] || /instr[1]>>2$commit_second_issue);
         $bypass_avail3_s0 = /instr[0]>>3$commit_dest_reg && ($GoodPathMask[3] || /instr[0]>>3$commit_second_issue);
         $bypass_avail3_s1 = /instr[1]>>3$commit_dest_reg && ($GoodPathMask[3] || /instr[1]>>3$commit_second_issue);
      @3
         $slot0_redir_e3 = $slot0_redir_e2 || /instr[0]$mispred_branch || /instr[0]$aborting_trap || /instr[0]$non_aborting_trap;
         
         // Test bench: pass when the test program's final BEQ ("pass" branch, at PC == 44) commits taken.
         $pass_cond = (/instr[0]$good_taken_branch && (/instr[0]$pc == 32'd104)) ||
                      (/instr[1]$good_taken_branch && (/instr[1]$pc == 32'd104));
         *passed = ! $reset && $pass_cond;
         *failed = 1'b0;
         
         // ==================================================================
         // TWO-BIT SATURATING BRANCH PREDICTOR (hoisted from /instr to |fetch).
         // One counter serves the whole core, exactly as in the single-issue
         // baseline. Both slots can commit a branch in the same cycle, so the
         // two saturating steps are applied IN SERIES -- slot 0 (older) first,
         // then slot 1 -- which reproduces the baseline's "one update per
         // committed branch, in program order" semantics. The counter is only
         // two bits wide, so chaining two steps costs almost nothing.
         //   2'b00 strongly not-taken | 2'b01 weakly not-taken
         //   2'b10 weakly taken       | 2'b11 strongly taken
         // ==================================================================
         $bp_upd_0 = /instr[0]$branch && /instr[0]$commit;   // Slot 0 retires a branch.
         $bp_upd_1 = /instr[1]$branch && /instr[1]$commit;   // Slot 1 retires a branch.
         $branch_or_reset = $bp_upd_0 || $bp_upd_1 || $reset;
         // Step 1: apply the older slot's outcome to the current state.
         $bp_state_0[1:0] =
            ! $bp_upd_0     ? $BranchState :
            /instr[0]$taken ? (($BranchState == 2'b11) ? 2'b11 : $BranchState + 2'b1) :
                              (($BranchState == 2'b00) ? 2'b00 : $BranchState - 2'b1);
         // Step 2: apply the younger slot's outcome to the result of step 1.
         $bp_state_1[1:0] =
            ! $bp_upd_1     ? $bp_state_0 :
            /instr[1]$taken ? (($bp_state_0 == 2'b11) ? 2'b11 : $bp_state_0 + 2'b1) :
                              (($bp_state_0 == 2'b00) ? 2'b00 : $bp_state_0 - 2'b1);
         ?$branch_or_reset
            $BranchState[1:0] <=
               $reset ? 2'b01 :   // Weakly not-taken out of reset.
               $bp_state_1;
      
      //Checkpoint 3
      /instr[1:0]
         @0
            $reset = |fetch$reset;
         @1
            $fetch = |fetch$fetch;
            // Per-slot PC: slot 0 fetches at the group PC, slot 1 at group PC + 4.
            $pc[31:0] = |fetch$Pc + (#instr << 2);
            $pc_inc[31:0] = $pc + 32'd4;
            $no_fetch = 1'b0;
            // A returning load clobbers a slot. All load returns are steered into SLOT 0
            // (regardless of which slot originally issued the load), and the whole current
            // group is refetched ($second_issue_cond redirects to >>0$Pc). This keeps the
            // register-file write ordering trivially correct: a returning load can never
            // co-commit with a younger slot-1 instruction of the same cycle.
            $second_issue_ld = (#instr == 0) && ! $reset && (|fetch/instr[0]>>5$valid_ld || |fetch/instr[1]>>5$valid_ld);
            // Which slot the returning load originally issued from (for pulling its signals).
            $ld_ret_s1 = |fetch/instr[1]>>5$valid_ld;
            $second_issue = ($second_issue_ld );
            $commit_second_issue = $second_issue;  // TODO (inherited from WARP-V): speculative vs. non-speculative versions.
            ?$fetch
               $fetch_word[31:0] = *instrs\[$pc[6:2]\];
         @2
            // DECODE
            ?$second_issue_ld
               //Checkpoint 4
               /orig_load_inst
                  $dest_reg[4:0]   = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$dest_reg   : |fetch/instr[0]>>5$dest_reg;
                  $spec_ld         = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$spec_ld    : |fetch/instr[0]>>5$spec_ld;
                  $ld_st_word      = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$ld_st_word : |fetch/instr[0]>>5$ld_st_word;
                  $ld_st_half      = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$ld_st_half : |fetch/instr[0]>>5$ld_st_half;
                  $addr[31:0]      = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$addr       : |fetch/instr[0]>>5$addr;
                  $raw_funct3[2:0] = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$raw_funct3 : |fetch/instr[0]>>5$raw_funct3;
                  // Load data comes from the shared data memory (read at the load's stage 5).
                  $ld_data[31:0]   = |fetch>>5$dm_ld_data;
                  
               
            // Decode of the fetched instruction
            $valid_decode = $fetch;  // Always decode if we fetch.
            $valid_decode_branch = $valid_decode && $branch;
            ?$valid_decode
               
               
               // Directly connect the fetch word to the instruction.
               $raw[31:0] = $fetch_word;
            
            
            // A load that will return later.
            //$split_ld = $spec_ld && 1'b1;
            // Instantiate the program.
            
            ?$valid_decode
               // =================================
         
               // Extract fields of $raw (instruction) into $raw_<field>[x:0].
               {$raw_funct7[6:0], $raw_rs2[4:0], $raw_rs1[4:0], $raw_funct3[2:0], $raw_rd[4:0], $raw_op5[4:0], $raw_op2[1:0]} = $raw;
               `BOGUS_USE($raw_op2)  // Delete once it's used.
               // Extract immediate fields into type-specific signals.
               $raw_i_imm[31:0] = {{21{$raw[31]}}, $raw[30:20]};
               $raw_s_imm[31:0] = {{21{$raw[31]}}, $raw[30:25], $raw[11:7]};
               $raw_b_imm[31:0] = {{20{$raw[31]}}, $raw[7], $raw[30:25], $raw[11:8], 1'b0};
               $raw_u_imm[31:0] = {$raw[31:12], {12{1'b0}}};
               $raw_j_imm[31:0] = {{12{$raw[31]}}, $raw[19:12], $raw[20], $raw[30:21], 1'b0};
               // Extract other type/instruction-specific fields.
               $raw_shamt[6:0] = $raw[26:20];
               $raw_aq = $raw[26];
               $raw_rl = $raw[25];
               $raw_rs3[4:0] = $raw[31:27];
               $raw_rm[2:0] = $raw_funct3;
               `BOGUS_USE($raw_shamt $raw_aq $raw_rl $raw_rs3 $raw_rm)  // Avoid "unused" messages. Remove these as they become used.
         
               // Instruction type decode
               
               \SV_plus
                  assign $$is_i_type = (((0 | (1 << 5'b00000) | (1 << 5'b00001) | (1 << 5'b00100) | (1 << 5'b00110) | (1 << 5'b11001) | (1 << 5'b11100)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r_type = (((0 | (1 << 5'b01011) | (1 << 5'b01100) | (1 << 5'b01110) | (1 << 5'b10100)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r2_type = (((0) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_r4_type = (((0 | (1 << 5'b10000) | (1 << 5'b10001) | (1 << 5'b10010) | (1 << 5'b10011)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_s_type = (((0 | (1 << 5'b01000) | (1 << 5'b01001)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_b_type = (((0 | (1 << 5'b11000)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_j_type = (((0 | (1 << 5'b11011)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is_u_type = (((0 | (1 << 5'b00101) | (1 << 5'b01101)) >> $raw_op5) & 32'b1) != 32'b0; 
                  assign $$is___type = (((0 | (1 << 5'b00010) | (1 << 5'b00011) | (1 << 5'b00111) | (1 << 5'b01010) | (1 << 5'b01111) | (1 << 5'b10101) | (1 << 5'b10110) | (1 << 5'b10111) | (1 << 5'b11010) | (1 << 5'b11101) | (1 << 5'b11110) | (1 << 5'b11111)) >> $raw_op5) & 32'b1) != 32'b0; 
            
         
               // Instruction decode.
               
               $is_lui_instr = $raw_op5 == 5'b01101;
               $is_auipc_instr = $raw_op5 == 5'b00101;
               $is_jal_instr = $raw_op5 == 5'b11011;
               $is_jalr_instr = $raw_op5 == 5'b11001 && $raw_funct3 == 3'b000;
               $is_beq_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b000;
               $is_bne_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b001;
               $is_blt_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b100;
               $is_bge_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b101;
               $is_bltu_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b110;
               $is_bgeu_instr = $raw_op5 == 5'b11000 && $raw_funct3 == 3'b111;
               $is_lb_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b000;
               $is_lh_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b001;
               $is_lw_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b010;
               $is_lbu_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b100;
               $is_lhu_instr = $raw_op5 == 5'b00000 && $raw_funct3 == 3'b101;
               $is_sb_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b000;
               $is_sh_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b001;
               $is_sw_instr = $raw_op5 == 5'b01000 && $raw_funct3 == 3'b010;
               $is_addi_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b000;
               $is_slti_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b010;
               $is_sltiu_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b011;
               $is_xori_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b100;
               $is_ori_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b110;
               $is_andi_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b111;
               $is_slli_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b001 && $raw_funct7[6:1] == 6'b000000;
               $is_srli_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b101 && $raw_funct7[6:1] == 6'b000000;
               $is_srai_instr = $raw_op5 == 5'b00100 && $raw_funct3 == 3'b101 && $raw_funct7[6:1] == 6'b010000;
               $is_add_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b000 && $raw_funct7[6:0] == 7'b0000000;
               $is_sub_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b000 && $raw_funct7[6:0] == 7'b0100000;
               $is_sll_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b001 && $raw_funct7[6:0] == 7'b0000000;
               $is_slt_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b010 && $raw_funct7[6:0] == 7'b0000000;
               $is_sltu_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b011 && $raw_funct7[6:0] == 7'b0000000;
               $is_xor_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b100 && $raw_funct7[6:0] == 7'b0000000;
               $is_srl_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b101 && $raw_funct7[6:0] == 7'b0000000;
               $is_sra_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b101 && $raw_funct7[6:0] == 7'b0100000;
               $is_or_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b110 && $raw_funct7[6:0] == 7'b0000000;
               $is_and_instr = $raw_op5 == 5'b01100 && $raw_funct3 == 3'b111 && $raw_funct7[6:0] == 7'b0000000;
               $is_csrrw_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b001;
               $is_csrrs_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b010;
               $is_csrrc_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b011;
               $is_csrrwi_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b101;
               $is_csrrsi_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b110;
               $is_csrrci_instr = $raw_op5 == 5'b11100 && $raw_funct3 == 3'b111;
               
            
         
               
               
               $div_mul = 1'b0;
            
            
         
               
               
            
         
               
               
            
         
               $is_srli_srai_instr = $is_srli_instr || $is_srai_instr;
               // Some I-type instructions have a funct7 field rather than immediate bits, so these must factor into the illegal instruction expression explicitly.
               $illegal_itype_with_funct7 = ( $is_srli_srai_instr  ) && | {$raw_funct7[6], $raw_funct7[4:0]};
               $illegal = $illegal_itype_with_funct7 ||
                          (1'b1 && ! $is_lui_instr && ! $is_auipc_instr && ! $is_jal_instr && ! $is_jalr_instr && ! $is_beq_instr && ! $is_bne_instr && ! $is_blt_instr && ! $is_bge_instr && ! $is_bltu_instr && ! $is_bgeu_instr && ! $is_lb_instr && ! $is_lh_instr && ! $is_lw_instr && ! $is_lbu_instr && ! $is_lhu_instr && ! $is_sb_instr && ! $is_sh_instr && ! $is_sw_instr && ! $is_addi_instr && ! $is_slti_instr && ! $is_sltiu_instr && ! $is_xori_instr && ! $is_ori_instr && ! $is_andi_instr && ! $is_slli_instr && ! $is_srli_instr && ! $is_srai_instr && ! $is_add_instr && ! $is_sub_instr && ! $is_sll_instr && ! $is_slt_instr && ! $is_sltu_instr && ! $is_xor_instr && ! $is_srl_instr && ! $is_sra_instr && ! $is_or_instr && ! $is_and_instr && ! $is_csrrw_instr && ! $is_csrrs_instr && ! $is_csrrc_instr && ! $is_csrrwi_instr && ! $is_csrrsi_instr && ! $is_csrrci_instr) ||
                          ($raw[1:0] != 2'b11); // All legal instructions have opcode[1:0] == 2'b11. We ignore these bits in decode logic.
               $conditional_branch = $is_b_type;
            $jump = $is_jal_instr;  // "Jump" in RISC-V means unconditional. (JALR is a separate redirect condition.)
            $branch = $is_b_type;
            $indirect_jump = $is_jalr_instr;
            ?$valid_decode
               $ld = $raw[6:3] == 4'b0;
               $st = $is_s_type;
               $ld_st = $ld || $st;
               $ld_st_word = $ld_st && ($raw_funct3[1] == 1'b1);
               $ld_st_half = $ld_st && ($raw_funct3[1:0] == 2'b01);
               //$ld_st_byte = $ld_st && ($raw_funct3[1:0] == 2'b00);
               `BOGUS_USE($is___type $is_u_type)
         
               // Output signals.
               /src[2:1]
                  // Reg valid for this source, based on instruction type.
                  $is_reg =
                      
                      (/instr$is_r_type || /instr$is_r4_type || (/instr$is_i_type && (#src == 1)) || /instr$is_r2_type || /instr$is_s_type || /instr$is_b_type);
                  $reg[4:0] = (#src == 1) ? /instr$raw_rs1[4:0] : /instr$raw_rs2[4:0];
         
            // Condition signals must not themselves be conditioned (currently).
            $dest_reg[4:0] = $raw_rd[4:0];   // int only
            $dest_reg_valid =  $valid_decode && ! $is_s_type && ! $is_b_type &&
                              | $dest_reg;   // r0 not valid. Asserts for int dest only (see /fpu/$dest_reg_valid for FP).
         
            
            
         
         
            // Actually load.
            $spec_ld = $valid_decode && $ld;
         
            // CSR decode.
            $is_csr_write = $is_csrrw_instr || $is_csrrwi_instr;
            $is_csr_set   = $is_csrrs_instr || $is_csrrsi_instr;
            $is_csr_clear = $is_csrrc_instr || $is_csrrci_instr;
            $is_csr_instr = $is_csr_write ||
                            $is_csr_set   ||
                            $is_csr_clear;
            $valid_csr = 1'b0 || $is_csr_cycle || $is_csr_cycleh || $is_csr_time || $is_csr_timeh || $is_csr_instret || $is_csr_instreth;
            $csr_trap = $is_csr_instr && ! $valid_csr;
         
         // Instantiate the branch predictor.
         // The saturating counter itself is shared machine state and lives in the
         // |fetch scope (see "TWO-BIT SATURATING BRANCH PREDICTOR" above). Each slot
         // reads that one counter to form its own prediction, so both slots of a
         // group predict from the same history, as a single-issue core would.
         
         @2
            ?$branch
               $pred_taken = |fetch>>2$BranchState[1];   // MSB of the 2-bit counter.
      
         @2
            $non_pipelined = $div_mul  ;
            $would_second_issue = ($ld && 1'b1) || $non_pipelined;
            // Pending value to write to dest reg, 1 for instructions that will second-issue.
            $reg_wr_pending = $would_second_issue && ! $second_issue;
            `BOGUS_USE($reg_wr_pending)  // Not used if no bypass and no pending.
            // ======
            // Reg Rd
            // ======
            // Dual-issue bypass network: each source register may bypass from EITHER slot of
            // the groups 1, 2, or 3 cycles ahead (older). Within any one older group, slot 1
            // is younger (later in program order) than slot 0, so slot 1 has priority.
            // There is deliberately NO same-cycle bypass from slot 0 into slot 1 of the SAME
            // group (that would cascade the two ALUs combinationally); that hazard is handled
            // by replaying slot 1 instead (see $intra_group_replay below).
            /src[2:1]
               $is_reg_condition = $is_reg && /instr$valid_decode;  // Note: $is_reg can be set for RISC-V sr0.
               ?$is_reg_condition
                  $rf_value[31:0] =
                       |fetch/regs[$reg]>>3$value;
                  /* verilator lint_off WIDTH */
                  {$reg_value[31:0], $pending} =
                     ($reg == 5'b0) ? {32'b0, 1'b0} :  // Read r0 as 0 (not pending).
                     // Bypass stages. Both register and pending are bypassed.
                     // Bypassed registers must be from instructions that are good-path as of this instruction or are 2nd issuing.
                     (|fetch$bypass_avail1_s1 && (|fetch/instr[1]>>1$wr_reg == $reg)) ? {|fetch/instr[1]>>1$rslt, |fetch/instr[1]>>1$reg_wr_pending} :
                     (|fetch$bypass_avail1_s0 && (|fetch/instr[0]>>1$wr_reg == $reg)) ? {|fetch/instr[0]>>1$rslt, |fetch/instr[0]>>1$reg_wr_pending} :
                     (|fetch$bypass_avail2_s1 && (|fetch/instr[1]>>2$wr_reg == $reg)) ? {|fetch/instr[1]>>2$rslt, |fetch/instr[1]>>2$reg_wr_pending} :
                     (|fetch$bypass_avail2_s0 && (|fetch/instr[0]>>2$wr_reg == $reg)) ? {|fetch/instr[0]>>2$rslt, |fetch/instr[0]>>2$reg_wr_pending} :
                     (|fetch$bypass_avail3_s1 && (|fetch/instr[1]>>3$wr_reg == $reg)) ? {|fetch/instr[1]>>3$rslt, |fetch/instr[1]>>3$reg_wr_pending} :
                     (|fetch$bypass_avail3_s0 && (|fetch/instr[0]>>3$wr_reg == $reg)) ? {|fetch/instr[0]>>3$rslt, |fetch/instr[0]>>3$reg_wr_pending} :
                     {$rf_value, |fetch/regs[$reg]>>3$pending};
                  /* verilator lint_on WIDTH */
               // Replay if source register is pending.
               $replay = $is_reg_condition && $pending;
            
            // Also replay for pending dest reg to keep writes in order. Bypass dest reg pending to support this.
            $is_dest_condition = $dest_reg_valid && /instr$valid_decode;
            ?$is_dest_condition
               $dest_pending =
                  ($wr_reg == 5'b0) ? 1'b0 :  // Read r0 as 0 (not pending).
                  // Bypass stages.
                  (|fetch$bypass_avail1_s1 && (|fetch/instr[1]>>1$wr_reg == $wr_reg)) ? |fetch/instr[1]>>1$reg_wr_pending :
                  (|fetch$bypass_avail1_s0 && (|fetch/instr[0]>>1$wr_reg == $wr_reg)) ? |fetch/instr[0]>>1$reg_wr_pending :
                  (|fetch$bypass_avail2_s1 && (|fetch/instr[1]>>2$wr_reg == $wr_reg)) ? |fetch/instr[1]>>2$reg_wr_pending :
                  (|fetch$bypass_avail2_s0 && (|fetch/instr[0]>>2$wr_reg == $wr_reg)) ? |fetch/instr[0]>>2$reg_wr_pending :
                  (|fetch$bypass_avail3_s1 && (|fetch/instr[1]>>3$wr_reg == $wr_reg)) ? |fetch/instr[1]>>3$reg_wr_pending :
                  (|fetch$bypass_avail3_s0 && (|fetch/instr[0]>>3$wr_reg == $wr_reg)) ? |fetch/instr[0]>>3$reg_wr_pending :
                  |fetch/regs[$wr_reg]>>3$pending;
            // Combine replay conditions for pending source or dest registers.
            $pending_replay = | /src[*]$replay || ($is_dest_condition && $dest_pending);
            
            
            // INTRA-GROUP (SAME-CYCLE) HAZARDS -> REPLAY SLOT 1
            // These are the new hazards created by issuing two instructions per cycle.
            // All of them are resolved the same way: slot 1 aborts and the PC redirects to
            // slot 1's own address, so it re-executes as slot 0 of a later group (by then,
            // slot 0's result is reachable through the normal cross-group bypass network).
            // (These compare against slot 0, so they are gated to slot 1 by #instr below;
            //  the slot-0 copies of these signals are unused.)
            $raw_haz = |fetch/instr[0]$dest_reg_valid &&
                       ((/src[1]$is_reg_condition && (/src[1]$reg == |fetch/instr[0]$dest_reg)) ||
                        (/src[2]$is_reg_condition && (/src[2]$reg == |fetch/instr[0]$dest_reg)));   // Read-after-write.
            $waw_haz = |fetch/instr[0]$dest_reg_valid && $dest_reg_valid && ($dest_reg == |fetch/instr[0]$dest_reg);   // Write-after-write (needed when slot 0 is a load; kept for all cases for simplicity).
            $mem_haz = (|fetch/instr[0]$ld_st && |fetch/instr[0]$valid_decode) && ($ld_st && $valid_decode);   // Structural: one data-memory port.
            $csr_haz = $is_csr_instr && $valid_decode;   // Structural: CSR instructions execute in slot 0 only.
            $intra_group_replay = (#instr != 0) && $valid_decode &&
                                  ($raw_haz || $waw_haz || $mem_haz || $csr_haz);
            
            // Combined replay for this slot.
            $replay = ($pending_replay ) || $intra_group_replay;
         // =======
         // Execute
         // =======
         // Instantiate the program.
         
         // if M_EXT is enabled, this handles the stalling logic
         
      
         // if F_EXT is enabled, this handles the stalling logic
         
      
         // if B_EXT is enabled, this handles the stalling logic
         
      
         
         @2
            ?$valid_decode_branch
               $branch_target[31:0] = $pc[31:0] + $raw_b_imm[31:0];
               $misaligned_pc = | $raw_b_imm[1:0];
            ?$jump  // (JAL, not JALR)
               $jump_target[31:0] = $pc[31:0] + $raw_j_imm[31:0];
               $misaligned_jump_target = $raw_j_imm[1];
         @3
            // Execution.
            $valid_exe = $valid_decode; // Execute if we decoded.
            
            
         
      
            
            
         
      
      
            
            
         
      
            // hold_inst scope is not needed when long latency instructions are disabled
            
            // Compute results for each instruction, independent of decode (power-hungry, but fast).
            ?$valid_exe
               $equal = /src[1]$reg_value == /src[2]$reg_value;
            ?$branch
               $taken =
                  $is_j_type ||
                  ($is_beq_instr && $equal) ||
                  ($is_bne_instr && ! $equal) ||
                  (($is_blt_instr || $is_bltu_instr || $is_bge_instr || $is_bgeu_instr) &&
                   (($is_bge_instr || $is_bgeu_instr) ^
                    (({($is_blt_instr ^ /src[1]$reg_value[31]), /src[1]$reg_value[31-1:0]} <
                      {($is_blt_instr ^ /src[2]$reg_value[31]), /src[2]$reg_value[31-1:0]}
                     ) ^ ((/src[1]$reg_value[31] != /src[2]$reg_value[31]) & $is_bge_instr)
                    )
                   )
                  );
            ?$indirect_jump  // (JALR)
               $indirect_jump_full_target[31:0] = /src[1]$reg_value + $raw_i_imm;
               $indirect_jump_target[31:0] = {$indirect_jump_full_target[31:1], 1'b0};
               $misaligned_indirect_jump_target = $indirect_jump_full_target[1];
            ?$valid_exe
               // Compute each individual instruction result, combined per-instruction by a macro.
               // TODO: Could provide some macro magic to specify combined instructions w/ a single result and mux select.
               //       This would reduce code below and probably improve implementation.
      
               $lui_rslt[31:0]   = {$raw_u_imm[31:12], 12'b0};
               $auipc_rslt[31:0] = $pc + $raw_u_imm;
               $jal_rslt[31:0]   = $pc + 4;
               $jalr_rslt[31:0]  = $pc + 4;
               // Load instructions. If returning ld is enabled, load instructions write no meaningful result, so we use zeros.
               
               
               $lb_rslt[31:0]    = 32'b0;
               $lh_rslt[31:0]    = 32'b0;
               $lw_rslt[31:0]    = 32'b0;
               $lbu_rslt[31:0]   = 32'b0;
               $lhu_rslt[31:0]   = 32'b0;
               
               
               
            
            
               $addi_rslt[31:0]  = /src[1]$reg_value + $raw_i_imm;  // TODO: This has its own adder; could share w/ add/sub.
               $xori_rslt[31:0]  = /src[1]$reg_value ^ $raw_i_imm;
               $ori_rslt[31:0]   = /src[1]$reg_value | $raw_i_imm;
               $andi_rslt[31:0]  = /src[1]$reg_value & $raw_i_imm;
               $slli_rslt[31:0]  = /src[1]$reg_value << $raw_i_imm[5:0];
               $srli_intermediate_rslt[31:0] = /src[1]$reg_value >> $raw_i_imm[5:0];
               $srai_intermediate_rslt[31:0] = /src[1]$reg_value[31] ? $srli_intermediate_rslt | ((32'b0 - 1) << (32 - $raw_i_imm[5:0]) ): $srli_intermediate_rslt;
               $srl_rslt[31:0]   = /src[1]$reg_value >> /src[2]$reg_value[4:0];
               $sra_rslt[31:0]   = /src[1]$reg_value[31] ? $srl_rslt | ((32'b0 - 1) << (32 - /src[2]$reg_value[4:0]) ): $srl_rslt;
               $slti_rslt[31:0]  =  (/src[1]$reg_value[31] == $raw_i_imm[31]) ? $sltiu_rslt : {31'b0,/src[1]$reg_value[31]};
               $sltiu_rslt[31:0] = (/src[1]$reg_value < $raw_i_imm) ? 1 : 0;
               $srai_rslt[31:0]  = $srai_intermediate_rslt;
               $srli_rslt[31:0]  = $srli_intermediate_rslt;
               $add_sub_rslt[31:0] = ($raw_funct7[5] == 1) ?  /src[1]$reg_value - /src[2]$reg_value : /src[1]$reg_value + /src[2]$reg_value;
               $add_rslt[31:0]   = $add_sub_rslt;
               $sub_rslt[31:0]   = $add_sub_rslt;
               $sll_rslt[31:0]   = /src[1]$reg_value << /src[2]$reg_value[4:0];
               $slt_rslt[31:0]   = (/src[1]$reg_value[31] == /src[2]$reg_value[31]) ? $sltu_rslt : {31'b0,/src[1]$reg_value[31]};
               $sltu_rslt[31:0]  = (/src[1]$reg_value < /src[2]$reg_value) ? 1 : 0;
               $xor_rslt[31:0]   = /src[1]$reg_value ^ /src[2]$reg_value;
               $or_rslt[31:0]    = /src[1]$reg_value | /src[2]$reg_value;
               $and_rslt[31:0]   = /src[1]$reg_value & /src[2]$reg_value;
               // CSR read instructions have the same result expression. Counting on synthesis to optimize result mux.
               $csrrw_rslt[31:0]  = $is_csr_instreth ? {{0{1'b0}}, |fetch$csr_instreth} : $is_csr_instret ? {{0{1'b0}}, |fetch$csr_instret} : $is_csr_timeh ? {{0{1'b0}}, |fetch$csr_timeh} : $is_csr_time ? {{0{1'b0}}, |fetch$csr_time} : $is_csr_cycleh ? {{0{1'b0}}, |fetch$csr_cycleh} : $is_csr_cycle ? {{0{1'b0}}, |fetch$csr_cycle} : 32'bx;
               $csrrs_rslt[31:0]  = $csrrw_rslt;
               $csrrc_rslt[31:0]  = $csrrw_rslt;
               $csrrwi_rslt[31:0] = $csrrw_rslt;
               $csrrsi_rslt[31:0] = $csrrw_rslt;
               $csrrci_rslt[31:0] = $csrrw_rslt;
      
               // "M" Extension.
      
               
               
            
      
               // "F" Extension.
      
               // TODO: Move this under /fpu.
               
               
            
      
               
               
            
         // Per-slot CSR address decode (the CSR state itself lives in the shared |fetch scope below).
         @2
            $is_csr_cycle    = $raw[31:20] == 12'hC00;
            $is_csr_cycleh   = $raw[31:20] == 12'hC80;
            $is_csr_time     = $raw[31:20] == 12'hC01;
            $is_csr_timeh    = $raw[31:20] == 12'hC81;
            $is_csr_instret  = $raw[31:20] == 12'hC02;
            $is_csr_instreth = $raw[31:20] == 12'hC82;
         @3
            // CSR write value for CSR write instructions.
            $csr_wr_value[31:0] = $raw_funct3[2] ? {27'b0, $raw_rs1} : /src[1]$reg_value;
         @3
      
            // Memory redirects.
            ?$valid_exe
               $unnatural_addr_trap = ($ld_st_word && ($addr[1:0] != 2'b00)) || ($ld_st_half && $addr[0]);
      
            // Memory inputs
            $ld_st_cond = $ld_st && $valid_exe;
            ?$ld_st_cond
               $addr[31:0] = /src[1]$reg_value + ($ld ? $raw_i_imm : $raw_s_imm);
      
            // Hardware assumes natural alignment. Otherwise, trap, and handle in s/w (though no s/w provided).
            $st_cond = $st && $valid_exe;
            ?$st_cond
               // Provide a value to store, naturally-aligned to memory, that will work regardless of the lower $addr bits.
               $st_reg_value[31:0] = 
                                                        /src[2]$reg_value;
               
               $st_value[31:0] =
                    $ld_st_word ? $st_reg_value :            // word
                    $ld_st_half ? {2{$st_reg_value[15:0]}} : // half
                                  {4{$st_reg_value[7:0]}};   // byte
               $st_mask[3:0] =
                    $ld_st_word ? 4'hf :                     // word
                    $ld_st_half ? ($addr[1] ? 4'hc : 4'h3) : // half
                                  (4'h1 << $addr[1:0]);      // byte
            
            ?$second_issue_ld
               /orig_load_inst
                  $spec_ld_cond = $spec_ld;
                  ?$spec_ld_cond

                     $sign_bit =
                        (! $raw_funct3[2]) && (
                           $ld_st_word ? $ld_data[31] :
                           $ld_st_half ? ($addr[1] ? $ld_data[31] : $ld_data[15]) :
                                         (($addr[1:0] == 2'b00) ? $ld_data[7] :
                                          ($addr[1:0] == 2'b01) ? $ld_data[15] :
                                          ($addr[1:0] == 2'b10) ? $ld_data[23] :
                                                                  $ld_data[31]
                                         )
                        );
                     {$ld_rslt[31:0], $ld_mask[3:0]} =
                          $ld_st_word ? {$ld_data, 4'b1111} :
                          $ld_st_half ? {{16{$sign_bit}}, $addr[1] ? {$ld_data[31:16], 4'b1100} :
                                                                     {$ld_data[15:0] , 4'b0011}} :
                                        {{24{$sign_bit}}, ($addr[1:0] == 2'b00) ? {$ld_data[7:0]  , 4'b0001} :
                                                          ($addr[1:0] == 2'b01) ? {$ld_data[15:8] , 4'b0010} :
                                                          ($addr[1:0] == 2'b10) ? {$ld_data[23:16], 4'b0100} :
                                                                                  {$ld_data[31:24], 4'b1000}};
                     `BOGUS_USE($ld_mask) // It's only for RISC-V formal verification.
      
            // ISA-specific trap conditions:
            // I can't see in the spec which of these is to commit results. I've made choices that make riscv-formal happy.
            $non_aborting_isa_trap = 1'b0;
            $aborting_isa_trap =     ($branch && $taken && $misaligned_pc) ||
                                     ($jump && $misaligned_jump_target) ||
                                     ($indirect_jump && $misaligned_indirect_jump_target) ||
                                     ($ld_st && $unnatural_addr_trap) ||
                                     $csr_trap;
      
         @3
            
            //Checkpoint 5
            
         
         
            $rslt[31:0] =
                  $second_issue_ld ? /orig_load_inst$ld_rslt :
                  
                  32'b0 |
                ({32{$is_lui_instr}} & $lui_rslt) |
                ({32{$is_auipc_instr}} & $auipc_rslt) |
                ({32{$is_jal_instr}} & $jal_rslt) |
                ({32{$is_jalr_instr}} & $jalr_rslt) |
                ({32{$is_lb_instr}} & $lb_rslt) |
                ({32{$is_lh_instr}} & $lh_rslt) |
                ({32{$is_lw_instr}} & $lw_rslt) |
                ({32{$is_lbu_instr}} & $lbu_rslt) |
                ({32{$is_lhu_instr}} & $lhu_rslt) |
                ({32{$is_addi_instr}} & $addi_rslt) |
                ({32{$is_slti_instr}} & $slti_rslt) |
                ({32{$is_sltiu_instr}} & $sltiu_rslt) |
                ({32{$is_xori_instr}} & $xori_rslt) |
                ({32{$is_ori_instr}} & $ori_rslt) |
                ({32{$is_andi_instr}} & $andi_rslt) |
                ({32{$is_slli_instr}} & $slli_rslt) |
                ({32{$is_srli_instr}} & $srli_rslt) |
                ({32{$is_srai_instr}} & $srai_rslt) |
                ({32{$is_add_instr}} & $add_rslt) |
                ({32{$is_sub_instr}} & $sub_rslt) |
                ({32{$is_sll_instr}} & $sll_rslt) |
                ({32{$is_slt_instr}} & $slt_rslt) |
                ({32{$is_sltu_instr}} & $sltu_rslt) |
                ({32{$is_xor_instr}} & $xor_rslt) |
                ({32{$is_srl_instr}} & $srl_rslt) |
                ({32{$is_sra_instr}} & $sra_rslt) |
                ({32{$is_or_instr}} & $or_rslt) |
                ({32{$is_and_instr}} & $and_rslt) |
                ({32{$is_csrrw_instr}} & $csrrw_rslt) |
                ({32{$is_csrrs_instr}} & $csrrs_rslt) |
                ({32{$is_csrrc_instr}} & $csrrc_rslt) |
                ({32{$is_csrrwi_instr}} & $csrrwi_rslt) |
                ({32{$is_csrrsi_instr}} & $csrrsi_rslt) |
                ({32{$is_csrrci_instr}} & $csrrci_rslt);
         
      
         @2
            // Redirect fetch to the branch target when the predictor says taken.
            $pred_taken_branch = $pred_taken && $branch;
         @3
            // Control

            // Execute stage redirect conditions.
            $replay_trap = 1'b0;
            $aborting_trap = ($replay_trap || ($valid_decode && $illegal) || $aborting_isa_trap);
            $non_aborting_trap = $non_aborting_isa_trap;
            $mispred_branch = $branch && ! ($conditional_branch && ($taken == $pred_taken));
            ?$valid_decode_branch
               $branch_redir_pc[31:0] =
                  // With the two-bit predictor a mispredict can go either way: a branch
                  // predicted taken but resolved not-taken must redirect to PC+4.
                  (! $taken) ? $pc_inc :
                               $branch_target;
            $trap_target[31:0] = $replay_trap ? $pc : {{30{1'b1}}, 2'b0};  // TODO: What should this be? Using ones to terminate test for now.
            // Determine whether the instruction should commit it's result.
            //
            // Abort: Instruction triggers a condition causing a no-commit.
            // Commit: Ultimate decision to commit results of this instruction, considering aborts and
            //         prior-instruction redirects (good-path)
            //
            // Treatment of loads:
            //    Loads will commit. They write a garbage value and "pending" to the register file.
            //    Returning loads clobber an instruction. This instruction is $abort'ed (as is the
            //    returning load, since they are one in the same). Returning load must explicitly
            //    write results.
            //
            $abort = 1'b0 || $no_fetch || $second_issue || $replay || $aborting_trap;  

            $killed_by_slot0 = (#instr != 0) && |fetch$slot0_redir_e3;
            $good_path = (! $reset && |fetch>>-2$next_good_path_mask[3] && ! $killed_by_slot0);
            $commit = $good_path && ! $abort;
            
            
            
            
            
            // Conditions that commit results.
            $commit_dest_reg = ($dest_reg_valid && $commit) || ($commit_second_issue  );
            
            
               
            
            $valid_ld = $ld && $commit;
            $valid_st = $st && $commit;
            // For the test bench: this slot committed a taken branch this cycle.
            $good_taken_branch = $commit && $branch && $taken;
         // Reg Write
         @2
            $wr_reg[4:0] = $second_issue ? /orig_load_inst$dest_reg : $dest_reg;   // (In-scope references; same resolution style the $rslt mux already uses.)
         @5
            // A type-independent immediate value, for debug. (For R-type, funct7 is used as immediate).
            $imm_value[31:0] =
                 ({32{$is_i_type}} & $raw_i_imm) |
                 ({32{$is_r_type}} & {25'b0, $raw_funct7}) |
                 ({32{$is_s_type}} & $raw_s_imm) |
                 ({32{$is_b_type}} & $raw_b_imm) |
                 ({32{$is_u_type}} & $raw_u_imm) |
                 ({32{$is_j_type}} & $raw_j_imm);
            $imm_valid = $is_i_type || $is_r_type || $is_s_type || $is_b_type || $is_u_type || $is_j_type;
            `BOGUS_USE($imm_value $imm_valid)  // Consumed only by VIZ in the original; kept for waveform debug.
            ?$valid_decode
               // For debug.
               $mnemonic[10*8-1:0] = $is_lui_instr ? "LUI       " : $is_auipc_instr ? "AUIPC     " : $is_jal_instr ? "JAL       " : $is_jalr_instr ? "JALR      " : $is_beq_instr ? "BEQ       " : $is_bne_instr ? "BNE       " : $is_blt_instr ? "BLT       " : $is_bge_instr ? "BGE       " : $is_bltu_instr ? "BLTU      " : $is_bgeu_instr ? "BGEU      " : $is_lb_instr ? "LB        " : $is_lh_instr ? "LH        " : $is_lw_instr ? "LW        " : $is_lbu_instr ? "LBU       " : $is_lhu_instr ? "LHU       " : $is_sb_instr ? "SB        " : $is_sh_instr ? "SH        " : $is_sw_instr ? "SW        " : $is_addi_instr ? "ADDI      " : $is_slti_instr ? "SLTI      " : $is_sltiu_instr ? "SLTIU     " : $is_xori_instr ? "XORI      " : $is_ori_instr ? "ORI       " : $is_andi_instr ? "ANDI      " : $is_slli_instr ? "SLLI      " : $is_srli_instr ? "SRLI      " : $is_srai_instr ? "SRAI      " : $is_add_instr ? "ADD       " : $is_sub_instr ? "SUB       " : $is_sll_instr ? "SLL       " : $is_slt_instr ? "SLT       " : $is_sltu_instr ? "SLTU      " : $is_xor_instr ? "XOR       " : $is_srl_instr ? "SRL       " : $is_sra_instr ? "SRA       " : $is_or_instr ? "OR        " : $is_and_instr ? "AND       " : $is_csrrw_instr ? "CSRRW     " : $is_csrrs_instr ? "CSRRS     " : $is_csrrc_instr ? "CSRRC     " : $is_csrrwi_instr ? "CSRRWI    " : $is_csrrsi_instr ? "CSRRSI    " : $is_csrrci_instr ? "CSRRCI    " :  "ILLEGAL   ";
               `BOGUS_USE($mnemonic)
      
   
      
      
      //--------------
      // CSR CYCLE
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_cycle_hw_wr_en_mask[31:0] = {32{$csr_cycle_hw_wr}} & $csr_cycle_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_cycle[31:0] =
              ($csr_cycle_hw_wr_en_mask & $csr_cycle_hw_wr_value) | (~ $csr_cycle_hw_wr_en_mask & $csr_cycle);
      
      
         
         
         // Next value of the CSR.
         $csr_cycle_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_cycle[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_cycle :
              /instr[0]$is_csr_write && /instr[0]$is_csr_cycle
                     ? $csr_cycle_masked_wr_value | ($upd_csr_cycle & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_cycle
                     ? $upd_csr_cycle |   $csr_cycle_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_cycle
                     ? $upd_csr_cycle & ~ $csr_cycle_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_cycle;
      
      
   
      
      
      //--------------
      // CSR CYCLEH
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_cycleh_hw_wr_en_mask[31:0] = {32{$csr_cycleh_hw_wr}} & $csr_cycleh_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_cycleh[31:0] =
              ($csr_cycleh_hw_wr_en_mask & $csr_cycleh_hw_wr_value) | (~ $csr_cycleh_hw_wr_en_mask & $csr_cycleh);
      
      
         
         
         // Next value of the CSR.
         $csr_cycleh_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_cycleh[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_cycleh :
              /instr[0]$is_csr_write && /instr[0]$is_csr_cycleh
                     ? $csr_cycleh_masked_wr_value | ($upd_csr_cycleh & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_cycleh
                     ? $upd_csr_cycleh |   $csr_cycleh_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_cycleh
                     ? $upd_csr_cycleh & ~ $csr_cycleh_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_cycleh;
      
      
   
      
      
      //--------------
      // CSR TIME
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_time_hw_wr_en_mask[31:0] = {32{$csr_time_hw_wr}} & $csr_time_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_time[31:0] =
              ($csr_time_hw_wr_en_mask & $csr_time_hw_wr_value) | (~ $csr_time_hw_wr_en_mask & $csr_time);
      
      
         
         
         // Next value of the CSR.
         $csr_time_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_time[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_time :
              /instr[0]$is_csr_write && /instr[0]$is_csr_time
                     ? $csr_time_masked_wr_value | ($upd_csr_time & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_time
                     ? $upd_csr_time |   $csr_time_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_time
                     ? $upd_csr_time & ~ $csr_time_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_time;
      
      
   
      
      
      //--------------
      // CSR TIMEH
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_timeh_hw_wr_en_mask[31:0] = {32{$csr_timeh_hw_wr}} & $csr_timeh_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_timeh[31:0] =
              ($csr_timeh_hw_wr_en_mask & $csr_timeh_hw_wr_value) | (~ $csr_timeh_hw_wr_en_mask & $csr_timeh);
      
      
         
         
         // Next value of the CSR.
         $csr_timeh_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_timeh[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_timeh :
              /instr[0]$is_csr_write && /instr[0]$is_csr_timeh
                     ? $csr_timeh_masked_wr_value | ($upd_csr_timeh & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_timeh
                     ? $upd_csr_timeh |   $csr_timeh_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_timeh
                     ? $upd_csr_timeh & ~ $csr_timeh_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_timeh;
      
      
   
      
      
      //--------------
      // CSR INSTRET
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_instret_hw_wr_en_mask[31:0] = {32{$csr_instret_hw_wr}} & $csr_instret_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_instret[31:0] =
              ($csr_instret_hw_wr_en_mask & $csr_instret_hw_wr_value) | (~ $csr_instret_hw_wr_en_mask & $csr_instret);
      
      
         
         
         // Next value of the CSR.
         $csr_instret_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_instret[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_instret :
              /instr[0]$is_csr_write && /instr[0]$is_csr_instret
                     ? $csr_instret_masked_wr_value | ($upd_csr_instret & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_instret
                     ? $upd_csr_instret |   $csr_instret_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_instret
                     ? $upd_csr_instret & ~ $csr_instret_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_instret;
      
      
   
      
      
      //--------------
      // CSR INSTRETH
      //--------------
      @3
         // CSR update. Counting on synthesis to optimize each bit, based on {32{1'b1}}.
         // Conditionally include code for h/w and s/w write based on side_effect param (0 - s/w, 1 - s/w + h/w, RO - neither).
         
   
         
         
         // hw_wr_mask conditioned by hw_wr.
         $csr_instreth_hw_wr_en_mask[31:0] = {32{$csr_instreth_hw_wr}} & $csr_instreth_hw_wr_mask;
         // The CSR value, updated by side-effect writes.
         $upd_csr_instreth[31:0] =
              ($csr_instreth_hw_wr_en_mask & $csr_instreth_hw_wr_value) | (~ $csr_instreth_hw_wr_en_mask & $csr_instreth);
      
      
         
         
         // Next value of the CSR.
         $csr_instreth_masked_wr_value[31:0] =
              /instr[0]$csr_wr_value[31:0] & {32{1'b1}};
         <<1$csr_instreth[31:0] =
              $reset ? 32'b0 :
              ! /instr[0]$commit
                     ? $upd_csr_instreth :
              /instr[0]$is_csr_write && /instr[0]$is_csr_instreth
                     ? $csr_instreth_masked_wr_value | ($upd_csr_instreth & ~ {32{1'b1}}) :
              /instr[0]$is_csr_set   && /instr[0]$is_csr_instreth
                     ? $upd_csr_instreth |   $csr_instreth_masked_wr_value :
              /instr[0]$is_csr_clear && /instr[0]$is_csr_instreth
                     ? $upd_csr_instreth & ~ $csr_instreth_masked_wr_value :
              // No CSR instruction update, only h/w side-effects.
                       $upd_csr_instreth;
      
      
   
      
   
      @3
         
         
         
      
      
      
         // Counter CSR
         //
         
         
         // Count within time unit. This is not reset on writes to time CSR, so time CSR is only accurate to time unit.
         $RemainingCyclesWithinTimeUnit[30-1:0] <=
              ($reset || $time_unit_expires) ?
                     30'd999999999 :
                     $RemainingCyclesWithinTimeUnit - 30'b1;
         $time_unit_expires = !( | $RemainingCyclesWithinTimeUnit);  // reaches zero
               
         $full_csr_cycle_hw_wr_value[63:0]   = {$csr_cycleh,   $csr_cycle  } + 64'b1;
         $full_csr_time_hw_wr_value[63:0]    = {$csr_timeh,    $csr_time   } + 64'b1;
         $full_csr_instret_hw_wr_value[63:0] = {$csr_instreth, $csr_instret} + {63'b0, /instr[0]$commit} + {63'b0, /instr[1]$commit};  // instret counts BOTH slots' commits.
         
         
      
         // CSR h/w side-effect write signals.
         $csr_cycle_hw_wr = 1'b1;
         $csr_cycle_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_cycle_hw_wr_value[31:0] = $full_csr_cycle_hw_wr_value[31:0];
         $csr_cycleh_hw_wr = 1'b1;
         $csr_cycleh_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_cycleh_hw_wr_value[31:0] = $full_csr_cycle_hw_wr_value[63:32];
         $csr_time_hw_wr = $time_unit_expires;
         $csr_time_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_time_hw_wr_value[31:0] = $full_csr_time_hw_wr_value[31:0];
         $csr_timeh_hw_wr = $time_unit_expires;
         $csr_timeh_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_timeh_hw_wr_value[31:0] = $full_csr_time_hw_wr_value[63:32];
         $csr_instret_hw_wr = /instr[0]$commit || /instr[1]$commit;
         $csr_instret_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_instret_hw_wr_value[31:0] = $full_csr_instret_hw_wr_value[31:0];
         $csr_instreth_hw_wr = /instr[0]$commit || /instr[1]$commit;
         $csr_instreth_hw_wr_mask[31:0] = {32{1'b1}};
         $csr_instreth_hw_wr_value[31:0] = $full_csr_instret_hw_wr_value[63:32];
         
         
      
      
      
      
         // For multicore CSRs:
         

      // SHARED DATA MEMORY (hoisted from /instr to |fetch).
      // One load/store port. At most one memory instruction per group is
      // guaranteed by the $mem_haz slot-1 replay, so a simple 2:1 mux
      // selects the (at most one) memory operation of the group.

      @3
         $dm_slot1 = ! /instr[0]$ld_st_cond;   // The group's memory op (if any) is in slot 1.
         $dm_spec_ld = /instr[0]$spec_ld || /instr[1]$spec_ld;
         $dm_addr[31:0]     = $dm_slot1 ? /instr[1]$addr     : /instr[0]$addr;
         $dm_valid_st       = /instr[0]$valid_st || /instr[1]$valid_st;
         $dm_st_value[31:0] = $dm_slot1 ? /instr[1]$st_value : /instr[0]$st_value;
         $dm_st_mask[3:0]   = $dm_slot1 ? /instr[1]$st_mask  : /instr[0]$st_mask;
      @5
         // A simple array memory (as in the original), placed in the fetch pipeline.
         /bank[3:0]
            // Explicit pulls of the memory-port signals from |fetch into /bank
            // (replaces the original's $ANY pull, which pulled from /instr).
            $dm_spec_ld        = |fetch$dm_spec_ld;
            $dm_addr[31:0]     = |fetch$dm_addr;
            $dm_valid_st       = |fetch$dm_valid_st;
            $dm_st_mask[3:0]   = |fetch$dm_st_mask;
            $dm_st_value[31:0] = |fetch$dm_st_value;
            /mem[31:0]
            ?$dm_spec_ld
               $ld_data[(32 / 4) - 1 : 0] = /mem[$dm_addr[4 + 2 : 2]]$Value;
         // Combine $ld_data per bank, assuming little-endian.
         $dm_ld_data[31:0] = {/bank[3]$ld_data, /bank[2]$ld_data, /bank[1]$ld_data, /bank[0]$ld_data};
         // =====
         // Store
         // =====
         /bank[*]
            \SV_plus
               always @ (posedge clk) begin
                  if ($dm_valid_st && $dm_st_mask[#bank])
                     /mem[$dm_addr[4 + 2 : 2]]<<0$$^Value[(32 / 4) - 1 : 0] <= $dm_st_value[(#bank + 1) * (32 / 4) - 1: #bank * (32 / 4)];
               end
     
      // SHARED ARCHITECTURAL REGISTER FILE (hoisted from /instr to |fetch).
      // Four read ports (2 sources x 2 slots, via /regs[$reg] references in
      // the per-slot Reg Rd logic) and TWO write ports. When both slots
      // commit a write to the SAME register in the same cycle, slot 1
      // (younger, later in program order) wins. (With the conservative WAW
      // replay above this same-register case cannot actually arise, but the
      // priority is kept for safety/clarity.)

      @5
         /* verilator lint_save */
         /* verilator lint_on WIDTH */
         /regs[31:1]
            $wr0 = |fetch/instr[0]$commit_dest_reg && (|fetch/instr[0]$wr_reg == #regs);
            $wr1 = |fetch/instr[1]$commit_dest_reg && (|fetch/instr[1]$wr_reg == #regs);
            <<1$value[31:0] = $wr1 ? |fetch/instr[1]$rslt :
                              $wr0 ? |fetch/instr[0]$rslt :
                                     $value;
            // Write $pending along with $value, but coded differently because it must be reset.
            <<1$pending = ! |fetch$reset && ($wr1 ? |fetch/instr[1]$reg_wr_pending :
                                             $wr0 ? |fetch/instr[0]$reg_wr_pending :
                                                    $pending);
         /* verilator lint_restore */

   // Visualization for the DUAL-ISSUE hierarchy.
   |fetch
      @5
         \viz_js
            //Main layout
            box: {
                  fill: "#7AD7F0",
                  strokeWidth: 0
                 },
            where: {left: 0, top: 0, width: 451, height: 251},

         /instr_mem[31:0]
            \viz_js
               all: {
                  box: {
                     width: 670,
                     height: 76 + 18 * 32,
                     fill: "#208028",
                     stroke: "white",
                     strokeWidth: 0
                  },
                  init() {
                     let imem_header = new fabric.Text("🗃️ Instr. Memory (slot0=cyan, slot1=green, 2nd-issue=orange)", {
                        top: 10,
                        left: 30,
                        fontSize: 16,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "black"
                     })
                     return {imem_header}
                  },
                  render() {
                     // Highlight both slots' instructions (+ 2nd-issue original load).
                     this.hl = []
                     let paint = (idx, color) => {
                        let inst = this.getContext().children[idx]
                        if (typeof inst !== "undefined") {
                           inst.initObjects.instr_binary_box.set({fill: color})
                           inst.initObjects.instr_asm_box.set({fill: color})
                           this.hl.push(idx)
                        }
                     }
                     // Slot 1 (younger) first, so slot-0 coloring wins any (impossible) overlap.
                     let pc1 = '|fetch/instr[1]$pc'.asInt(-1) / 4
                     paint(pc1, '|fetch/instr[1]$commit'.asBool(false) ? "#c8ffc8" : "#e0e0e0")
                     let pc0 = '|fetch/instr[0]$pc'.asInt(-1) / 4
                     paint(pc0, '|fetch/instr[0]$commit'.asBool(false) ? "#b0ffff" : "#d0d0d0")
                     if ('|fetch/instr[0]$second_issue'.asBool(false)) {
                        let pc2 = '|fetch/instr[0]/orig_load_inst$pc'.asInt(-1) / 4
                        paint(pc2, "#ffd0b0")
                     }
                  },
                  unrender() {
                     // Unhighlight everything highlighted last cycle.
                     if (typeof this.hl !== "undefined") {
                        for (const idx of this.hl) {
                           let inst = this.getContext().children[idx]
                           if (typeof inst !== "undefined") {
                              inst.initObjects.instr_binary_box.set({fill: "white"})
                              inst.initObjects.instr_asm_box.set({fill: "white"})
                           }
                        }
                     }
                  },
               },
               box: {strokeWidth: 0},
               where: {left: 10, top: 10},
               where0: {left: 30, top: 50},
               layout: {top: 18}, //scope's instances stacked vertically
               init() {
                  let instr_str = new fabric.Text("" , {
                     left: 10,
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
                  let instr_asm_box = new fabric.Rect({
                     left: 0,
                     fill: "white",
                     width: 280,
                     height: 14
                  })
                  let instr_binary_box = new fabric.Rect({
                     left: 330,
                     fill: "white",
                     width: 280,
                     height: 14
                  })
                  return {instr_asm_box, instr_binary_box, instr_str}
               },
               render() {
                  // Instruction memory is constant, so just create it once.
                  let instr_str = '$instr'.asBinaryStr(NaN) + "      " + '$instr_str'.asString("?")
                  this.getObjects().instr_str.set({text: `${instr_str}`})
               },

         /instr[1:0]

            // VIZ-support signals (TLV)
            /src[2:1]
               $unconditioned_reg[4:0] = $reg;
               $unconditioned_is_reg = $is_reg;
               $unconditioned_reg_value[31:0] = $reg_value;
            // The original PC of a returning load, for VIZ (the generated VIZ used
            // /orig_inst$pc). Same mux style as the other /orig_load_inst pulls.
            /orig_load_inst
               $pc[31:0] = /instr$ld_ret_s1 ? |fetch/instr[1]>>5$pc : |fetch/instr[0]>>5$pc;
            \viz_js
               all: {
                  box: {width: 250, height: 355, strokeWidth: 0},
               },
               where: {left: 697, top: 5},
               where0: {left: 5, top: 5},
               layout: {top: 175},
               box: {
                  width: 240,
                  height: 165,
                  fill: "#f8f0e8",
                  stroke: "#ff8060",
                  strokeWidth: 1
               },
               init() {
                  let i = this.getIndex()
                  let slot_header = new fabric.Text(i == 0 ? "⚙️ Slot 0 (older)" : "⚙️ Slot 1 (younger)", {
                     top: 5, left: 10,
                     fill: "maroon",
                     fontSize: 14, fontWeight: 800, fontFamily: "monospace"
                  })
                  let pc_text     = new fabric.Text("", {top: 26,  left: 10, fontSize: 11, fontFamily: "monospace"})
                  let instr_text  = new fabric.Text("", {top: 42,  left: 10, fontSize: 12, fontFamily: "monospace"})
                  let status_text = new fabric.Text("", {top: 126, left: 10, fontSize: 12, fontWeight: 800, fontFamily: "monospace"})
                  let haz_text    = new fabric.Text("", {top: 144, left: 10, fontSize: 10, fontFamily: "monospace"})
                  return {slot_header, pc_text, instr_text, status_text, haz_text}
               },
               render() {
                  let toSigned32 = function(sig) {
                     let val = sig.asInt(NaN)
                     if (val >= 2**31) {val = val - 2**32}
                     return val
                  }
                  let commit = '$commit'.asBool(false)
                  let second = '$second_issue'.asBool(false)          // Slot 0 only.
                  let killed = '$killed_by_slot0'.asBool(false)       // Slot 1 only.
                  let replay = '$replay'.asBool(false)
                  let intra  = '$intra_group_replay'.asBool(false)    // Slot 1 only.
                  //
                  // PC and fetched instruction string (guard invalid imem index).
                  //
                  let pc = '$pc'.asInt(-1)
                  let pcIdx = pc / 4
                  let $instr_str = '|fetch/instr_mem[pcIdx]$instr_str'  // pcIdx could be out of range, so make sure this isn't null.
                  let instr_string = $instr_str ? $instr_str.asString("?") : "?"
                  this.getObjects().pc_text.set({text: `PC=0x${(pc >>> 0).toString(16)} ${instr_string.trim()}`})
                  //
                  // Instruction with operand values (as in the generated VIZ).
                  //
                  let regStr = (valid, regNumSig, regSig) => {
                     return valid ? `${regNumSig.asInt(NaN)} (${toSigned32(regSig)})` : `X`
                  }
                  let srcStr = (src) => {
                     let ret = ""
                     if ('/src[src]$unconditioned_is_reg'.asBool(false)) {
                        ret += `\n      x${regStr(true, '/src[src]$unconditioned_reg', '/src[src]$unconditioned_reg_value')}`
                     }
                     return ret
                  }
                  let dest_reg_valid = '$dest_reg_valid'.asBool(false)
                  let str = `x${regStr(dest_reg_valid, '$dest_reg', '$rslt')}\n`
                  str += `  = ${'$mnemonic'.asString("?")}${srcStr(1)}${srcStr(2)}`
                  if ('$imm_valid'.asBool(false)) {
                     str += `\n      i[${toSigned32('$imm_value')}]`
                  }
                  if ('$valid_ld'.asBool(false)) {
                     str += `\n  LD @0x${('$addr'.asInt(0) >>> 0).toString(16)}`
                  }
                  if ('$valid_st'.asBool(false)) {
                     str += `\n  ST @0x${('$addr'.asInt(0) >>> 0).toString(16)}`
                  }
                  let color = second ? "#c05000" : commit ? "blue" : "gray"
                  this.getObjects().instr_text.set({text: str, fill: color})
                  //
                  // Dual-issue status line.
                  //
                  let status = ""
                  let haz = ""
                  if (second) {
                     status = `2ND ISSUE: ld return -> x${'/orig_load_inst$dest_reg'.asInt(NaN)}`
                     haz = `orig PC=0x${('/orig_load_inst$pc'.asInt(0) >>> 0).toString(16)} (group refetches)`
                  } else if (killed) {
                     status = "KILLED by slot-0 redirect"
                  } else if (replay) {
                     status = intra ? "REPLAY (intra-group hazard)" : "REPLAY (pending reg)"
                     if (intra) {
                        let r = []
                        if ('$raw_haz'.asBool(false)) r.push("RAW")
                        if ('$waw_haz'.asBool(false)) r.push("WAW")
                        if ('$mem_haz'.asBool(false)) r.push("MEM port")
                        if ('$csr_haz'.asBool(false)) r.push("CSR")
                        haz = "hazard vs slot 0: " + r.join(", ")
                     }
                  } else if (commit) {
                     status = "COMMIT ✓"
                  } else {
                     status = "bad path (no commit)"
                  }
                  this.getObjects().status_text.set({
                     text: status,
                     fill: second ? "#c05000" : killed ? "red" : replay ? "#ff8000" : commit ? "blue" : "gray"
                  })
                  this.getObjects().haz_text.set({text: haz, fill: "#804000"})
                  this.getBox().set({stroke: commit ? "#2020c0" : second ? "#c05000" : "#ff8060"})
               },

         /csr_viz
            \viz_js
               box: {
                  fill: "#2028b0",
                  width: 250,
                  height: 190,
                  strokeWidth: 0
               },
               where: {left: 697, top: 365},
               init() {
                  let csr_header = new fabric.Text("📂 CSRs (dual-commit aware)", {
                     top: 8, left: 10,
                     fill: "white",
                     fontSize: 14, fontWeight: 800, fontFamily: "monospace"
                  })
                  let cycle_box    = new fabric.Rect({top: 34 + 18 * 0, left: 10, fill: "white", width: 230, height: 14})
                  let cycle        = new fabric.Text("", {top: 34 + 18 * 0, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let cycleh_box   = new fabric.Rect({top: 34 + 18 * 1, left: 10, fill: "white", width: 230, height: 14})
                  let cycleh       = new fabric.Text("", {top: 34 + 18 * 1, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let time_box     = new fabric.Rect({top: 34 + 18 * 2, left: 10, fill: "white", width: 230, height: 14})
                  let time         = new fabric.Text("", {top: 34 + 18 * 2, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let timeh_box    = new fabric.Rect({top: 34 + 18 * 3, left: 10, fill: "white", width: 230, height: 14})
                  let timeh        = new fabric.Text("", {top: 34 + 18 * 3, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let instret_box  = new fabric.Rect({top: 34 + 18 * 4, left: 10, fill: "white", width: 230, height: 14})
                  let instret      = new fabric.Text("", {top: 34 + 18 * 4, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let instreth_box = new fabric.Rect({top: 34 + 18 * 5, left: 10, fill: "white", width: 230, height: 14})
                  let instreth     = new fabric.Text("", {top: 34 + 18 * 5, left: 16, fontSize: 12, fontFamily: "monospace"})
                  let ipc          = new fabric.Text("", {top: 34 + 18 * 6 + 4, left: 16, fontSize: 13, fontWeight: 800, fontFamily: "monospace", fill: "yellow"})
                  return {csr_header, cycle_box, cycle, cycleh_box, cycleh, time_box, time, timeh_box, timeh, instret_box, instret, instreth_box, instreth, ipc}
               },
               render() {
                  let commits = ('|fetch/instr[0]$commit'.asBool(false) ? 1 : 0) + ('|fetch/instr[1]$commit'.asBool(false) ? 1 : 0)
                  let cyc = '|fetch$csr_cycle'.step(1).asInt(NaN)
                  let ins = '|fetch$csr_instret'.step(1).asInt(NaN)
                  this.getInitObject("cycle").set({text: "cycle   : " + cyc})
                  this.getInitObject("cycleh").set({text: "cycleh  : " + '|fetch$csr_cycleh'.step(1).asInt(NaN)})
                  this.getInitObject("time").set({text: "time    : " + '|fetch$csr_time'.step(1).asInt(NaN)})
                  this.getInitObject("timeh").set({text: "timeh   : " + '|fetch$csr_timeh'.step(1).asInt(NaN)})
                  this.getInitObject("instret").set({
                     text: "instret : " + ins + (commits > 0 ? ` (+${commits})` : ""),
                     fill: commits == 2 ? "blue" : "black"
                  })
                  this.getInitObject("instreth").set({text: "instreth: " + '|fetch$csr_instreth'.step(1).asInt(NaN)})
                  this.getInitObject("ipc").set({text: "IPC so far: " + ((cyc > 0) ? (ins / cyc).toFixed(2) : "-")})
               },

         /regs[31:1]
            \viz_js
               all: {
                  box: {
                     fill: "#2028b0",
                     width: 170,
                     height: 650,
                     stroke: "black",
                     strokeWidth: 0
                  },
                  init() {
                     let rf_header = new fabric.Text("📂 Int RF", {
                        top: 10,
                        left: 10,
                        fontSize: 18,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "white"
                     })
                     let rf_header2 = new fabric.Text("wr: s0=cyan s1=grn 2nd=org", {
                        top: 40,
                        left: 12,
                        fontSize: 10,
                        fontFamily: "monospace",
                        fill: "white"
                     })
                     return {rf_header, rf_header2}
                  },
               },
               where: {left: 955, top: 10},
               where0: {left: 10, top: 80},
               box: {
                     fill: "white",
                     width: 150,
                     height: 14,
                     strokeWidth: 0
                  },
               layout: {top: 17}, //vertically
               init() {
                  let reg = new fabric.Text("", {
                     left: 10,
                     fontSize: 14,
                     fontFamily: "monospace"
                  })
                  return {reg}
               },
               render() {
                  let abi = ["zero", "ra", "sp", "gp", "tp", "t0", "t1", "t2", "fp", "s1", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"]
                  // Two write ports: $wr0/$wr1 are local per-register signals of the shared RF.
                  let wr0 = '$wr0'.asBool(false)
                  let wr1 = '$wr1'.asBool(false)
                  let mod = wr0 || wr1
                  let second = wr0 && '|fetch/instr[0]$second_issue'.asBool(false)
                  // Four read ports (2 srcs x 2 slots).
                  let read_valid =
                     ('|fetch/instr[0]/src[1]$unconditioned_is_reg'.asBool(false) && parseInt(this.getIndex()) === '|fetch/instr[0]/src[1]$unconditioned_reg'.asInt(-1)) ||
                     ('|fetch/instr[0]/src[2]$unconditioned_is_reg'.asBool(false) && parseInt(this.getIndex()) === '|fetch/instr[0]/src[2]$unconditioned_reg'.asInt(-1)) ||
                     ('|fetch/instr[1]/src[1]$unconditioned_is_reg'.asBool(false) && parseInt(this.getIndex()) === '|fetch/instr[1]/src[1]$unconditioned_reg'.asInt(-1)) ||
                     ('|fetch/instr[1]/src[2]$unconditioned_is_reg'.asBool(false) && parseInt(this.getIndex()) === '|fetch/instr[1]/src[2]$unconditioned_reg'.asInt(-1))
                  let pending = '<<1$pending'.asBool(false)
                  // Construct string for register value (including reg index, ABI name, and previous value).
                  let reg = parseInt(this.getIndex())
                  const maxStrLen = 15
                  let regStr = '$value'.step(1).asInt(NaN).toString(16)
                  if (mod) {
                     regStr = `${'$value'.asInt(NaN).toString(16)}->` + regStr;
                  }
                  let regIdent = reg.toString().padStart(2, " ") + "|" + abi[reg] + ":"
                  regStr = regIdent.padEnd(maxStrLen - regStr.length, " ") + regStr
                  if (regStr.length > maxStrLen) {
                     regStr = "…" + regStr.substr(regStr.length - maxStrLen + 1)
                  }
                  this.getObjects().reg.set({text: regStr})
                  this.getObjects().reg.set({fill: pending ? "darkorange" : mod ? "blue" : "black"})
                  this.getBox().set({fill: second ? "#ffd0b0" : wr1 ? "#b0ffb0" : wr0 ? "#b0ffff" : read_valid ? "#d0e8ff" : "white"})
               },

         /mem[31:0]
            \viz_js
               all: {
                  box: {
                     fill: "#208028",
                     width: 190,
                     height: 650,
                     stroke: "black",
                     strokeWidth: 0
                  },
                  init() {
                     let dmem_header = new fabric.Text("🗃️ DMem (hex)", {
                        top: 10,
                        left: 10,
                        fontSize: 20,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "white"
                     })
                     return {dmem_header}
                  },
               },
               where: {left: 1155, top: 10},
               where0: {left: 10, top: 80},
               box: {
                     fill: "white",
                     width: 40,
                     height: 14,
                     strokeWidth: 0
                  },
               layout: {top: 17}, //vertically
               init() {
                  let index =
                     new fabric.Text(parseInt(this.getIndex()).toString() + ":", {
                        left: 10,
                        fontSize: 14,
                        fontFamily: "monospace"
                     })
                  return {index}
               },
               renderFill() {
                  // Highlight the (single) memory access of the group, via the shared DMem port.
                  let st = '|fetch$dm_valid_st'.asBool(false)
                  let ld = '|fetch/instr[0]$valid_ld'.asBool(false) || '|fetch/instr[1]$valid_ld'.asBool(false)
                  let addr = '|fetch$dm_addr'.asInt(-1) >> 2
                  return ((st || ld) && (addr === parseInt(this.getIndex()))) ? (st ? "#b0ffff" : "#ffe0b0") : "white"
               },

         /bank[3:0]
            \viz_js
               box: {strokeWidth: 0},
               all: {
                  box: {
                        width: 190,
                        height: 650,
                        stroke: "black",
                        strokeWidth: 0
                       },
                  init() {
                     let bankname = new fabric.Text("bank", {
                        top: 40,
                        left: 100,
                        fontSize: 14,
                        fontWeight: 800,
                        fontFamily: "monospace",
                        fill: "black"
                     })
                     return {bankname}
                  }
               },
               where: {left: 1155, top: 10},
               where0: {left: 150, top: 60},
               layout: {left: -30},
               init() {
                  let banknum = new fabric.Text(String(this.scopes.bank.index), {
                     top: -19,
                     left: 10,
                     fontSize: 14,
                     fontWeight: 800,
                     fontFamily: "monospace",
                     fill: "black"
                  })
                  return {banknum}
               },
            /mem[31:0]
               \viz_js
                  box: {
                        fill: "white",
                        width: 30,
                        height: 16,
                        stroke: "#208028",
                        strokeWidth: 0.75
                       },
                  layout: {top: 17},
                  init() {
                     let data = new fabric.Text("", {
                        top: 2,
                        left: 6,
                        fontSize: 14,
                        fontFamily: "monospace"
                     })
                     return {data}
                  },
                  render() {
                     // Byte written this cycle (shared port; selects which bank to write on).
                     let mod = ('|fetch$dm_valid_st'.asBool(false)) && ((('|fetch$dm_st_mask'.asInt(-1) >> this.scopes.bank.index) & 1) == 1) && ('|fetch$dm_addr'.asInt(-1) >> 2 == this.getIndex())
                     let ld = ('|fetch$dm_spec_ld'.asBool(false)) && ('|fetch$dm_addr'.asInt(-1) >> 2 == this.getIndex())
                     this.getInitObject("data").set({text: '$Value'.step(1).asInt(NaN).toString(16).padStart(2,"0")})
                     this.getInitObject("data").set({fill: mod ? "blue" : ld ? "#a06000" : "black"})
                  },

\SV
   endmodule