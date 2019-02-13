# Gina Yang
# QBIO 499
# 16 January 2019

import random
# Global variable for stop codons
STOP = ["TAA", "TAG", "TGA"]

# the input of this function is a string starting with "ATG"
# the output is the position of the first in-frame stop codon,
# if there is no in-frame stop codon the output is -1
def getstop(seq):
    """Gets the position of the first in-frame stop codon"""
    pos = 0
    stop = -1  # Output - initialise as -1
    while pos + 3 <= len(seq):
        if seq[pos:pos + 3] in STOP:  # Read by frame; if true, stop codon found
            stop = pos  # Set stop position
            break
        pos += 3
    return stop

# the input of this function is a string (which might NOT start with "ATG")
# the output is a list of lists [[start1,stop1],[start2,stop2],...]
# where [starti,stopi] are the start and stop positions of the ith ORF
def getallORFcoords(seq):
    """Gets a list of the stop and start codons of ORFs found"""
    curr_pos = 0
    coords = []
    while seq.find("ATG", curr_pos) != -1:
        pos_list = []
        start_pos = seq.find("ATG", curr_pos)
        end_pos = start_pos + getstop(seq[start_pos:])
        curr_pos += 1
        if curr_pos + 1 > len(seq):  # reached the end of the sequence
            break
        if end_pos - start_pos == -1:  # no in frame stop codon; move on
            continue
        pos_list.append(start_pos)
        pos_list.append(end_pos + 3)  # +3 to include the stop codon
        if pos_list not in coords:
            coords.append(pos_list)
    return coords

# the input of this function is the output from the getallORFcoords function
# the output is the length of the longest ORF
def getlong(coords):
    """Returns length of the longest ORF"""
    length_diff = 0
    for pair in coords:
        if length_diff < pair[1] - pair[0]:
            length_diff = pair[1] - pair[0]
    return length_diff

# write a function getthresh(seq,nsim)
# two inputs: a string and the number of random shuffle simulations
# for each random shuffle simulation use the getlong function to find the longest ORF
# the output will be the longest ORF in all of the random shuffle simulations
def getthresh(seq, nsim):
    """Returns the threshold--the longest ORF in all random nucleotide shuffle simulations"""
    max_diff = 0
    for i in range(0, nsim):
        shuffled_seq = shuffleseq(seq)
        coords = getallORFcoords(shuffled_seq)
        diff = getlong(coords)
        if max_diff < diff:
            max_diff = diff
    return max_diff

# two inputs: a string and a threshold
# the output is similar to that for all getallORFcoords
# except only those ORFs longer than th are included
def getlongORFcoords(seq, th):
    """Returns only the ORFs longer than threshold"""
    coords = getallORFcoords(seq)
    for pair in coords:
        if pair[1] - pair[0] < th:
            coords.remove(pair)
    return coords

# two inputs: a string and a threshold
# for each ORF longer than th print: starting position, ending position, strand 
# information (+1 forward, -1 reverse complement), and sequence
def printORF2d(seq, th):
    """Prints out info about each ORF longer than threshold found"""
    coords = getlongORFcoords(seq, th)
    revcomp_seq = revcomp(seq)
    revcomp_coords = getlongORFcoords(revcomp_seq, th)

    # Loop through, print the sequences
    for i in coords:
        if i[1] - i[0] < th:
            continue
        print("Starting position:", i[0])
        print("Ending position:", i[1])
        print("+1")
        print(seq[i[0]:i[1]])
        print()

    # Loop through, print the reverse complements
    for j in revcomp_coords:
        if j[1] - j[0] < th:
            continue
        print("Starting position:", j[0])
        print("Ending position:", j[1])
        print("-1")
        print(revcomp_seq[j[0]:j[1]])
        print()

# use the functions below that are from the lectures (with slight modifications)

def loadFASTA(filename):
    """Outputs a sequence string from the FASTA file named filename"""
    infile = open(filename)
    lineslist = infile.readlines()
    infile.close()
    mylist = []
    for line in lineslist[1:len(lineslist)]: # start with 1 because we don't want the first line
        temp = line.replace("\n","") # gets rid of \n
        temp = temp.replace("\r","") # also gets rid of \r
        mylist.append(temp)
    output = "".join(mylist)
    return output

def shuffleseq(seq):
    """Shuffles seq"""
    mylist = list(seq) # mylist is a list
    random.shuffle(mylist) # mylist is now shuffled. same content different order
    output = "".join(mylist) # output is a string
    return output

def compbase(base):
    """Returns complement of base"""
    output = "?"
    if base == "A":
        output = "T"
    elif base == "C":
        output = "G"
    elif base == "G":
        output = "C"
    elif base == "T":
        output = "A"
    return output

def compseq(seq):
    """Returns complement of seq"""
    mylist = []
    for base in seq:
        nuc = compbase(base)
        mylist.append(nuc)
    output = "".join(mylist)
    return output

def rev(seq):
    """Returns the reverse of seq"""
    return seq[::-1]

def revcomp(seq):
    """Returns the reverse complement of seq"""
    rv = rev(seq)
    rvcp = compseq(rv)
    return rvcp

def main():
    fname = input("Enter the .fasta file to be read: ")
    seq_string = loadFASTA(fname)
    num_sim = int(input("Enter the number of simulations to run: "))
    print()

    threshold = getthresh(seq_string, num_sim)
    print("Threshold value:", threshold)
    print()
    printORF2d(seq_string, threshold)

##########################################################################
main()

