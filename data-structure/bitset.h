#ifndef MYSYSDIG_DS_BITSET_H
#define MYSYSDIG_DS_BITSET_H

// this 30 represent 30*64 = 1920;
#define BITSET_MAXN 30
#define BITSET_MAXM 30
struct bitset {
    unsigned long set[BITSET_MAXN];
};

void bitset_clear(struct bitset *_bitset) {
    memset(_bitset->set, 0, sizeof(_bitset->set));
}

unsigned char bitset_get(struct bitset *_bitset, int index) {
    return (_bitset->set[index / BITSET_MAXM] >> index % BITSET_MAXM) & 1;
}

void bitset_set(struct bitset *_bitset, int index, int value) {
    if (value) _bitset->set[index / BITSET_MAXM] |= 1 << index % BITSET_MAXM;
    else _bitset->set[index / BITSET_MAXM] &= ~(1 << index % BITSET_MAXM);
}

#endif //MYSYSDIG_DS_BITSET_H
