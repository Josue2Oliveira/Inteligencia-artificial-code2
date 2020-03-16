function [ best_val, best_pos ] = minimax_alpha_beta( Board, depth, player, alpha, beta, control )  
	
	debug=0;

	i = 1;
	best_val = nan;
	best_pos = 0;

	
   if is_terminal(Board, depth),
		best_val =  eval_game(Board, depth, player);
   else
    if control,
        val = -inf; 
        while (i<8),
          [new_board, valid] = do_move( Board, i, player);
          if valid == 1,
            [val, ~] = max(val, minimax_alpha_beta(new_board, depth-1, player, alpha, beta, 0));
             if isnan(best_val) || val > best_val,
                      best_val = val;
                      best_pos = i;
             end
             if val >= beta
               break;
             end
             
             alpha = max(alpha, val);   
          endif
        i = i + 1;
        end
     else
        val = +inf;
        while (i<8)
        [new_board, valid] = do_move( Board, i, opposite_player(player));
          if valid == 1,
            [val, ~] = min(val, minimax_alpha_beta(new_board, depth-1, player, alpha, beta, 1));
             if isnan(best_val) || val < best_val,
                      best_val = val;
                      best_pos = i;
             end
             if val <= alpha
               break;
             end
             beta = min(beta, val);
          endif
          i = i + 1;
        end 
  end
end