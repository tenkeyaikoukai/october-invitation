 
initmsg :: Int -> String
initmsg 1 = "you are at the entrance of ruined town"
initmsg 2 = "you are in the front of bar"
initmsg 3 = "you are in the bar"
initmsg 4 = "you are in the cemetary"
initmsg 5 = "you are on the front of the gate" 
initmsg 6 = "you are at the entrance of the castle"
initmsg 7 = "you are in the castle corridor"
initmsg 8 = "you are in the castle corridor"
initmsg 9 = "you are on the collossal hall"
initmsg 10 = "you are on the royal room"
initmsg x = "" 

scenemsg :: Int -> Int -> String
scenemsg 3 0 ="clark frowned."
scenemsg 3 1 = "clark frowned."
scenemsg 3 2 = "clark smiled."
scenemsg 3 3 = "clark smiled." 
scenemsg 4 0 = "a lady lie down on the ground."
scenemsg 4 2 = "a lady lie down on the ground."
scenemsg 4 1 = "quiet cemetary."
scenemsg 4 3 = "quiet cemetary."
scenemsg 5 x ="a guard stands in front on the gate."
scenemsg 6 x = "corridor leads into castle."
scenemsg 7 x = "slope leads into castle."
scenemsg 8 x = "twisted corridor leads into castle."
scenemsg 9 4 = "there is a bottle."
scenemsg 9 5 = "empty hall."
scenemsg 10 x = "there is the evening lord. <will you be my cohort?>" 
scenemsg x y = ""

choice :: Int -> Int -> String
choice 1 x = "1-go right 2-go left 3 -go forward"
choice 2 x = "1-enter the bar 2-go back"
choice 3 x = "1-look 2-talk clark 3-go back"
choice 4 0 = "1-help lady 2-go back"
choice 4 2 = "1-help lady 2-go back"
choice 4 1 = "1-go back"
choice 4 3 = "1-go back"
choice 5 x = "1-go forward 2-go back"
choice 6 x = "1-go right 2-go left"
choice 7 x = "1-go right 2-go left"
choice 8 x = "1-go right 2-go left"
choice 9 4 = "1-go forward"
choice 9 x = "1-go forward 2-drink a bottle"
choice 10 x = "1-look 2-obey him 3-reject him"
choice x y = ""

cmdexe :: Int -> Int -> String -> Int
cmdexe 1 x "1" = 4
cmdexe 1 x "2" = 2 
cmdexe 1 x "3" = 5
cmdexe 2 x "1" = 3
cmdexe 2 x "2" = 1
cmdexe 3 x "3" = 2
cmdexe 4 0 "2" = 1
cmdexe 4 2 "2" = 1
cmdexe 4 1 "1" = 1
cmdexe 4 3 "1" = 1
cmdexe 5 0 "1" = 5
cmdexe 5 1 "1" = 5
cmdexe 5 x "1" = 6
cmdexe 5 x "2" = 1 
cmdexe 6 x "1" = 7
cmdexe 6 x "2" = 0
cmdexe 7 x "1" = 8
cmdexe 7 x "2" = 0
cmdexe 8 x "2" = 9
cmdexe 8 x "1" = 0
cmdexe 9 x "1" = 10
cmdexe 10 x "2" = 0
cmdexe 10 x "3" = 0
cmdexe x y z = x

flagchange :: Int -> Int -> String -> Int
flagchange 4 0 "1" = 1 
flagchange 4 2 "1" = 3
flagchange 3 0 "2" = 2
flagchange 3 1 "2" = 3
flagchange 9 x "2" = 4
flagchange x y z = y

cmdmsg :: Int -> Int -> String -> String
cmdmsg 1 x "1" = "you go right."
cmdmsg 1 x "2" = "you go left."
cmdmsg 1 x "3" = "you go forward."
cmdmsg 2 x "1" = "you enter the bar."
cmdmsg 2 x "2" = "you go back."
cmdmsg 3 x "1" = "old cleak."
cmdmsg 3 0 "2" = "my lighter can avoid guard. please take it."
cmdmsg 3 1 "2" = "my lighter can avoid guard. please take it."
cmdmsg 3 x "2" = "good luck."
cmdmsg 3 x "3" = "you go back."
cmdmsg 4 0 "1" = "thank you. you should go right-right-left in castle."
cmdmsg 4 2 "1" = "thank you. you should go right-right-left in castle."
cmdmsg 4 x "1" = "you go back."
cmdmsg 4 0 "2" = "you go back."
cmdmsg 4 2 "2" = "you go back."
cmdmsg 5 0 "1" = "the guard interupted."
cmdmsg 5 1 "1" = "the guard interupted."
cmdmsg 5 x "1" = "you enter the gate with avoiding guard with lighter."
cmdmsg 5 x "2" = "you go back."
cmdmsg 6 x "1" = "you go into the castle."
cmdmsg 6 x "2" = "you trapped!"
cmdmsg 7 x "1" = "you go into the castle."
cmdmsg 7 x "2" = "you trapped!"
cmdmsg 8 x "1" = "you trapped!"
cmdmsg 8 x "2" = "you go into the castle."
cmdmsg 9 x "1" = "you go into the castle."
cmdmsg 9 4 "2" = "Invarid input"
cmdmsg 9 x "2" = "you drink the bottle."
cmdmsg 10 x "1" = "devilish middle aged man."
cmdmsg 10 x "2" = "the world covered by darkness.."
cmdmsg 10 4 "3" = "you defeat the evening lord!\nyou save the world!"
cmdmsg 10 x "3" = "you lose the fight and the world covered by darkness.."

cmdmsg x y z = "Invarid input"

routine :: Int -> Int -> IO()
routine pl flag = 
    if pl>0 then do
        putStrLn $ initmsg pl 
        putStrLn $ scenemsg pl flag
        putStrLn $ choice pl flag 
        inp <- getLine
        putStrLn (cmdmsg pl flag inp)
        routine (cmdexe pl flag inp) (flagchange pl flag inp)
    else
        putStrLn "game over" 

main=do
    putStrLn "october invitation haskell version"
    putStrLn "2018 tenkey aikoukai"
    routine 1 0

