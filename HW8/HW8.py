import csv
# Returns a dictionary with key representing position and value representing fraction
# of reads with quality scores greater than or equal to 30 at that position
def getQualFrac(filename):
    file = open(filename, 'r')
    count = 0
    totChar = 0
    qualDict = {}
    for i in range(0, 250):
        qualDict[i] = 0
    for line in file:
        count += 1
        if count % 4 == 0:  # At every 4th line, quality score
            pos = 0
            for char in line:
                quality = ord(char) - 33
                totChar += 1
                if quality >= 30:
                    qualDict[pos] += 1/10000
                pos += 1
    return qualDict

# Returns a dictionary with keys representing number of positions in a read with
# quality >= 30 and value representing the number of reads with the corresponding quality
def numQualReads(filename):
    file = open(filename, 'r')
    count = 0
    qualDict = {}
    for i in range(0, 251):
        qualDict[i] = 0
    for k in range(0, 251):
        for line in file:
            count += 1
            if count % 4 == 0:  # At every 4th line, quality score
                qualCount = 0
                for char in line:
                    if ord(char) - 33 >= 30:
                        qualCount += 1
                qualDict[qualCount] += 1
    return qualDict

def writeToCSV(mydict):
    filename = input("Enter a csv file to save the data to: ")
    with open(filename, 'w') as csv_file:
        writer = csv.writer(csv_file)
        for key, value in mydict.items():
            writer.writerow([key, value])

def main():
    mydict1 = getQualFrac("XI1_ATCACG_L001_R1_001.fastq")
    mydict2 = getQualFrac("XI1_ATCACG_L001_R2_001.fastq")
    mydict3 = numQualReads("XI1_ATCACG_L001_R1_001.fastq")
    mydict4 = numQualReads("XI1_ATCACG_L001_R2_001.fastq")
    writeToCSV(mydict1)
    writeToCSV(mydict2)
    writeToCSV(mydict3)
    writeToCSV(mydict4)

main()
