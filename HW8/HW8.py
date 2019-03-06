# next-generation sequencing file
# use ord() (python fn) to read ASCII encoded characters (the quality rating for each bp)

def getQualFrac(filename):
    file = open(filename, 'r')
    count = 0
    charCount = 0
    qualCount = 0
    for line in file:
        count += 1
        if count % 4 == 0:  # At every 4th line, quality score
            for char in line:
                quality = ord(char) - 33
                charCount += 1
                if quality > 30:
                    qualCount += 1
    print(qualCount, "/", charCount)

def main():
    getQualFrac("XI1_ATCACG_L001_R1_001.fastq")

main()
