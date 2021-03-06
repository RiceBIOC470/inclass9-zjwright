% Inclass assignment 9

% The accession number for human NOTCH1 mRNA is AF308602
% 1. Read the information from this entry into matlab
% 2. Write code that runs a blast query on the first 500 base pairs of this
% gene against the refseq_rna database
% 3. Find the three highest scoring hits from other species and identify
% the length of the alignment and fraction of matches/mismatches. 
% 4. Run the same query against the database est_human. Comment on the
% sequences that you find. 

%1
notch1_data=getgenbank('AF308602');
%2
notch_blast_seq=notch1_data.Sequence(1:500);
[request_id, request_time]=blastncbi(notch_blast_seq, 'blastn', 'Database', 'refseq_rna');
blast_results=getblast(request_id, 'WaitTime', request_time);
%3 
%three highest non-human hits are 2-Pan troglodytes (31/36=86% match), Rhinopithecus
%bieti (27/28=96% match), and Cercocebus atys (31/36=86% match). 
%4
notch_blast_human_seq=notch1_data.Sequence(1:500);
[request_id, request_time]=blastncbi(notch_blast_human_seq, 'blastn', 'Database', 'est_human');
hs_blast_results=getblast(request_id, 'WaitTime', request_time);
%returns several different sources of human mRNA