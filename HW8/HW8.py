# next-generation sequencing file
# use ord() (python fn) to read ASCII encoded characters (the quality rating for each bp)
from fractions import Fraction
def getQualFrac(filename):
    file = open(filename, 'r')
    count = 0
    totChar = 0
    qualDict = {}
    for i in range(0,250):
        qualDict[i] = 0
    print(qualDict)
    for line in file:
        count += 1
        if count % 4 == 0:  # At every 4th line, quality score
            pos = 0
            for char in line:
                quality = ord(char) - 33
                totChar += 1
                if quality > 30:
                    qualDict[pos] += 1/10000
                pos += 1
    print(totChar)
    print(qualDict)

def numQualReads(k, filename):
    file = open(filename, 'r')
    count = 0
    for line in file:
        count += 1
        if count % 4 == 0:  # At every 4th line, quality score
            for char in line:
                quality = ord(char) - 33
                charCount += 1
                if quality > 30:
                    qualCount += 1


def main():
    getQualFrac("XI1_ATCACG_L001_R1_001.fastq")

main()
