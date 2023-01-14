clc; clear;

% The winner is determined by the following rules:
% 1. Rock beats scissors; % 2. Scissors beats paper; % 3. Paper beats rock;
% 4. If both players make the same move, then game is a draw.
% Rock = R; % Paper = P; % Scissors = S; % R=1; % P=2; % S=3

n = 1; %Start with game 1
p_win = 0; % Player Wins
c_win = 0; % Computer Wins

% Loop to get atleast 3 games with results
while (n < 6)
    fprintf('\nLet us start the Game #%d \n', n);
    n = n+1; % Increase the game number
    pause(2.5);
    input = 1; % Loop for getting input repeatatively unless proper input is received.
    while input == 1
        close all; % Close all figures if open
        % Question Dialog with 3 inputs of Rock, Paper and Scissor
        p_move = questdlg('Make your move','Rock Paper Scissor','Rock','Paper','Scissor','Rock');
        %questdlg command for asking whether to continue or stop the process%
        % Switch case based on player move
        switch p_move
            case 'Rock' %For Rock Selection
                % Read Rock Image to player image and show it in subplot
                pl_img = imread('R1.jpg');
                subplot(1,2,1); imshow(pl_img);
                title('Player chose Rock');
                input=0;
            case 'Paper' % For Paper Selection
                % Read Paper Image to player image and show it in subplot
                pl_img = imread('P1.jpg');
                subplot(1,2,1); imshow(pl_img);
                title('Player chose Paper');
                input=0;
            case 'Scissor'% For Scissor Selection
                % Read Scissor Image to player image and show it in subplot
                pl_img = imread('S1.jpg');
                subplot(1,2,1); imshow(pl_img);
                title('Player chose Scissors');
                input=0;
            otherwise %otherwise take input again in the loop
                disp('Invalid. Choose properly!');
        end
    end
    pause(2.5); % Use Pause for giving time to random number generation
    pause on;
    c_move = randi(3); % Randomly generate Computer Move and based
    % on the move load Computer Image and show it in the subplot
    if c_move == 1
        co_img = imread('R1.jpg');
        subplot(1,2,2); imshow(co_img);
        title('Computer chose Rock')
    elseif c_move == 2
        co_img = imread('P1.jpg');
        subplot(1,2,2); imshow(co_img);
        title('Computer chose Paper')
    elseif c_move == 3
        co_img = imread('S1.jpg');
        subplot(1,2,2); imshow(co_img);
        title('Computer chose Scissors')
    end
    pause(2.5);
    %% Rules for Rock Paper Scissors
    % 1. Rock beats scissors
    % 1a: Rock vs 3
    if strcmp(p_move,'Rock') && c_move == 3
        fprintf('Yaaay!!. You Won!\n');
        p_win = p_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        % 1b: 1 vs Scissor
    elseif c_move == 1 && strcmp(p_move,'Scissor')
        fprintf('Oops. You Lost :(\n');
        c_win = c_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        
        % 2.Scissors beats paper
        % 2a: Scissor vs 2
    elseif strcmp(p_move,'Scissor') && c_move == 2
        fprintf('Yaaayy!. You Won!\n');
        p_win = p_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        
        % 2b: 3 vs Paper
    elseif c_move == 3 && strcmp(p_move,'Paper')
        fprintf('Oops. You Lost :(\n');
        c_win = c_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        
        % 3. Paper beats rock
        % 3a: Paper vs 1
    elseif strcmp(p_move,'Paper') && c_move == 1
        fprintf('Kudos. You Won!\n');
        p_win = p_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        
        % 3b: 2 vs Rock
    elseif c_move == 2 && strcmp(p_move,'Rock')
        fprintf('Oops. You Lost :(\n');
        c_win = c_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        %.4 if both players make the same move, then game is a draw
        
    else % Else Game is Draw
        fprintf('The Game is draw!\n')
        h = msgbox('The Game is Draw','Draw');
        n = n-1; % Replay the current Game
    end
    pause(2.5); % Pause to show the winner
    delete(h); % Close the message box
end
% Display who is the final winner in set of games
if p_win > c_win
    fprintf('\n\n\nYou are our ultimate winner.\n\n\n');
else
    fprintf('\n\n\nYou lost the game against computer.\n\n\n');
end
