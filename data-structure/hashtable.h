#ifndef MYSYSDIG_DS_HASHTABLE_H
#define MYSYSDIG_DS_HASHTABLE_H
#define HASH_TABLE_ENTER struct __syscall_no_and_arg0
#include "bitset.h"
#include "../syscalls/hashtable-entry.h"

#define __index_of(X) (X % HASHTABLE_MOD)

#define HASHTABLE_SIZE 1024
#define HASHTABLE_MOD 1021


struct __hashtable_node {
  int next, key;
  HASH_TABLE_ENTER value;
};

struct hashtable {
  struct __hashtable_node data[HASHTABLE_SIZE];
  struct bitset node_flag;
  int head[HASHTABLE_MOD], size;
};

// get a item form hashtable by @param:key
HASH_TABLE_ENTER* hashtable_get(struct hashtable *_hashtable, int key) {
  int p = _hashtable->head[__index_of(key)];
  for (; p; p = _hashtable->data[p].next)
    if (_hashtable->data[p].key == key) return &_hashtable->data[p].value;
  return NULL;
}

int hashtable_modify(struct hashtable *_hashtable, int key,
                     HASH_TABLE_ENTER value) {
  int p = _hashtable->head[__index_of(key)];
  for (; p; p = _hashtable->data[p].next) {
    if (_hashtable->data[p].key == key) {
      _hashtable->data[p].value = value;
      return 0;
    }
  }
  return -1;
}

int __hashtable_next_pos(struct hashtable *);

// put a key-value-pair to hashtable
int hashtable_put(struct hashtable *_hashtable, int key,
                  HASH_TABLE_ENTER value) {
  int next_pos;
  if (hashtable_get(_hashtable, key) != NULL) return -1;
  next_pos = __hashtable_next_pos(_hashtable);
  if (next_pos < 0) {
    // error!!!
    // printk("ERROR: put failure for key=%d\n", key);
    return -1;
  }
  ++_hashtable->size;
  bitset_set(&_hashtable->node_flag, next_pos, 1);
  _hashtable->data[next_pos] =
      (struct __hashtable_node){_hashtable->head[__index_of(key)], key, value};
  _hashtable->head[__index_of(key)] = next_pos;
  return 0;
}

int hashtable_delete(struct hashtable *_hashtable, int key) {
  int p = _hashtable->head[__index_of(key)];
  int previous = -1;
  for (; p; p = _hashtable->data[p].next) {
    if (_hashtable->data[p].key == key) {
      if (previous > 0) {
        _hashtable->data[previous].next = _hashtable->data[p].next;
      } else {
        _hashtable->head[__index_of(key)] = _hashtable->data[p].next;
      }
      // clear memory
      bitset_set(&_hashtable->node_flag, p, 0);
      return 0;
    }
    previous = p;
  }
  return -1;
}

/*
 * try to get next postion for storing, by default it will try
 * with the postion of size + 1; if occupied, it will find a free
 * one, or return -1 if the memory poll (array) is full. 
 */
int __hashtable_next_pos(struct hashtable *_hashtable) {
  int res = _hashtable->size + 1;
  if (res < HASHTABLE_SIZE && bitset_get(&_hashtable->node_flag, res) == 0) {
    return res;
  }
  // 0 is reserved
  for (res = 1; res < HASHTABLE_SIZE; res++) {
    if (bitset_get(&_hashtable->node_flag, res) == 0) return res;
  }
  return -1;
}
#endif