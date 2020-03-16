Board = zeros(6,7); % Create a new Connect Four Board

computer = 1; % computer's player id 
depth  = 3;  %5 - hard; 3 - medium; 1 - easy

player = 2;
over = 0;

while over == 0,
    
    if player == computer,
        
        fprintf('Computer\n');
        
       [ ~, best_pos ] = minimax_alpha_beta(Board, depth, player, -inf, +inf, 1);

        [Board, ~ ] = do_move(Board, best_pos, player); 
        
    else
        % human player
        
        valid_move = 0;
        while valid_move == 0, % repeat until read a valid move
            
            [ ~, best_pos ] = minimax_alpha_beta(Board, depth, player, -inf, +inf, 1);
            [Board, ~ ] = do_move(Board, best_pos, player)
        end
    disp(Board);

    end
    
     % show move
    
    over = is_game_over(Board);
    player = opposite_player(player);
end

fprintf('********************\nFinish!\n');
if over == 3, 
    fprintf('Tie!\n');
else
    if over == computer,
        fprintf('You loose!\n');
    else
        fprintf('You win!\n');
    end
end
