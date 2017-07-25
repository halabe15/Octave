% Problem Solving with Programming
% Second Partial Evaluation
%
% Olimpic Modern Pentathlon
% Program to determine the winner of the pentathlon competition
% There are 4 events (the fourth combines running and shooting)
% Athletes receive points for each event, in the end, the athlete with
%  the most points is the winner
%
% Questions:
% 1. Create the function 'ComputeTotalPoints'
%   RECEIVE: the matrix with the points for all athletes
%   RETURN: a new vector (one dimensional matrix), with the total points
%     for each competitor
%   The function must create the new vector, and fill the data with the total
%   points obtained by each athlete
%
% 2. Create the function 'DetermineWinner'
%   RECEIVE: the vector with the total points
%   RETURNS: the index of the winner, based on the order in the athletes vector
%   The function will go over the vector of the points, determine who got the
%   highest score, print the name and country of the winner.
%
% HINTS:
% - Write your name in comments inside each of the files you create
% - Upload only the new files you create with your functions
% - Read all of the existing code before answering anything. This will help you
%    understand what needs to be done and how to do it
% - Keep calm. Think what you have to do before typing code
% - Write clean code and use correct indentation
% - Add comments to your code


% Call the function provided with the matrices that have the data
% Receive those same matrices here to use in your functions
% [athletes, points] = GetData();

% Get the total score for all the athletes
% total_points = ComputeTotalPoints(points);

% Display the name and country of the winner
% winner_index = DetermineWinner(total_points);

% Print the data for the corresponding athlete


% Function to provide the data obtained from the competition
% It generates two matrices, one filled with then text data, and another with
% the numerical data for the points.
% The indices of both matrices correspond to each other, so the first athlete
% has the first set of points, and so on.
%
% Gilberto Echeverria
% gilecheverria@yahoo.com
% 26/10/2016

function [athletes, points] = GetData()

  % Matrix with the data for all athletes
  % The order in this matrix is the same as in the 'points' matrix
  athletes = [
  'CZE', 'SVOBODA David';
  'HUN', 'MAROSI Adam';
  'ARG', 'ZAPATA Emmanuel';
  'BRA', 'NASCIMENTO Felipe';
  'MEX', 'HERNANDEZ USCANGA Ismael Marcelo';
  'EGY', 'ELGEZIRY Omar';
  'EGY', 'ELGEZIRY Amro';
  'ITA', 'PETRONI Pier Paolo';
  'UKR', 'FEDECHKO Andriy';
  'POL', 'STASKIEWICZ Szymon';
  'UKR', 'TYMOSHCHENKO Pavlo';
  'CUB', 'FIGUEROA Jose Ricardo';
  'KOR', 'JUNG Jinhwa';
  'IRL', 'LANIGAN-O-KEEFFE Arthur';
  'HUN', 'DEMETER Bence';
  'GBR', 'COOKE James';
  'BUL', 'KRASTANOV Dimitar';
  'KOR', 'JUN Woongtae';
  'RUS', 'LESUN Alexander';
  'LTU', 'KINDERIS Justinas';
  ];

  % Matrix with the points obtained by each athlete in the four competitions
  % swimming, fencing, riding, running/shooting
  points = [
  324, 226, 282, 620;
  335, 196, 293, 621;
  320, 166, 277, 577;
  324, 155, 251, 565;
  334, 208, 300, 626;
  330, 239, 265, 569;
  353, 208, 291, 541;
  324, 179, 293, 601;
  324, 198, 275, 593;
  310, 227, 258, 595;
  324, 227, 286, 635;
  294, 156, 233, 531;
  338, 203, 283, 619;
  331, 198, 300, 628;
  329, 217, 265, 619;
  354, 185, 288, 609;
  326, 215, 0, 638;
  338, 178, 272, 638;
  324, 268, 279, 608;
  320, 211, 0, 613;
  ];

  total_points = ComputeTotalPoints(points);
  winner_index = DetermineWinner(total_points);

  fprintf('The winner is %s\n', athletes(winner_index, 4:end));
  fprintf(' from %s with %d points\n', athletes(winner_index, 1:3), total_points(winner_index));
end

function total_points = ComputeTotalPoints(points)
  [r, c] = size(points);
  total_points(r) = 0;
  for i=1:r
    acum = 0;
    for j=1:c
      acum += points(i,j);
    end
    total_points(i) = acum;
  end
end

function winner_index = DetermineWinner(total_points)
  size = length(total_points);
  winner_index = 1;
  for i=1:size
    if (total_points(i) > total_points(winner_index))
      winner_index = i;
    end
  end
end
