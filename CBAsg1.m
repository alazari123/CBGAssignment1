clear; clc;
EGFREdges = readtable('EGFR1-edges.txt');
%referenced following mathworks link
%https://www.mathworks.com/help/matlab/ref/readtable.html
EGFRNodes = readtable("EGFR1-nodes.txt"); 
TGFEdges = readtable("TGF_beta_Receptor-edges.txt"); 
TGFNodes = readtable("TGF_beta_Receptor-nodes.txt");
TNFEdges = readtable("TNFalpha-edges.txt"); 
TNFNodes = readtable("TNFalpha-nodes.txt"); 
WNTEdges = readtable("Wnt-edges.txt"); 
WNTNodes = readtable("Wnt-nodes.txt");

%EGFRGraph = digraph;
EGFRMatrix = zeros(232);
%TGFGraph = digraph;
TGFMatrix = zeros(210);
%TNFGraph = digraph;
TNFMatrix = zeros(239);
%WNTGraph = digraph;
WNTMatrix = zeros(107);
physicalEdge = WNTEdges{1,6};
receptor = EGFRNodes{47,2};
tFactor = EGFRNodes{7,2};

EGFRRec = [];
EGFRRecPlace =[];
EGFRTF = [];
EGFRTFPlace = [];

for i = 1:max(size(EGFREdges))
    tail = EGFREdges{i, 1};
    head = EGFREdges{i, 2}; 
    weight = EGFREdges{i, 3};
    type = EGFREdges{i,6};
    aTail = 0;
    aHead = 0;
    for j = 1:max(size(EGFRNodes))
        if isequal(EGFRNodes{j, 1}, tail)
            aTail = j;
        end
        if isequal(EGFRNodes{j, 1}, head)
            aHead = j;
        end
%         if isequal(EGFRNodes{j, 2}, receptor)
%             EGFRRec(end+1) = EGFRNodes{j, 2};
%             EGFRRecPlace(end+1) = j;
%         end
%         if isequal(EGFRNodes{j, 2}, tFactor)
%             EGFRTF(end+1) = EGFRNodes{j, 2};
%             EGFRTFPlace(end+1) = j;
%         end
        if aTail ~= 0 && aHead ~= 0
            %following fixes Piazza comment
            if EGFRMatrix(aHead, aTail) ~= 0 || EGFRMatrix(aTail, aHead) ~= 0 
               break;
            end
            if isequal(type, physicalEdge) 
                EGFRMatrix(aHead, aTail) = weight;
                EGFRMatrix(aTail, aHead) = weight;
            else
                EGFRMatrix(aTail, aHead) = weight;
            end
            break;
        end
    end
end
EGFRGraph = digraph(EGFRMatrix);

TGFRec = [];
TGFRecPlace = [];
TGFTF = [];
TGFTFPlace = [];
for i = 1:max(size(TGFEdges))
    tail = TGFEdges{i, 1};
    head = TGFEdges{i, 2}; 
    weight = TGFEdges{i, 3};
    type = TGFEdges{i,6};
    aTail = 0;
    aHead = 0;
    for j = 1:max(size(TGFNodes))
        if isequal(TGFNodes{j, 1}, tail)
            aTail = j;
        end
        if isequal(TGFNodes{j, 1}, head)
            aHead = j;
        end
%         if isequal(TGFNodes{j, 2}, receptor)
%             TGFRec(end+1) = TGFNodes{j, 2};
%             TGFRecPlace(end+1) = j;
%         end
%         if isequal(TGFNodes{j, 2}, tFactor)
%             TGFTF(end+1) = TGFNodes{j, 2};
%             TGFTFPlace = j;
%         end
        if aTail ~= 0 && aHead ~= 0
            %following fixes Piazza comment
            if TGFMatrix(aHead, aTail) ~= 0 || TGFMatrix(aTail, aHead) ~= 0 
               break;
            end
            if isequal(type, physicalEdge) 
                TGFMatrix(aHead, aTail) = weight;
                TGFMatrix(aTail, aHead) = weight;
            else
                TGFMatrix(aTail, aHead) = weight;
            end
            break;
        end
    end
end
TGFGraph = digraph(TGFMatrix);

TNFRec = [];
TNFRecPlace = [];
TNFTF = [];
TNFTFPlace = [];
for i = 1:max(size(TNFEdges))
    tail = TNFEdges{i, 1};
    head = TNFEdges{i, 2}; 
    weight = TNFEdges{i, 3};
    type = TNFEdges{i,6};
    aTail = 0;
    aHead = 0;
    for j = 1:max(size(TNFNodes))
        if isequal(TNFNodes{j, 1}, tail)
            aTail = j;
        end
        if isequal(TNFNodes{j, 1}, head)
            aHead = j;
        end
%         if isequal(TNFNodes{j, 2}, receptor)
%             TNFRec(end+1) = TNFNodes{j, 2};
%             TNFRecPlace(end+1) = j;
%         end
%         if isequal(TNFNodes{j, 2}, tFactor)
%             TNFTF(end+1) = TNFNodes{j, 2};
%             TNFTFPlace(end+1);
%         end
        if aTail ~= 0 && aHead ~= 0
            %following fixes Piazza comment
            if TNFMatrix(aHead, aTail) ~= 0 || TNFMatrix(aTail, aHead) ~= 0 
               break;
            end
            if isequal(type, physicalEdge) 
                TNFMatrix(aHead, aTail) = weight;
                TNFMatrix(aTail, aHead) = weight;
            else
                TNFMatrix(aTail, aHead) = weight;
            end
            break;
        end
    end
end
TNFGraph = digraph(TNFMatrix);

WNTRec = [];
WNTRecPlace = [];
WNTTF = [];
WNTTFPlace = [];
for i = 1:max(size(WNTEdges))
    tail = WNTEdges{i, 1};
    head = WNTEdges{i, 2}; 
    weight = WNTEdges{i, 3};
    type = WNTEdges{i,6};
    aTail = 0;
    aHead = 0;
    for j = 1:max(size(WNTNodes))
        if isequal(WNTNodes{j, 1}, tail)
            aTail = j;
        end
        if isequal(WNTNodes{j, 1}, head)
            aHead = j;
        end
%         if isequal(WNTNodes{j, 2}, receptor)
%             WNTRec(end+1) = WNTNodes{j, 2};
%             WNTRecPlace(end+1) = j;
%         end
%         if isequal(WNTNodes{j, 2}, tFactor)
%             WNTTF(end+1) = WNTNodes{j, 2};
%             WNTTFPlace(end+1) = j;
%         end
        if aTail ~= 0 && aHead ~= 0
            %following fixes Piazza comment
            if WNTMatrix(aHead, aTail) ~= 0 || WNTMatrix(aTail, aHead) ~= 0 
               break;
            end
            if isequal(type, physicalEdge) 
                WNTMatrix(aHead, aTail) = weight;
                WNTMatrix(aTail, aHead) = weight;
            else
                WNTMatrix(aTail, aHead) = weight;
            end
            break;
        end
    end
end
WNTGraph = digraph(WNTMatrix);

EGFR20 = readtable("EGFR1-k_20000-ranked-edges.txt");
TGF20 = readtable("TGF_beta_Receptor-k_20000-ranked-edges.txt");
TNF20 = readtable("TNFalpha-k_20000-ranked-edges.txt");
WNT20 = readtable("Wnt-k_20000-ranked-edges.txt");

% currEGFRRank = 0;
% pEGFR = [];
% rEGFR = [];
% for k = 1:max(size(WNTEdges))
%     newRank = EGFR20{k, 3};
%     if newRank > currEGFRrank
%         currEGFRrank = newRank;
%         inPath = contains(EGFR20{k, 1}, EGFRTF);
%         if inPath
%             for l = 1:max(size(EGFRRec))
%                 if isequal(EGFRRec{l,1}, EGFR20{k, 1})
%                     break;
%             end
%             pEGFR(end+1) = newRank / EGFRRecPlace{l,1};
%         end
%     end
% end