import popper_parser
import os
from os import listdir
from os.path import isfile, join

def game_names(path):
    return ['battle_of_numbers']
    # return sorted(set('_'.join(f.split('_')[:-2]) for f in listdir(path) if isfile(join(path, f)) and f.endswith('.dat')))

def mkdir(path):
    if not os.path.exists(path):
        os.makedirs(path)

def pred(atom):
    xs=atom.split('(')
    return (xs[0],xs[1].count(',')+1)

def targets(inpath):
    return set(f.split('.')[0] for f in listdir(inpath) if isfile(join(inpath, f)))

def parse_(args):
    (system,game) = args
    for stage in ['train','test']:
        outpath='exp/{}/{}/{}/'.format(system.name,game,stage)
        mkdir(outpath)
        for target in ['next','goal','legal','terminal']:
            datafile='data/{0}/{1}_{2}_{0}.dat'.format(stage,game,target)
            if stage == 'train':
                system.parse_train(datafile,outpath,game,target)
            else:
                system.parse_test(datafile,outpath,game,target)

def parse(system):
    list(map(parse_,list((system,game) for game in game_names('data/train'))))

def train_(args):
    (system,game,target) = args
    inpath='exp/{}/train/{}/'.format(system.name,game)
    outpath='programs/{}/{}/'.format(system.name,game)
    mkdir(outpath)
    system.train(inpath,outpath+'{}.pl'.format(target),target)


def run():
    parse(popper_parser.Popper())

run()
