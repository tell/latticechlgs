# -*- coding: utf-8-unix -*-

import six
import sys
from pyparsing import Regex, Literal, OneOrMore, ZeroOrMore, Group

fnumber = Regex(r'[+-]?\d+(\.\d*)?([eE][+-]?\d+)?')
inumber = Regex(r'[+-]?\d+')
vector = Literal('[') + ZeroOrMore(inumber) + Literal(']')
matrix = Literal('[') + OneOrMore(Group(vector)) + Literal(']')

def __cstor_vector(data): # {{{
    '''
    Generate a list for vector from parsed objects.
    '''
    v = []
    for n in data:
        if n == '[' or n == ']': continue
        v.append(int(n))
    return v
# }}}
def __cstor_matrix(data): # {{{
    '''
    Generate a list for matrix from parsed objects.
    '''
    m = []
    for v in data:
        if v == '[' or v == ']': continue
        assert isinstance(v, list)
        w = __cstor_vector(v)
        m.append(w)
    return m
# }}}
def parse_vector(text):
    data = vector.parseString(text).asList()
    return __cstor_vector(data)
def load_vector_file(filename):
    with open(filename) as fd:
        text = fd.read()
    return parse_vector(text)
def parse_matrix(text):
    data = matrix.parseString(text).asList()
    return __cstor_matrix(data)
def load_matrix_file(filename):
    with open(filename) as fd:
        text = fd.read()
    return parse_matrix(text)
if __name__ == '__main__':
    six.print_(load_matrix_file(sys.argv[1]))
# vim: set expandtab foldmethod=marker :
