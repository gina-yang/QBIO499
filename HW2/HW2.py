# Gina Yang
# QBIO 499

NUCLEOTIDES = ["A", "C", "G", "T"]
CONSEC_LIST = ["AA", "GG", "CC", "TT", "AC", "AG", "AT",
               "GA", "GC", "GT", "CA", "CT", "CG", "TA", "TG", "TC"]

def num_nucleotides(sequence):
    '''Returns a list of length 4 with the number of A,C,G,T in the sequence'''
    a_count = 0
    c_count = 0
    t_count = 0
    g_count = 0
    # Loop through sequence
    for i in sequence:
        if i == "A":
            a_count += 1
        elif i == "C":
            c_count += 1
        elif i == "T":
            t_count += 1
        elif i == "G":
            g_count += 1
    nucleotide_list = [a_count, c_count, g_count, t_count]
    return nucleotide_list

def consec_nucleotides(sequence, n_string):
    '''Returns the number of times two consecutive nucleotides appear in sequence'''
    string_count = 0
    for i in range(len(sequence) - 1):
        if sequence[i] + sequence[i+1] == n_string:
            string_count += 1
    return string_count

def all_consec_nucleotides(sequence):
    '''Returns outputs of consec_nucleotides, but for all 2-length strings'''
    consec_count_list = []
    for i in CONSEC_LIST:
        consec_count_list.append(consec_nucleotides(sequence, i))
    return consec_count_list

def loadFASTA(filename):
    '''Outputs a sequence str ing from the FASTA file named filename'''
    infile = open(filename)
    lineslist = infile.readlines()
    infile.close()
    mylist = []
    for line in lineslist[1:len(lineslist)]:
        temp = line.replace("\n","")
        temp = temp.replace("\r","")
        mylist.append(temp)
    output = "".join(mylist)
    return output

def main():
    fname = input("Enter the .fasta file to be read: ")
    seq_string = loadFASTA(fname)
    fn1 = num_nucleotides(seq_string)
    # Loop through, print output of function 1
    for i in range(len(NUCLEOTIDES)):
        print(str(NUCLEOTIDES[i]) + ": " + str(fn1[i]))
    print()
    # Loop through, print output of function 2
    fn3 = all_consec_nucleotides(seq_string)
    for i in range(len(CONSEC_LIST)):
        print(str(CONSEC_LIST[i]) + ": " + str(fn3[i]))

main()