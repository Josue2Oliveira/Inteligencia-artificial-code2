% Universidade Federal de Mato Grosso
% Instituto de Engenharia
% Inteligência Artificial - 2016/2
%
% Função Octave/MATLAB que implementa 
%
% author: raonifst at gmail dot com

function [ score ] = eval_game( Board, depth,  player)
       score=0;
       seq2 = find_streak(Board,player,2);
       score = score + 10*seq2;
       opo_seq2 = find_streak(Board,opposite_player(player),2);
       score = score - 10*opo_seq2;
       seq3 = find_streak(Board, player,3);
       score = score + 100*seq3;
       opo_seq3 = find_streak(Board,opposite_player(player),3);
       score = score - 100*opo_seq3;
       seq4 = find_streak(Board, player,4);
       score = score + 1000000*seq4;
       opo_seq4 = find_streak(Board,opposite_player(player),4);
       score = score - 1000000*opo_seq4;
       seq = (find_streak(Board, player,1)/4);
       score = score + seq;
       seq = (find_streak(Board, opposite_player(player),1)/4);
       score = score - seq;
       first = Board(6, 4) == player;
       score = score + 100*first;
       firstm = Board(6, 4) == opposite_player(player);
       score = score - 100*firstm;   
end