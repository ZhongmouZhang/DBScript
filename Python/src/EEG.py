import re
f = open ("EEG_12s_Sample.txt","r")
'''line = f.readline()
line = line.strip()
line = re.sub('[\t]+', "", line)
list = re.split('[ ]+', line)
for x in list: 
    print(x)
'''
def framesPerSecond(list):
    frameList = []
    sameSecond = list[0][0]
    frameCount = 0
    for i in range(0, len(list)):
        if sameSecond == list[i][0]:
            frameCount += 1
            if i == len(list) - 1:
                frameList.append(frameCount)
        else:
            frameList.append(frameCount)
            sameSecond = list[i][0]
            frameCount = 1
    return frameList
    
def vectorAverage(myList, frameList, num):
    startValue = frameList[0] % num
    endValue = len(myList) - frameList[len(frameList)-1] % num
    averageTupleList = []
    for x in range(startValue, endValue, num):
        sum1 = 0
        sum2 = 0
        sum3 = 0
        for y in range(num):
                z = x + y
                sum1 = sum1 + float(myList[z][1])
                sum2 = sum2 + float(myList[z][2])
                sum3 = sum3 + float(myList[z][3])            
        averageTupleList.append((sum1/num, sum2/num, sum3/num))
    return averageTupleList
        
    
myList = []
for line in f:
    line = line.rstrip("\n")
    list = re.split('\t', line)
    #re.split(character you want to indicate separation, a string input)
    myList.append((list[0], list[3], list[4], list[5]))
print(framesPerSecond(myList))
print(vectorAverage(myList, framesPerSecond(myList), 16))


