#!/usr/bin/python3

import re

def main():

    directory = 'main/'
    filenames = ['business_analysis.tex', 'conclusion.tex', 'introduction.tex', 'market_environment.tex'];

    words = 0

    for fn in filenames:
        fh = open(directory + fn, 'r')
        for line in (ln.strip() for ln in fh):
            if not line.startswith('\\'):
                line = re.sub(r'\\[^}]*}', '', line)
                words += len(line.split(' '))

    print('this document contains {} words'.format(words))


if __name__ == '__main__' : main()
