function [ count ] = find_first_streak(Board, player)
  count = 0;
        row = 6;
        for i=3:5            
                if Board(row, i) == player
                    count = count + 1*i;
                end
        end
end