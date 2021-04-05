
my_sysdig.ko:     file format elf64-x86-64


Disassembly of section .note.gnu.build-id:

0000000000000000 <.note.gnu.build-id>:
   0:	04 00                	add    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	14 00                	adc    $0x0,%al
   6:	00 00                	add    %al,(%rax)
   8:	03 00                	add    (%rax),%eax
   a:	00 00                	add    %al,(%rax)
   c:	47                   	rex.RXB
   d:	4e 55                	rex.WRX push %rbp
   f:	00 1e                	add    %bl,(%rsi)
  11:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
  12:	e3 4c                	jrcxz  60 <__UNIQUE_ID_author102+0xe>
  14:	b9 b7 59 f3 09       	mov    $0x9f359b7,%ecx
  19:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
  1a:	12 1d 82 95 76 ea    	adc    -0x15896a7e(%rip),%bl        # ffffffffea7695a2 <pid+0xffffffffe9f62472>
  20:	2b 6f 5e             	sub    0x5e(%rdi),%ebp
  23:	81                   	.byte 0x81

Disassembly of section .text:

0000000000000000 <lookup_tracepoints>:
   0:	e8 00 00 00 00       	callq  5 <lookup_tracepoints+0x5>
   5:	55                   	push   %rbp
   6:	48 89 e5             	mov    %rsp,%rbp
   9:	41 54                	push   %r12
   b:	53                   	push   %rbx
   c:	48 8b 1f             	mov    (%rdi),%rbx
   f:	49 89 fc             	mov    %rdi,%r12
  12:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 19 <lookup_tracepoints+0x19>
  19:	48 89 de             	mov    %rbx,%rsi
  1c:	e8 00 00 00 00       	callq  21 <lookup_tracepoints+0x21>
  21:	85 c0                	test   %eax,%eax
  23:	75 0b                	jne    30 <lookup_tracepoints+0x30>
  25:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 2c <lookup_tracepoints+0x2c>
  2c:	49 8b 1c 24          	mov    (%r12),%rbx
  30:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 37 <lookup_tracepoints+0x37>
  37:	48 89 de             	mov    %rbx,%rsi
  3a:	e8 00 00 00 00       	callq  3f <lookup_tracepoints+0x3f>
  3f:	85 c0                	test   %eax,%eax
  41:	75 07                	jne    4a <lookup_tracepoints+0x4a>
  43:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 4a <lookup_tracepoints+0x4a>
  4a:	5b                   	pop    %rbx
  4b:	41 5c                	pop    %r12
  4d:	5d                   	pop    %rbp
  4e:	c3                   	retq   
  4f:	90                   	nop

0000000000000050 <bitset_clear>:
  50:	e8 00 00 00 00       	callq  55 <bitset_clear+0x5>
  55:	55                   	push   %rbp
  56:	48 89 f9             	mov    %rdi,%rcx
  59:	48 c7 07 00 00 00 00 	movq   $0x0,(%rdi)
  60:	48 c7 87 e8 00 00 00 	movq   $0x0,0xe8(%rdi)
  67:	00 00 00 00 
  6b:	48 8d 7f 08          	lea    0x8(%rdi),%rdi
  6f:	31 c0                	xor    %eax,%eax
  71:	48 89 e5             	mov    %rsp,%rbp
  74:	48 83 e7 f8          	and    $0xfffffffffffffff8,%rdi
  78:	48 29 f9             	sub    %rdi,%rcx
  7b:	81 c1 f0 00 00 00    	add    $0xf0,%ecx
  81:	c1 e9 03             	shr    $0x3,%ecx
  84:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  87:	5d                   	pop    %rbp
  88:	c3                   	retq   
  89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000090 <bitset_get>:
  90:	e8 00 00 00 00       	callq  95 <bitset_get+0x5>
  95:	89 f0                	mov    %esi,%eax
  97:	ba 89 88 88 88       	mov    $0x88888889,%edx
  9c:	89 f1                	mov    %esi,%ecx
  9e:	f7 ea                	imul   %edx
  a0:	89 f0                	mov    %esi,%eax
  a2:	55                   	push   %rbp
  a3:	c1 f8 1f             	sar    $0x1f,%eax
  a6:	48 89 e5             	mov    %rsp,%rbp
  a9:	01 f2                	add    %esi,%edx
  ab:	c1 fa 04             	sar    $0x4,%edx
  ae:	29 c2                	sub    %eax,%edx
  b0:	48 63 c2             	movslq %edx,%rax
  b3:	6b d2 1e             	imul   $0x1e,%edx,%edx
  b6:	48 8b 04 c7          	mov    (%rdi,%rax,8),%rax
  ba:	5d                   	pop    %rbp
  bb:	29 d1                	sub    %edx,%ecx
  bd:	48 d3 e8             	shr    %cl,%rax
  c0:	83 e0 01             	and    $0x1,%eax
  c3:	c3                   	retq   
  c4:	66 90                	xchg   %ax,%ax
  c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  cd:	00 00 00 

00000000000000d0 <bitset_set>:
  d0:	e8 00 00 00 00       	callq  d5 <bitset_set+0x5>
  d5:	41 89 d0             	mov    %edx,%r8d
  d8:	89 f0                	mov    %esi,%eax
  da:	ba 89 88 88 88       	mov    $0x88888889,%edx
  df:	f7 ea                	imul   %edx
  e1:	89 f0                	mov    %esi,%eax
  e3:	89 f1                	mov    %esi,%ecx
  e5:	c1 f8 1f             	sar    $0x1f,%eax
  e8:	55                   	push   %rbp
  e9:	01 f2                	add    %esi,%edx
  eb:	48 89 e5             	mov    %rsp,%rbp
  ee:	c1 fa 04             	sar    $0x4,%edx
  f1:	29 c2                	sub    %eax,%edx
  f3:	48 63 c2             	movslq %edx,%rax
  f6:	6b d2 1e             	imul   $0x1e,%edx,%edx
  f9:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
  fd:	48 8b 38             	mov    (%rax),%rdi
 100:	29 d1                	sub    %edx,%ecx
 102:	ba 01 00 00 00       	mov    $0x1,%edx
 107:	d3 e2                	shl    %cl,%edx
 109:	45 85 c0             	test   %r8d,%r8d
 10c:	75 0d                	jne    11b <bitset_set+0x4b>
 10e:	f7 d2                	not    %edx
 110:	48 63 d2             	movslq %edx,%rdx
 113:	48 21 fa             	and    %rdi,%rdx
 116:	48 89 10             	mov    %rdx,(%rax)
 119:	5d                   	pop    %rbp
 11a:	c3                   	retq   
 11b:	48 63 d2             	movslq %edx,%rdx
 11e:	48 09 fa             	or     %rdi,%rdx
 121:	48 89 10             	mov    %rdx,(%rax)
 124:	5d                   	pop    %rbp
 125:	c3                   	retq   
 126:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 12d:	00 00 00 

0000000000000130 <hashtable_get>:
 130:	e8 00 00 00 00       	callq  135 <hashtable_get+0x5>
 135:	89 f0                	mov    %esi,%eax
 137:	ba 37 48 60 80       	mov    $0x80604837,%edx
 13c:	89 f1                	mov    %esi,%ecx
 13e:	f7 ea                	imul   %edx
 140:	55                   	push   %rbp
 141:	48 89 e5             	mov    %rsp,%rbp
 144:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
 147:	89 f2                	mov    %esi,%edx
 149:	c1 fa 1f             	sar    $0x1f,%edx
 14c:	c1 f8 09             	sar    $0x9,%eax
 14f:	29 d0                	sub    %edx,%eax
 151:	69 c0 fd 03 00 00    	imul   $0x3fd,%eax,%eax
 157:	29 c1                	sub    %eax,%ecx
 159:	48 63 c1             	movslq %ecx,%rax
 15c:	48 63 84 87 f0 60 00 	movslq 0x60f0(%rdi,%rax,4),%rax
 163:	00 
 164:	85 c0                	test   %eax,%eax
 166:	74 22                	je     18a <hashtable_get+0x5a>
 168:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 16c:	3b 74 d7 04          	cmp    0x4(%rdi,%rdx,8),%esi
 170:	75 0c                	jne    17e <hashtable_get+0x4e>
 172:	eb 1a                	jmp    18e <hashtable_get+0x5e>
 174:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 178:	39 74 d7 04          	cmp    %esi,0x4(%rdi,%rdx,8)
 17c:	74 10                	je     18e <hashtable_get+0x5e>
 17e:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 182:	48 63 04 c7          	movslq (%rdi,%rax,8),%rax
 186:	85 c0                	test   %eax,%eax
 188:	75 ea                	jne    174 <hashtable_get+0x44>
 18a:	31 c0                	xor    %eax,%eax
 18c:	5d                   	pop    %rbp
 18d:	c3                   	retq   
 18e:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 192:	5d                   	pop    %rbp
 193:	48 8d 44 c7 08       	lea    0x8(%rdi,%rax,8),%rax
 198:	c3                   	retq   
 199:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000001a0 <hashtable_modify>:
 1a0:	e8 00 00 00 00       	callq  1a5 <hashtable_modify+0x5>
 1a5:	89 f0                	mov    %esi,%eax
 1a7:	49 89 d1             	mov    %rdx,%r9
 1aa:	ba 37 48 60 80       	mov    $0x80604837,%edx
 1af:	f7 ea                	imul   %edx
 1b1:	55                   	push   %rbp
 1b2:	48 89 e5             	mov    %rsp,%rbp
 1b5:	41 52                	push   %r10
 1b7:	49 89 ca             	mov    %rcx,%r10
 1ba:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
 1bd:	89 f2                	mov    %esi,%edx
 1bf:	89 f1                	mov    %esi,%ecx
 1c1:	c1 fa 1f             	sar    $0x1f,%edx
 1c4:	c1 f8 09             	sar    $0x9,%eax
 1c7:	29 d0                	sub    %edx,%eax
 1c9:	69 c0 fd 03 00 00    	imul   $0x3fd,%eax,%eax
 1cf:	29 c1                	sub    %eax,%ecx
 1d1:	48 63 c1             	movslq %ecx,%rax
 1d4:	8b 94 87 f0 60 00 00 	mov    0x60f0(%rdi,%rax,4),%edx
 1db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e0:	85 d2                	test   %edx,%edx
 1e2:	74 2c                	je     210 <hashtable_modify+0x70>
 1e4:	48 63 c2             	movslq %edx,%rax
 1e7:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 1eb:	3b 74 d7 04          	cmp    0x4(%rdi,%rdx,8),%esi
 1ef:	75 0f                	jne    200 <hashtable_modify+0x60>
 1f1:	eb 21                	jmp    214 <hashtable_modify+0x74>
 1f3:	48 63 c2             	movslq %edx,%rax
 1f6:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 1fa:	39 74 d7 04          	cmp    %esi,0x4(%rdi,%rdx,8)
 1fe:	74 14                	je     214 <hashtable_modify+0x74>
 200:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 204:	8b 14 c7             	mov    (%rdi,%rax,8),%edx
 207:	85 d2                	test   %edx,%edx
 209:	75 e8                	jne    1f3 <hashtable_modify+0x53>
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	41 5a                	pop    %r10
 212:	5d                   	pop    %rbp
 213:	c3                   	retq   
 214:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 218:	4c 89 4c c7 08       	mov    %r9,0x8(%rdi,%rax,8)
 21d:	4c 89 54 c7 10       	mov    %r10,0x10(%rdi,%rax,8)
 222:	31 c0                	xor    %eax,%eax
 224:	41 5a                	pop    %r10
 226:	5d                   	pop    %rbp
 227:	c3                   	retq   
 228:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 22f:	00 

0000000000000230 <hashtable_delete>:
 230:	e8 00 00 00 00       	callq  235 <hashtable_delete+0x5>
 235:	89 f0                	mov    %esi,%eax
 237:	ba 37 48 60 80       	mov    $0x80604837,%edx
 23c:	89 f1                	mov    %esi,%ecx
 23e:	f7 ea                	imul   %edx
 240:	55                   	push   %rbp
 241:	48 89 e5             	mov    %rsp,%rbp
 244:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
 247:	89 f2                	mov    %esi,%edx
 249:	c1 fa 1f             	sar    $0x1f,%edx
 24c:	c1 f8 09             	sar    $0x9,%eax
 24f:	29 d0                	sub    %edx,%eax
 251:	69 c0 fd 03 00 00    	imul   $0x3fd,%eax,%eax
 257:	29 c1                	sub    %eax,%ecx
 259:	48 63 c1             	movslq %ecx,%rax
 25c:	4c 8d 0c 87          	lea    (%rdi,%rax,4),%r9
 260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 265:	4d 63 81 f0 60 00 00 	movslq 0x60f0(%r9),%r8
 26c:	45 85 c0             	test   %r8d,%r8d
 26f:	74 34                	je     2a5 <hashtable_delete+0x75>
 271:	49 63 c0             	movslq %r8d,%rax
 274:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 278:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
 27c:	3b 70 04             	cmp    0x4(%rax),%esi
 27f:	8b 08                	mov    (%rax),%ecx
 281:	75 19                	jne    29c <hashtable_delete+0x6c>
 283:	eb 60                	jmp    2e5 <hashtable_delete+0xb5>
 285:	48 63 c1             	movslq %ecx,%rax
 288:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 28c:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
 290:	39 70 04             	cmp    %esi,0x4(%rax)
 293:	8b 10                	mov    (%rax),%edx
 295:	74 10                	je     2a7 <hashtable_delete+0x77>
 297:	4c 63 c1             	movslq %ecx,%r8
 29a:	89 d1                	mov    %edx,%ecx
 29c:	85 c9                	test   %ecx,%ecx
 29e:	75 e5                	jne    285 <hashtable_delete+0x55>
 2a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a5:	5d                   	pop    %rbp
 2a6:	c3                   	retq   
 2a7:	45 85 c0             	test   %r8d,%r8d
 2aa:	7e 3e                	jle    2ea <hashtable_delete+0xba>
 2ac:	4b 8d 04 40          	lea    (%r8,%r8,2),%rax
 2b0:	89 14 c7             	mov    %edx,(%rdi,%rax,8)
 2b3:	89 c8                	mov    %ecx,%eax
 2b5:	ba 89 88 88 88       	mov    $0x88888889,%edx
 2ba:	f7 ea                	imul   %edx
 2bc:	89 c8                	mov    %ecx,%eax
 2be:	c1 f8 1f             	sar    $0x1f,%eax
 2c1:	01 ca                	add    %ecx,%edx
 2c3:	c1 fa 04             	sar    $0x4,%edx
 2c6:	29 c2                	sub    %eax,%edx
 2c8:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 2cd:	48 63 f2             	movslq %edx,%rsi
 2d0:	6b d2 1e             	imul   $0x1e,%edx,%edx
 2d3:	29 d1                	sub    %edx,%ecx
 2d5:	d3 c0                	rol    %cl,%eax
 2d7:	48 98                	cltq   
 2d9:	48 21 84 f7 00 60 00 	and    %rax,0x6000(%rdi,%rsi,8)
 2e0:	00 
 2e1:	31 c0                	xor    %eax,%eax
 2e3:	5d                   	pop    %rbp
 2e4:	c3                   	retq   
 2e5:	89 ca                	mov    %ecx,%edx
 2e7:	44 89 c1             	mov    %r8d,%ecx
 2ea:	41 89 91 f0 60 00 00 	mov    %edx,0x60f0(%r9)
 2f1:	eb c0                	jmp    2b3 <hashtable_delete+0x83>
 2f3:	0f 1f 00             	nopl   (%rax)
 2f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 2fd:	00 00 00 

0000000000000300 <__hashtable_next_pos>:
 300:	e8 00 00 00 00       	callq  305 <__hashtable_next_pos+0x5>
 305:	8b 87 e4 70 00 00    	mov    0x70e4(%rdi),%eax
 30b:	55                   	push   %rbp
 30c:	48 89 e5             	mov    %rsp,%rbp
 30f:	8d 48 01             	lea    0x1(%rax),%ecx
 312:	81 f9 ff 03 00 00    	cmp    $0x3ff,%ecx
 318:	7f 2d                	jg     347 <__hashtable_next_pos+0x47>
 31a:	89 c8                	mov    %ecx,%eax
 31c:	ba 89 88 88 88       	mov    $0x88888889,%edx
 321:	f7 ea                	imul   %edx
 323:	89 c8                	mov    %ecx,%eax
 325:	c1 f8 1f             	sar    $0x1f,%eax
 328:	01 ca                	add    %ecx,%edx
 32a:	c1 fa 04             	sar    $0x4,%edx
 32d:	29 c2                	sub    %eax,%edx
 32f:	89 c8                	mov    %ecx,%eax
 331:	48 63 f2             	movslq %edx,%rsi
 334:	6b d2 1e             	imul   $0x1e,%edx,%edx
 337:	29 d0                	sub    %edx,%eax
 339:	48 8b 94 f7 00 60 00 	mov    0x6000(%rdi,%rsi,8),%rdx
 340:	00 
 341:	48 0f a3 c2          	bt     %rax,%rdx
 345:	73 38                	jae    37f <__hashtable_next_pos+0x7f>
 347:	b9 01 00 00 00       	mov    $0x1,%ecx
 34c:	41 b8 89 88 88 88    	mov    $0x88888889,%r8d
 352:	eb 0b                	jmp    35f <__hashtable_next_pos+0x5f>
 354:	83 c1 01             	add    $0x1,%ecx
 357:	81 f9 00 04 00 00    	cmp    $0x400,%ecx
 35d:	74 24                	je     383 <__hashtable_next_pos+0x83>
 35f:	89 c8                	mov    %ecx,%eax
 361:	41 f7 e0             	mul    %r8d
 364:	89 c8                	mov    %ecx,%eax
 366:	c1 ea 04             	shr    $0x4,%edx
 369:	48 63 f2             	movslq %edx,%rsi
 36c:	6b d2 1e             	imul   $0x1e,%edx,%edx
 36f:	29 d0                	sub    %edx,%eax
 371:	48 8b 94 f7 00 60 00 	mov    0x6000(%rdi,%rsi,8),%rdx
 378:	00 
 379:	48 0f a3 c2          	bt     %rax,%rdx
 37d:	72 d5                	jb     354 <__hashtable_next_pos+0x54>
 37f:	89 c8                	mov    %ecx,%eax
 381:	5d                   	pop    %rbp
 382:	c3                   	retq   
 383:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
 388:	eb f5                	jmp    37f <__hashtable_next_pos+0x7f>
 38a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000390 <hashtable_put>:
 390:	e8 00 00 00 00       	callq  395 <hashtable_put+0x5>
 395:	55                   	push   %rbp
 396:	89 f0                	mov    %esi,%eax
 398:	48 89 e5             	mov    %rsp,%rbp
 39b:	41 57                	push   %r15
 39d:	41 56                	push   %r14
 39f:	41 55                	push   %r13
 3a1:	49 89 d5             	mov    %rdx,%r13
 3a4:	ba 37 48 60 80       	mov    $0x80604837,%edx
 3a9:	f7 ea                	imul   %edx
 3ab:	49 89 ce             	mov    %rcx,%r14
 3ae:	89 f1                	mov    %esi,%ecx
 3b0:	41 54                	push   %r12
 3b2:	41 52                	push   %r10
 3b4:	53                   	push   %rbx
 3b5:	8d 04 32             	lea    (%rdx,%rsi,1),%eax
 3b8:	89 f2                	mov    %esi,%edx
 3ba:	c1 fa 1f             	sar    $0x1f,%edx
 3bd:	c1 f8 09             	sar    $0x9,%eax
 3c0:	29 d0                	sub    %edx,%eax
 3c2:	69 c0 fd 03 00 00    	imul   $0x3fd,%eax,%eax
 3c8:	29 c1                	sub    %eax,%ecx
 3ca:	48 63 c1             	movslq %ecx,%rax
 3cd:	4c 8d 3c 87          	lea    (%rdi,%rax,4),%r15
 3d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d6:	41 8b 97 f0 60 00 00 	mov    0x60f0(%r15),%edx
 3dd:	85 d2                	test   %edx,%edx
 3df:	75 10                	jne    3f1 <hashtable_put+0x61>
 3e1:	e9 95 00 00 00       	jmpq   47b <hashtable_put+0xeb>
 3e6:	8b 14 c7             	mov    (%rdi,%rax,8),%edx
 3e9:	85 d2                	test   %edx,%edx
 3eb:	0f 84 97 00 00 00    	je     488 <hashtable_put+0xf8>
 3f1:	48 63 c2             	movslq %edx,%rax
 3f4:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 3f8:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 3fc:	3b 74 d7 04          	cmp    0x4(%rdi,%rdx,8),%esi
 400:	75 e4                	jne    3e6 <hashtable_put+0x56>
 402:	48 8d 44 c7 08       	lea    0x8(%rdi,%rax,8),%rax
 407:	48 85 c0             	test   %rax,%rax
 40a:	74 7c                	je     488 <hashtable_put+0xf8>
 40c:	41 89 f4             	mov    %esi,%r12d
 40f:	48 89 fb             	mov    %rdi,%rbx
 412:	e8 00 00 00 00       	callq  417 <hashtable_put+0x87>
 417:	85 c0                	test   %eax,%eax
 419:	89 c6                	mov    %eax,%esi
 41b:	78 6b                	js     488 <hashtable_put+0xf8>
 41d:	ba 89 88 88 88       	mov    $0x88888889,%edx
 422:	89 f1                	mov    %esi,%ecx
 424:	83 83 e4 70 00 00 01 	addl   $0x1,0x70e4(%rbx)
 42b:	f7 ea                	imul   %edx
 42d:	89 f0                	mov    %esi,%eax
 42f:	c1 f8 1f             	sar    $0x1f,%eax
 432:	01 f2                	add    %esi,%edx
 434:	c1 fa 04             	sar    $0x4,%edx
 437:	29 c2                	sub    %eax,%edx
 439:	b8 01 00 00 00       	mov    $0x1,%eax
 43e:	48 63 fa             	movslq %edx,%rdi
 441:	6b d2 1e             	imul   $0x1e,%edx,%edx
 444:	29 d1                	sub    %edx,%ecx
 446:	d3 e0                	shl    %cl,%eax
 448:	48 98                	cltq   
 44a:	48 09 84 fb 00 60 00 	or     %rax,0x6000(%rbx,%rdi,8)
 451:	00 
 452:	48 63 c6             	movslq %esi,%rax
 455:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 459:	41 8b 97 f0 60 00 00 	mov    0x60f0(%r15),%edx
 460:	48 8d 04 c3          	lea    (%rbx,%rax,8),%rax
 464:	89 10                	mov    %edx,(%rax)
 466:	44 89 60 04          	mov    %r12d,0x4(%rax)
 46a:	4c 89 68 08          	mov    %r13,0x8(%rax)
 46e:	4c 89 70 10          	mov    %r14,0x10(%rax)
 472:	31 c0                	xor    %eax,%eax
 474:	41 89 b7 f0 60 00 00 	mov    %esi,0x60f0(%r15)
 47b:	5b                   	pop    %rbx
 47c:	41 5a                	pop    %r10
 47e:	41 5c                	pop    %r12
 480:	41 5d                	pop    %r13
 482:	41 5e                	pop    %r14
 484:	41 5f                	pop    %r15
 486:	5d                   	pop    %rbp
 487:	c3                   	retq   
 488:	5b                   	pop    %rbx
 489:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 48e:	41 5a                	pop    %r10
 490:	41 5c                	pop    %r12
 492:	41 5d                	pop    %r13
 494:	41 5e                	pop    %r14
 496:	41 5f                	pop    %r15
 498:	5d                   	pop    %rbp
 499:	c3                   	retq   
 49a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000004a0 <check_proc_pid>:
 4a0:	e8 00 00 00 00       	callq  4a5 <check_proc_pid+0x5>
 4a5:	55                   	push   %rbp
 4a6:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 4ad:	00 00 
 4af:	39 b8 a8 08 00 00    	cmp    %edi,0x8a8(%rax)
 4b5:	48 89 e5             	mov    %rsp,%rbp
 4b8:	5d                   	pop    %rbp
 4b9:	0f 94 c0             	sete   %al
 4bc:	c3                   	retq   
 4bd:	0f 1f 00             	nopl   (%rax)

00000000000004c0 <get_process_name>:
 4c0:	e8 00 00 00 00       	callq  4c5 <get_process_name+0x5>
 4c5:	55                   	push   %rbp
 4c6:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 4cd:	00 00 
 4cf:	48 89 e5             	mov    %rsp,%rbp
 4d2:	48 05 50 0a 00 00    	add    $0xa50,%rax
 4d8:	5d                   	pop    %rbp
 4d9:	c3                   	retq   
 4da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000004e0 <check_proc_name>:
 4e0:	e8 00 00 00 00       	callq  4e5 <check_proc_name+0x5>
 4e5:	55                   	push   %rbp
 4e6:	48 89 e5             	mov    %rsp,%rbp
 4e9:	41 54                	push   %r12
 4eb:	53                   	push   %rbx
 4ec:	49 89 fc             	mov    %rdi,%r12
 4ef:	e8 00 00 00 00       	callq  4f4 <check_proc_name+0x14>
 4f4:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
 4fb:	00 00 
 4fd:	ba 0f 00 00 00       	mov    $0xf,%edx
 502:	48 83 f8 0f          	cmp    $0xf,%rax
 506:	48 8d bb 50 0a 00 00 	lea    0xa50(%rbx),%rdi
 50d:	48 0f 46 d0          	cmovbe %rax,%rdx
 511:	4c 89 e6             	mov    %r12,%rsi
 514:	e8 00 00 00 00       	callq  519 <check_proc_name+0x39>
 519:	85 c0                	test   %eax,%eax
 51b:	5b                   	pop    %rbx
 51c:	0f 94 c0             	sete   %al
 51f:	41 5c                	pop    %r12
 521:	5d                   	pop    %rbp
 522:	c3                   	retq   
 523:	0f 1f 00             	nopl   (%rax)
 526:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 52d:	00 00 00 

0000000000000530 <syscall_enter_probe>:
 530:	e8 00 00 00 00       	callq  535 <syscall_enter_probe+0x5>
 535:	55                   	push   %rbp
 536:	48 89 e5             	mov    %rsp,%rbp
 539:	41 52                	push   %r10
 53b:	53                   	push   %rbx
 53c:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 542 <syscall_enter_probe+0x12>
 542:	48 89 f3             	mov    %rsi,%rbx
 545:	85 c0                	test   %eax,%eax
 547:	74 1b                	je     564 <syscall_enter_probe+0x34>
 549:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
 550:	00 00 
 552:	39 82 a8 08 00 00    	cmp    %eax,0x8a8(%rdx)
 558:	0f 94 c0             	sete   %al
 55b:	84 c0                	test   %al,%al
 55d:	75 11                	jne    570 <syscall_enter_probe+0x40>
 55f:	5b                   	pop    %rbx
 560:	41 5a                	pop    %r10
 562:	5d                   	pop    %rbp
 563:	c3                   	retq   
 564:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 56b <syscall_enter_probe+0x3b>
 56b:	80 3f 00             	cmpb   $0x0,(%rdi)
 56e:	75 51                	jne    5c1 <syscall_enter_probe+0x91>
 570:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 577:	e8 00 00 00 00       	callq  57c <syscall_enter_probe+0x4c>
 57c:	48 63 53 50          	movslq 0x50(%rbx),%rdx
 580:	48 8b 4b 70          	mov    0x70(%rbx),%rcx
 584:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 58b:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 592:	00 00 
 594:	8b b0 a8 08 00 00    	mov    0x8a8(%rax),%esi
 59a:	e8 00 00 00 00       	callq  59f <syscall_enter_probe+0x6f>
 59f:	48 83 05 00 00 00 00 	addq   $0x1,0x0(%rip)        # 5a7 <syscall_enter_probe+0x77>
 5a6:	01 
 5a7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 5ae:	ff 14 25 00 00 00 00 	callq  *0x0
 5b5:	ff 14 25 00 00 00 00 	callq  *0x0
 5bc:	5b                   	pop    %rbx
 5bd:	41 5a                	pop    %r10
 5bf:	5d                   	pop    %rbp
 5c0:	c3                   	retq   
 5c1:	e8 00 00 00 00       	callq  5c6 <syscall_enter_probe+0x96>
 5c6:	eb 93                	jmp    55b <syscall_enter_probe+0x2b>
 5c8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 5cf:	00 

00000000000005d0 <check_proc>:
 5d0:	e8 00 00 00 00       	callq  5d5 <check_proc+0x5>
 5d5:	55                   	push   %rbp
 5d6:	85 ff                	test   %edi,%edi
 5d8:	48 89 e5             	mov    %rsp,%rbp
 5db:	75 0c                	jne    5e9 <check_proc+0x19>
 5dd:	80 3e 00             	cmpb   $0x0,(%rsi)
 5e0:	b8 01 00 00 00       	mov    $0x1,%eax
 5e5:	75 16                	jne    5fd <check_proc+0x2d>
 5e7:	5d                   	pop    %rbp
 5e8:	c3                   	retq   
 5e9:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 5f0:	00 00 
 5f2:	39 b8 a8 08 00 00    	cmp    %edi,0x8a8(%rax)
 5f8:	5d                   	pop    %rbp
 5f9:	0f 94 c0             	sete   %al
 5fc:	c3                   	retq   
 5fd:	48 89 f7             	mov    %rsi,%rdi
 600:	e8 00 00 00 00       	callq  605 <check_proc+0x35>
 605:	5d                   	pop    %rbp
 606:	c3                   	retq   
 607:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 60e:	00 00 

0000000000000610 <file_open>:
 610:	e8 00 00 00 00       	callq  615 <file_open+0x5>
 615:	55                   	push   %rbp
 616:	48 89 e5             	mov    %rsp,%rbp
 619:	41 57                	push   %r15
 61b:	41 56                	push   %r14
 61d:	41 55                	push   %r13
 61f:	41 54                	push   %r12
 621:	49 89 fd             	mov    %rdi,%r13
 624:	53                   	push   %rbx
 625:	41 89 f6             	mov    %esi,%r14d
 628:	41 89 d4             	mov    %edx,%r12d
 62b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 632:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
 639:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 640:	e8 00 00 00 00       	callq  645 <file_open+0x35>
 645:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
 64c:	00 00 
 64e:	4c 8b bb 58 13 00 00 	mov    0x1358(%rbx),%r15
 655:	48 c7 83 58 13 00 00 	movq   $0xffffffffffffffff,0x1358(%rbx)
 65c:	ff ff ff ff 
 660:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
 665:	41 0f b7 d4          	movzwl %r12w,%edx
 669:	44 89 f6             	mov    %r14d,%esi
 66c:	4c 89 ef             	mov    %r13,%rdi
 66f:	e8 00 00 00 00       	callq  674 <file_open+0x64>
 674:	4c 89 bb 58 13 00 00 	mov    %r15,0x1358(%rbx)
 67b:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
 680:	ba 00 00 00 00       	mov    $0x0,%edx
 685:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
 68b:	5b                   	pop    %rbx
 68c:	48 0f 43 c2          	cmovae %rdx,%rax
 690:	41 5c                	pop    %r12
 692:	41 5d                	pop    %r13
 694:	41 5e                	pop    %r14
 696:	41 5f                	pop    %r15
 698:	5d                   	pop    %rbp
 699:	c3                   	retq   
 69a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000000006a0 <close_record_file>:
 6a0:	e8 00 00 00 00       	callq  6a5 <close_record_file+0x5>
 6a5:	55                   	push   %rbp
 6a6:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 6ad <close_record_file+0xd>
 6ad:	31 f6                	xor    %esi,%esi
 6af:	48 89 e5             	mov    %rsp,%rbp
 6b2:	e8 00 00 00 00       	callq  6b7 <close_record_file+0x17>
 6b7:	5d                   	pop    %rbp
 6b8:	c3                   	retq   
 6b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000006c0 <file_write>:
 6c0:	e8 00 00 00 00       	callq  6c5 <file_write+0x5>
 6c5:	55                   	push   %rbp
 6c6:	48 89 e5             	mov    %rsp,%rbp
 6c9:	41 54                	push   %r12
 6cb:	53                   	push   %rbx
 6cc:	65 48 8b 1c 25 00 00 	mov    %gs:0x0,%rbx
 6d3:	00 00 
 6d5:	4c 8b a3 58 13 00 00 	mov    0x1358(%rbx),%r12
 6dc:	48 c7 83 58 13 00 00 	movq   $0xffffffffffffffff,0x1358(%rbx)
 6e3:	ff ff ff ff 
 6e7:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
 6ec:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 6f3 <file_write+0x33>
 6f3:	89 d2                	mov    %edx,%edx
 6f5:	48 8d 48 68          	lea    0x68(%rax),%rcx
 6f9:	e8 00 00 00 00       	callq  6fe <file_write+0x3e>
 6fe:	4c 89 a3 58 13 00 00 	mov    %r12,0x1358(%rbx)
 705:	f0 80 4b 03 80       	lock orb $0x80,0x3(%rbx)
 70a:	5b                   	pop    %rbx
 70b:	41 5c                	pop    %r12
 70d:	5d                   	pop    %rbp
 70e:	c3                   	retq   
 70f:	90                   	nop

0000000000000710 <dump_to_file>:
 710:	e8 00 00 00 00       	callq  715 <dump_to_file+0x5>
 715:	55                   	push   %rbp
 716:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 71d <dump_to_file+0xd>
 71d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 724:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 72b <dump_to_file+0x1b>
 72b:	48 89 e5             	mov    %rsp,%rbp
 72e:	e8 00 00 00 00       	callq  733 <dump_to_file+0x23>
 733:	8b 15 00 00 00 00    	mov    0x0(%rip),%edx        # 739 <dump_to_file+0x29>
 739:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 740 <dump_to_file+0x30>
 740:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 747:	e8 00 00 00 00       	callq  74c <dump_to_file+0x3c>
 74c:	48 c7 05 00 00 00 00 	movq   $0x0,0x0(%rip)        # 757 <dump_to_file+0x47>
 753:	00 00 00 00 
 757:	5d                   	pop    %rbp
 758:	c3                   	retq   
 759:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000000760 <get_arg0>:
 760:	e8 00 00 00 00       	callq  765 <get_arg0+0x5>
 765:	55                   	push   %rbp
 766:	48 8b 47 70          	mov    0x70(%rdi),%rax
 76a:	48 89 e5             	mov    %rsp,%rbp
 76d:	5d                   	pop    %rbp
 76e:	c3                   	retq   
 76f:	90                   	nop

0000000000000770 <get_syscall_no>:
 770:	e8 00 00 00 00       	callq  775 <get_syscall_no+0x5>
 775:	55                   	push   %rbp
 776:	48 8b 47 50          	mov    0x50(%rdi),%rax
 77a:	48 89 e5             	mov    %rsp,%rbp
 77d:	5d                   	pop    %rbp
 77e:	c3                   	retq   
 77f:	90                   	nop

0000000000000780 <get_syscall_res>:
 780:	e8 00 00 00 00       	callq  785 <get_syscall_res+0x5>
 785:	55                   	push   %rbp
 786:	48 8b 47 50          	mov    0x50(%rdi),%rax
 78a:	48 89 e5             	mov    %rsp,%rbp
 78d:	5d                   	pop    %rbp
 78e:	c3                   	retq   
 78f:	90                   	nop

0000000000000790 <get_arg1>:
 790:	e8 00 00 00 00       	callq  795 <get_arg1+0x5>
 795:	55                   	push   %rbp
 796:	48 8b 47 68          	mov    0x68(%rdi),%rax
 79a:	48 89 e5             	mov    %rsp,%rbp
 79d:	5d                   	pop    %rbp
 79e:	c3                   	retq   
 79f:	90                   	nop

00000000000007a0 <get_arg2>:
 7a0:	e8 00 00 00 00       	callq  7a5 <get_arg2+0x5>
 7a5:	55                   	push   %rbp
 7a6:	48 8b 47 60          	mov    0x60(%rdi),%rax
 7aa:	48 89 e5             	mov    %rsp,%rbp
 7ad:	5d                   	pop    %rbp
 7ae:	c3                   	retq   
 7af:	90                   	nop

00000000000007b0 <get_arg3>:
 7b0:	e8 00 00 00 00       	callq  7b5 <get_arg3+0x5>
 7b5:	55                   	push   %rbp
 7b6:	48 8b 47 38          	mov    0x38(%rdi),%rax
 7ba:	48 89 e5             	mov    %rsp,%rbp
 7bd:	5d                   	pop    %rbp
 7be:	c3                   	retq   
 7bf:	90                   	nop

00000000000007c0 <get_arg4>:
 7c0:	e8 00 00 00 00       	callq  7c5 <get_arg4+0x5>
 7c5:	55                   	push   %rbp
 7c6:	48 8b 47 48          	mov    0x48(%rdi),%rax
 7ca:	48 89 e5             	mov    %rsp,%rbp
 7cd:	5d                   	pop    %rbp
 7ce:	c3                   	retq   
 7cf:	90                   	nop

00000000000007d0 <get_arg5>:
 7d0:	e8 00 00 00 00       	callq  7d5 <get_arg5+0x5>
 7d5:	55                   	push   %rbp
 7d6:	48 8b 47 40          	mov    0x40(%rdi),%rax
 7da:	48 89 e5             	mov    %rsp,%rbp
 7dd:	5d                   	pop    %rbp
 7de:	c3                   	retq   
 7df:	90                   	nop

00000000000007e0 <get_syscall_name>:
 7e0:	e8 00 00 00 00       	callq  7e5 <get_syscall_name+0x5>
 7e5:	55                   	push   %rbp
 7e6:	48 63 c7             	movslq %edi,%rax
 7e9:	48 c1 e0 05          	shl    $0x5,%rax
 7ed:	48 89 e5             	mov    %rsp,%rbp
 7f0:	48 05 00 00 00 00    	add    $0x0,%rax
 7f6:	5d                   	pop    %rbp
 7f7:	c3                   	retq   
 7f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 7ff:	00 

0000000000000800 <gen_record_str>:
 800:	e8 00 00 00 00       	callq  805 <gen_record_str+0x5>
 805:	55                   	push   %rbp
 806:	48 c1 e2 05          	shl    $0x5,%rdx
 80a:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 811:	00 00 
 813:	48 8d 8a 00 00 00 00 	lea    0x0(%rdx),%rcx
 81a:	48 05 50 0a 00 00    	add    $0xa50,%rax
 820:	8b 90 58 fe ff ff    	mov    -0x1a8(%rax),%edx
 826:	48 89 e5             	mov    %rsp,%rbp
 829:	50                   	push   %rax
 82a:	ff 76 40             	pushq  0x40(%rsi)
 82d:	ff 76 48             	pushq  0x48(%rsi)
 830:	ff 76 38             	pushq  0x38(%rsi)
 833:	ff 76 60             	pushq  0x60(%rsi)
 836:	ff 76 68             	pushq  0x68(%rsi)
 839:	4c 8b 4e 70          	mov    0x70(%rsi),%r9
 83d:	4c 8b 46 50          	mov    0x50(%rsi),%r8
 841:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 848:	e8 00 00 00 00       	callq  84d <gen_record_str+0x4d>
 84d:	48 83 c4 30          	add    $0x30,%rsp
 851:	c9                   	leaveq 
 852:	c3                   	retq   
 853:	0f 1f 00             	nopl   (%rax)
 856:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 85d:	00 00 00 

0000000000000860 <syscall_exit_probe.part.3>:
 860:	e8 00 00 00 00       	callq  865 <syscall_exit_probe.part.3+0x5>
 865:	55                   	push   %rbp
 866:	48 89 e5             	mov    %rsp,%rbp
 869:	41 55                	push   %r13
 86b:	41 54                	push   %r12
 86d:	53                   	push   %rbx
 86e:	48 89 fb             	mov    %rdi,%rbx
 871:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 878:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
 87f:	65 48 8b 04 25 28 00 	mov    %gs:0x28,%rax
 886:	00 00 
 888:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
 88c:	31 c0                	xor    %eax,%eax
 88e:	e8 00 00 00 00       	callq  893 <syscall_exit_probe.part.3+0x33>
 893:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 89a:	00 00 
 89c:	8b 88 a8 08 00 00    	mov    0x8a8(%rax),%ecx
 8a2:	ba 37 48 60 80       	mov    $0x80604837,%edx
 8a7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 8ae:	89 c8                	mov    %ecx,%eax
 8b0:	89 ce                	mov    %ecx,%esi
 8b2:	f7 ea                	imul   %edx
 8b4:	8d 04 0a             	lea    (%rdx,%rcx,1),%eax
 8b7:	89 ca                	mov    %ecx,%edx
 8b9:	c1 fa 1f             	sar    $0x1f,%edx
 8bc:	c1 f8 09             	sar    $0x9,%eax
 8bf:	29 d0                	sub    %edx,%eax
 8c1:	69 c0 fd 03 00 00    	imul   $0x3fd,%eax,%eax
 8c7:	29 c6                	sub    %eax,%esi
 8c9:	48 63 c6             	movslq %esi,%rax
 8cc:	48 63 04 85 00 00 00 	movslq 0x0(,%rax,4),%rax
 8d3:	00 
 8d4:	85 c0                	test   %eax,%eax
 8d6:	75 0e                	jne    8e6 <syscall_exit_probe.part.3+0x86>
 8d8:	eb 23                	jmp    8fd <syscall_exit_probe.part.3+0x9d>
 8da:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 8de:	48 63 04 c7          	movslq (%rdi,%rax,8),%rax
 8e2:	85 c0                	test   %eax,%eax
 8e4:	74 17                	je     8fd <syscall_exit_probe.part.3+0x9d>
 8e6:	48 8d 14 40          	lea    (%rax,%rax,2),%rdx
 8ea:	3b 4c d7 04          	cmp    0x4(%rdi,%rdx,8),%ecx
 8ee:	75 ea                	jne    8da <syscall_exit_probe.part.3+0x7a>
 8f0:	be 52 bf 01 00       	mov    $0x1bf52,%esi
 8f5:	41 b8 52 bf 01 00    	mov    $0x1bf52,%r8d
 8fb:	eb 10                	jmp    90d <syscall_exit_probe.part.3+0xad>
 8fd:	4c 8b 04 25 00 00 00 	mov    0x0,%r8
 904:	00 
 905:	48 8b 34 25 08 00 00 	mov    0x8,%rsi
 90c:	00 
 90d:	65 48 8b 04 25 00 00 	mov    %gs:0x0,%rax
 914:	00 00 
 916:	44 8b 88 a8 08 00 00 	mov    0x8a8(%rax),%r9d
 91d:	ba 37 48 60 80       	mov    $0x80604837,%edx
 922:	44 89 c8             	mov    %r9d,%eax
 925:	f7 ea                	imul   %edx
 927:	44 89 c8             	mov    %r9d,%eax
 92a:	c1 f8 1f             	sar    $0x1f,%eax
 92d:	44 01 ca             	add    %r9d,%edx
 930:	c1 fa 09             	sar    $0x9,%edx
 933:	29 c2                	sub    %eax,%edx
 935:	44 89 c8             	mov    %r9d,%eax
 938:	69 d2 fd 03 00 00    	imul   $0x3fd,%edx,%edx
 93e:	29 d0                	sub    %edx,%eax
 940:	48 63 d0             	movslq %eax,%rdx
 943:	4c 63 1c 95 00 00 00 	movslq 0x0(,%rdx,4),%r11
 94a:	00 
 94b:	45 85 db             	test   %r11d,%r11d
 94e:	74 3a                	je     98a <syscall_exit_probe.part.3+0x12a>
 950:	49 63 c3             	movslq %r11d,%rax
 953:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 957:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
 95b:	44 39 48 04          	cmp    %r9d,0x4(%rax)
 95f:	8b 08                	mov    (%rax),%ecx
 961:	75 23                	jne    986 <syscall_exit_probe.part.3+0x126>
 963:	e9 67 01 00 00       	jmpq   acf <syscall_exit_probe.part.3+0x26f>
 968:	48 63 c1             	movslq %ecx,%rax
 96b:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
 96f:	48 8d 04 c7          	lea    (%rdi,%rax,8),%rax
 973:	44 3b 48 04          	cmp    0x4(%rax),%r9d
 977:	44 8b 10             	mov    (%rax),%r10d
 97a:	0f 84 e0 00 00 00    	je     a60 <syscall_exit_probe.part.3+0x200>
 980:	4c 63 d9             	movslq %ecx,%r11
 983:	44 89 d1             	mov    %r10d,%ecx
 986:	85 c9                	test   %ecx,%ecx
 988:	75 de                	jne    968 <syscall_exit_probe.part.3+0x108>
 98a:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12
 991:	4c 89 e7             	mov    %r12,%rdi
 994:	ff 14 25 00 00 00 00 	callq  *0x0
 99b:	ff 14 25 00 00 00 00 	callq  *0x0
 9a2:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
 9a9:	48 89 f1             	mov    %rsi,%rcx
 9ac:	4c 89 c2             	mov    %r8,%rdx
 9af:	48 89 de             	mov    %rbx,%rsi
 9b2:	e8 00 00 00 00       	callq  9b7 <syscall_exit_probe.part.3+0x157>
 9b7:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
 9be:	be 80 00 00 00       	mov    $0x80,%esi
 9c3:	e8 00 00 00 00       	callq  9c8 <syscall_exit_probe.part.3+0x168>
 9c8:	48 3d 80 00 00 00    	cmp    $0x80,%rax
 9ce:	48 89 c3             	mov    %rax,%rbx
 9d1:	0f 87 20 01 00 00    	ja     af7 <syscall_exit_probe.part.3+0x297>
 9d7:	0f 84 0e 01 00 00    	je     aeb <syscall_exit_probe.part.3+0x28b>
 9dd:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 9e4 <syscall_exit_probe.part.3+0x184>
 9e4:	48 01 d8             	add    %rbx,%rax
 9e7:	48 3d ff ff 7f 00    	cmp    $0x7fffff,%rax
 9ed:	0f 87 ad 00 00 00    	ja     aa0 <syscall_exit_probe.part.3+0x240>
 9f3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 9fa:	e8 00 00 00 00       	callq  9ff <syscall_exit_probe.part.3+0x19f>
 9ff:	4c 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13        # a06 <syscall_exit_probe.part.3+0x1a6>
 a06:	48 8d b5 60 ff ff ff 	lea    -0xa0(%rbp),%rsi
 a0d:	48 89 da             	mov    %rbx,%rdx
 a10:	49 8d bd 00 00 00 00 	lea    0x0(%r13),%rdi
 a17:	4c 01 eb             	add    %r13,%rbx
 a1a:	e8 00 00 00 00       	callq  a1f <syscall_exit_probe.part.3+0x1bf>
 a1f:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # a26 <syscall_exit_probe.part.3+0x1c6>
 a26:	48 83 05 00 00 00 00 	addq   $0x1,0x0(%rip)        # a2e <syscall_exit_probe.part.3+0x1ce>
 a2d:	01 
 a2e:	4c 89 e7             	mov    %r12,%rdi
 a31:	ff 14 25 00 00 00 00 	callq  *0x0
 a38:	ff 14 25 00 00 00 00 	callq  *0x0
 a3f:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 a43:	65 48 33 04 25 28 00 	xor    %gs:0x28,%rax
 a4a:	00 00 
 a4c:	0f 85 94 00 00 00    	jne    ae6 <syscall_exit_probe.part.3+0x286>
 a52:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
 a59:	5b                   	pop    %rbx
 a5a:	41 5c                	pop    %r12
 a5c:	41 5d                	pop    %r13
 a5e:	5d                   	pop    %rbp
 a5f:	c3                   	retq   
 a60:	45 85 db             	test   %r11d,%r11d
 a63:	7e 70                	jle    ad5 <syscall_exit_probe.part.3+0x275>
 a65:	4b 8d 04 5b          	lea    (%r11,%r11,2),%rax
 a69:	44 89 14 c7          	mov    %r10d,(%rdi,%rax,8)
 a6d:	89 c8                	mov    %ecx,%eax
 a6f:	ba 89 88 88 88       	mov    $0x88888889,%edx
 a74:	f7 ea                	imul   %edx
 a76:	89 c8                	mov    %ecx,%eax
 a78:	c1 f8 1f             	sar    $0x1f,%eax
 a7b:	01 ca                	add    %ecx,%edx
 a7d:	c1 fa 04             	sar    $0x4,%edx
 a80:	29 c2                	sub    %eax,%edx
 a82:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
 a87:	48 63 fa             	movslq %edx,%rdi
 a8a:	6b d2 1e             	imul   $0x1e,%edx,%edx
 a8d:	29 d1                	sub    %edx,%ecx
 a8f:	d3 c0                	rol    %cl,%eax
 a91:	48 98                	cltq   
 a93:	48 21 04 fd 00 00 00 	and    %rax,0x0(,%rdi,8)
 a9a:	00 
 a9b:	e9 ea fe ff ff       	jmpq   98a <syscall_exit_probe.part.3+0x12a>
 aa0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 aa7:	e8 00 00 00 00       	callq  aac <syscall_exit_probe.part.3+0x24c>
 aac:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # ab3 <syscall_exit_probe.part.3+0x253>
 ab3:	48 01 d8             	add    %rbx,%rax
 ab6:	48 3d ff ff 7f 00    	cmp    $0x7fffff,%rax
 abc:	77 21                	ja     adf <syscall_exit_probe.part.3+0x27f>
 abe:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 ac5:	e8 00 00 00 00       	callq  aca <syscall_exit_probe.part.3+0x26a>
 aca:	e9 24 ff ff ff       	jmpq   9f3 <syscall_exit_probe.part.3+0x193>
 acf:	41 89 ca             	mov    %ecx,%r10d
 ad2:	44 89 d9             	mov    %r11d,%ecx
 ad5:	44 89 14 95 00 00 00 	mov    %r10d,0x0(,%rdx,4)
 adc:	00 
 add:	eb 8e                	jmp    a6d <syscall_exit_probe.part.3+0x20d>
 adf:	e8 2c fc ff ff       	callq  710 <dump_to_file>
 ae4:	eb d8                	jmp    abe <syscall_exit_probe.part.3+0x25e>
 ae6:	e8 00 00 00 00       	callq  aeb <syscall_exit_probe.part.3+0x28b>
 aeb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 af2:	e8 00 00 00 00       	callq  af7 <syscall_exit_probe.part.3+0x297>
 af7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 afe:	e8 00 00 00 00       	callq  b03 <syscall_exit_probe.part.3+0x2a3>
 b03:	0f 1f 00             	nopl   (%rax)
 b06:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 b0d:	00 00 00 

0000000000000b10 <syscall_exit_probe>:
 b10:	e8 00 00 00 00       	callq  b15 <syscall_exit_probe+0x5>
 b15:	55                   	push   %rbp
 b16:	48 89 e5             	mov    %rsp,%rbp
 b19:	48 83 ec 08          	sub    $0x8,%rsp
 b1d:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # b23 <syscall_exit_probe+0x13>
 b23:	85 c0                	test   %eax,%eax
 b25:	74 18                	je     b3f <syscall_exit_probe+0x2f>
 b27:	65 48 8b 14 25 00 00 	mov    %gs:0x0,%rdx
 b2e:	00 00 
 b30:	39 82 a8 08 00 00    	cmp    %eax,0x8a8(%rdx)
 b36:	0f 94 c0             	sete   %al
 b39:	84 c0                	test   %al,%al
 b3b:	75 0e                	jne    b4b <syscall_exit_probe+0x3b>
 b3d:	c9                   	leaveq 
 b3e:	c3                   	retq   
 b3f:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # b46 <syscall_exit_probe+0x36>
 b46:	80 3f 00             	cmpb   $0x0,(%rdi)
 b49:	75 0a                	jne    b55 <syscall_exit_probe+0x45>
 b4b:	48 89 f7             	mov    %rsi,%rdi
 b4e:	e8 0d fd ff ff       	callq  860 <syscall_exit_probe.part.3>
 b53:	c9                   	leaveq 
 b54:	c3                   	retq   
 b55:	48 89 75 f8          	mov    %rsi,-0x8(%rbp)
 b59:	e8 00 00 00 00       	callq  b5e <syscall_exit_probe+0x4e>
 b5e:	48 8b 75 f8          	mov    -0x8(%rbp),%rsi
 b62:	eb d5                	jmp    b39 <syscall_exit_probe+0x29>

Disassembly of section .text.unlikely:

0000000000000000 <cleanup>:
   0:	e8 00 00 00 00       	callq  5 <cleanup+0x5>
   5:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # c <cleanup+0xc>
   c:	55                   	push   %rbp
   d:	48 89 e5             	mov    %rsp,%rbp
  10:	74 1a                	je     2c <cleanup+0x2c>
  12:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 19 <cleanup+0x19>
  19:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 20 <cleanup+0x20>
  20:	31 d2                	xor    %edx,%edx
  22:	e8 00 00 00 00       	callq  27 <cleanup+0x27>
  27:	e8 00 00 00 00       	callq  2c <cleanup+0x2c>
  2c:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 33 <cleanup+0x33>
  33:	74 1a                	je     4f <cleanup+0x4f>
  35:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 3c <cleanup+0x3c>
  3c:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 43 <cleanup+0x43>
  43:	31 d2                	xor    %edx,%edx
  45:	e8 00 00 00 00       	callq  4a <cleanup+0x4a>
  4a:	e8 00 00 00 00       	callq  4f <cleanup+0x4f>
  4f:	5d                   	pop    %rbp
  50:	c3                   	retq   

Disassembly of section .exit.text:

0000000000000000 <cleanup_module>:
   0:	55                   	push   %rbp
   1:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 8 <cleanup_module+0x8>
   8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
   f:	48 89 e5             	mov    %rsp,%rbp
  12:	e8 00 00 00 00       	callq  17 <cleanup_module+0x17>
  17:	48 8b 35 00 00 00 00 	mov    0x0(%rip),%rsi        # 1e <cleanup_module+0x1e>
  1e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  25:	e8 00 00 00 00       	callq  2a <cleanup_module+0x2a>
  2a:	e8 00 00 00 00       	callq  2f <cleanup_module+0x2f>
  2f:	e8 00 00 00 00       	callq  34 <cleanup_module+0x34>
  34:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 3b <cleanup_module+0x3b>
  3b:	31 f6                	xor    %esi,%esi
  3d:	e8 00 00 00 00       	callq  42 <cleanup_module+0x42>
  42:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  49:	e8 00 00 00 00       	callq  4e <cleanup_module+0x4e>
  4e:	5d                   	pop    %rbp
  4f:	c3                   	retq   

Disassembly of section .init.text:

0000000000000000 <init_module>:
   0:	e8 00 00 00 00       	callq  5 <init_module+0x5>
   5:	55                   	push   %rbp
   6:	ba c0 01 00 00       	mov    $0x1c0,%edx
   b:	be 42 00 00 00       	mov    $0x42,%esi
  10:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  17:	48 89 e5             	mov    %rsp,%rbp
  1a:	41 55                	push   %r13
  1c:	41 54                	push   %r12
  1e:	53                   	push   %rbx
  1f:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx
  26:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12
  2d:	4c 8d 6b 40          	lea    0x40(%rbx),%r13
  31:	e8 00 00 00 00       	callq  36 <init_module+0x36>
  36:	31 f6                	xor    %esi,%esi
  38:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  3f:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 46 <init_module+0x46>
  46:	c7 05 00 00 00 00 00 	movl   $0x0,0x0(%rip)        # 50 <init_module+0x50>
  4d:	00 00 00 
  50:	e8 00 00 00 00       	callq  55 <init_module+0x55>
  55:	4c 39 eb             	cmp    %r13,%rbx
  58:	74 30                	je     8a <init_module+0x8a>
  5a:	48 83 7b 10 00       	cmpq   $0x0,0x10(%rbx)
  5f:	75 10                	jne    71 <init_module+0x71>
  61:	48 8b 33             	mov    (%rbx),%rsi
  64:	4c 89 e7             	mov    %r12,%rdi
  67:	e8 00 00 00 00       	callq  6c <init_module+0x6c>
  6c:	e8 00 00 00 00       	callq  71 <init_module+0x71>
  71:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  75:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  79:	31 d2                	xor    %edx,%edx
  7b:	c6 43 18 01          	movb   $0x1,0x18(%rbx)
  7f:	48 83 c3 20          	add    $0x20,%rbx
  83:	e8 00 00 00 00       	callq  88 <init_module+0x88>
  88:	eb cb                	jmp    55 <init_module+0x55>
  8a:	48 8b 15 00 00 00 00 	mov    0x0(%rip),%rdx        # 91 <init_module+0x91>
  91:	8b 35 00 00 00 00    	mov    0x0(%rip),%esi        # 97 <init_module+0x97>
  97:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  9e:	e8 00 00 00 00       	callq  a3 <init_module+0xa3>
  a3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  aa:	e8 00 00 00 00       	callq  af <init_module+0xaf>
  af:	31 c0                	xor    %eax,%eax
  b1:	5b                   	pop    %rbx
  b2:	41 5c                	pop    %r12
  b4:	41 5d                	pop    %r13
  b6:	5d                   	pop    %rbp
  b7:	c3                   	retq   

Disassembly of section .parainstructions:

0000000000000000 <.parainstructions>:
	...
   8:	54                   	push   %rsp
   9:	07                   	(bad)  
   a:	01 00                	add    %eax,(%rax)
	...
  18:	28 07                	sub    %al,(%rdi)
  1a:	01 00                	add    %eax,(%rax)
	...
  28:	54                   	push   %rsp
  29:	07                   	(bad)  
  2a:	01 00                	add    %eax,(%rax)
	...
  38:	28 07                	sub    %al,(%rdi)
  3a:	01 00                	add    %eax,(%rax)
	...
  48:	54                   	push   %rsp
  49:	07                   	(bad)  
  4a:	01 00                	add    %eax,(%rax)
	...
  58:	28 07                	sub    %al,(%rdi)
  5a:	01 00                	add    %eax,(%rax)

Disassembly of section .rodata.str1.1:

0000000000000000 <.rodata.str1.1>:
   0:	26 66 69 6c 65 5f 77 	imul   $0x7277,%es:0x5f(%rbp,%riz,2),%bp
   7:	72 
   8:	69 74 65 5f 6d 75 74 	imul   $0x6574756d,0x5f(%rbp,%riz,2),%esi
   f:	65 
  10:	78 00                	js     12 <.rodata.str1.1+0x12>
  12:	73 74                	jae    88 <__UNIQUE_ID_pidtype88>
  14:	61                   	(bad)  
  15:	74 69                	je     80 <__UNIQUE_ID_proc_nametype89+0x11>
  17:	73 74                	jae    8d <__UNIQUE_ID_pidtype88+0x5>
  19:	69 63 73 3a 20 25 6c 	imul   $0x6c25203a,0x73(%rbx),%esp
  20:	6c                   	insb   (%dx),%es:(%rdi)
  21:	75 0a                	jne    2d <.rodata.str1.1+0x2d>
  23:	00 2f                	add    %ch,(%rdi)
  25:	65 74 63             	gs je  8b <__UNIQUE_ID_pidtype88+0x3>
  28:	2f                   	(bad)  
  29:	73 79                	jae    a4 <__UNIQUE_ID_srcversion30+0x4>
  2b:	73 63                	jae    90 <bitset_get>
  2d:	61                   	(bad)  
  2e:	6c                   	insb   (%dx),%es:(%rdi)
  2f:	6c                   	insb   (%dx),%es:(%rdi)
  30:	2d 72 65 63 6f       	sub    $0x6f636572,%eax
  35:	72 64                	jb     9b <bitset_get+0xb>
  37:	2f                   	(bad)  
  38:	72 65                	jb     9f <bitset_get+0xf>
  3a:	63 6f 72             	movslq 0x72(%rdi),%ebp
  3d:	64 00 45 72          	add    %al,%fs:0x72(%rbp)
  41:	72 6f                	jb     b2 <__UNIQUE_ID_srcversion30+0x12>
  43:	72 2c                	jb     71 <__UNIQUE_ID_proc_nametype89+0x2>
  45:	20 25 73 20 6e 6f    	and    %ah,0x6f6e2073(%rip)        # 6f6e20be <pid+0x6eedaf8e>
  4b:	74 20                	je     6d <__UNIQUE_ID_license101+0xa>
  4d:	66 6f                	outsw  %ds:(%rsi),(%dx)
  4f:	75 6e                	jne    bf <__UNIQUE_ID_srcversion30+0x1f>
  51:	64 0a 00             	or     %fs:(%rax),%al
  54:	73 79                	jae    cf <__module_depends+0x7>
  56:	73 5f                	jae    b7 <__UNIQUE_ID_srcversion30+0x17>
  58:	65 6e                	outsb  %gs:(%rsi),(%dx)
  5a:	74 65                	je     c1 <__UNIQUE_ID_srcversion30+0x21>
  5c:	72 00                	jb     5e <.rodata.str1.1+0x5e>
  5e:	73 79                	jae    d9 <__UNIQUE_ID_retpoline29+0x8>
  60:	73 5f                	jae    c1 <__UNIQUE_ID_srcversion30+0x21>
  62:	65 78 69             	gs js  ce <__module_depends+0x6>
  65:	74 00                	je     67 <.rodata.str1.1+0x67>
	...

Disassembly of section .smp_locks:

0000000000000000 <.smp_locks>:
	...

Disassembly of section .rodata.str1.8:

0000000000000000 <.rodata.str1.8>:
   0:	69 74 20 69 73 20 74 	imul   $0x69742073,0x69(%rax,%riz,1),%esi
   7:	69 
   8:	6d                   	insl   (%dx),%es:(%rdi)
   9:	65 20 74 6f 20       	and    %dh,%gs:0x20(%rdi,%rbp,2)
   e:	64 75 6d             	fs jne 7e <.rodata.str1.8+0x7e>
  11:	70 20                	jo     33 <.rodata.str1.8+0x33>
  13:	72 65                	jb     7a <.rodata.str1.8+0x7a>
  15:	63 6f 72             	movslq 0x72(%rdi),%ebp
  18:	64 73 20             	fs jae 3b <.rodata.str1.8+0x3b>
  1b:	74 6f                	je     8c <.rodata.str1.8+0x8c>
  1d:	20 66 69             	and    %ah,0x69(%rsi)
  20:	6c                   	insb   (%dx),%es:(%rdi)
  21:	65 20 77 69          	and    %dh,%gs:0x69(%rdi)
  25:	74 68                	je     8f <.rodata.str1.8+0x8f>
  27:	20 6f 66             	and    %ch,0x66(%rdi)
  2a:	66 73 65             	data16 jae 92 <.rodata.str1.8+0x92>
  2d:	74 3a                	je     69 <.rodata.str1.8+0x69>
  2f:	20 25 6c 64 2c 20    	and    %ah,0x202c646c(%rip)        # 202c64a1 <pid+0x1fabf371>
  35:	63 75 72             	movslq 0x72(%rbp),%esi
  38:	72 65                	jb     9f <.rodata.str1.8+0x9f>
  3a:	6e                   	outsb  %ds:(%rsi),(%dx)
  3b:	74 20                	je     5d <.rodata.str1.8+0x5d>
  3d:	73 74                	jae    b3 <.rodata.str1.8+0xb3>
  3f:	61                   	(bad)  
  40:	74 3a                	je     7c <.rodata.str1.8+0x7c>
  42:	20 25 6c 6c 64 00    	and    %ah,0x646c6c(%rip)        # 646cb4 <real_buffer+0x63fbb4>
  48:	70 69                	jo     b3 <.rodata.str1.8+0xb3>
  4a:	64 3d 25 64 2c 20    	fs cmp $0x202c6425,%eax
  50:	25 73 2c 20 72       	and    $0x72202c73,%eax
  55:	65 74 3d             	gs je  95 <.rodata.str1.8+0x95>
  58:	30 78 25             	xor    %bh,0x25(%rax)
  5b:	6c                   	insb   (%dx),%es:(%rdi)
  5c:	78 2c                	js     8a <.rodata.str1.8+0x8a>
  5e:	20 61 72             	and    %ah,0x72(%rcx)
  61:	67 30 3d 30 78 25 6c 	xor    %bh,0x6c257830(%eip)        # 6c257898 <pid+0x6ba50768>
  68:	78 2c                	js     96 <.rodata.str1.8+0x96>
  6a:	20 61 72             	and    %ah,0x72(%rcx)
  6d:	67 31 3d 30 78 25 6c 	xor    %edi,0x6c257830(%eip)        # 6c2578a4 <pid+0x6ba50774>
  74:	78 2c                	js     a2 <.rodata.str1.8+0xa2>
  76:	20 61 72             	and    %ah,0x72(%rcx)
  79:	67 32 3d 30 78 25 6c 	xor    0x6c257830(%eip),%bh        # 6c2578b0 <pid+0x6ba50780>
  80:	78 2c                	js     ae <.rodata.str1.8+0xae>
  82:	20 61 72             	and    %ah,0x72(%rcx)
  85:	67 33 3d 30 78 25 6c 	xor    0x6c257830(%eip),%edi        # 6c2578bc <pid+0x6ba5078c>
  8c:	78 20                	js     ae <.rodata.str1.8+0xae>
  8e:	2c 61                	sub    $0x61,%al
  90:	72 67                	jb     f9 <.rodata.str1.8+0xf9>
  92:	34 3d                	xor    $0x3d,%al
  94:	30 78 25             	xor    %bh,0x25(%rax)
  97:	6c                   	insb   (%dx),%es:(%rdi)
  98:	78 2c                	js     c6 <.rodata.str1.8+0xc6>
  9a:	20 61 72             	and    %ah,0x72(%rcx)
  9d:	67 35 3d 30 78 25    	addr32 xor $0x2578303d,%eax
  a3:	6c                   	insb   (%dx),%es:(%rdi)
  a4:	78 20                	js     c6 <.rodata.str1.8+0xc6>
  a6:	6e                   	outsb  %ds:(%rsi),(%dx)
  a7:	61                   	(bad)  
  a8:	6d                   	insl   (%dx),%es:(%rdi)
  a9:	65 3d 25 73 0a 00    	gs cmp $0xa7325,%eax
  af:	00 73 61             	add    %dh,0x61(%rbx)
  b2:	76 69                	jbe    11d <.rodata.str1.8+0x11d>
  b4:	6e                   	outsb  %ds:(%rsi),(%dx)
  b5:	67 20 74 6f 20       	and    %dh,0x20(%edi,%ebp,2)
  ba:	66 69 6c 65 2e 2e 2e 	imul   $0x2e2e,0x2e(%rbp,%riz,2),%bp
  c1:	77 69                	ja     12c <.rodata.str1.8+0x12c>
  c3:	74 68                	je     12d <.rodata.str1.8+0x12d>
  c5:	20 6c 65 6e          	and    %ch,0x6e(%rbp,%riz,2)
  c9:	67 74 68             	addr32 je 134 <.rodata.str1.8+0x134>
  cc:	3a 20                	cmp    (%rax),%ah
  ce:	25 6c 75 00 00       	and    $0x756c,%eax
  d3:	00 00                	add    %al,(%rax)
  d5:	00 00                	add    %al,(%rax)
  d7:	00 5b 6d             	add    %bl,0x6d(%rbx)
  da:	79 5f                	jns    13b <.rodata.str1.8+0x13b>
  dc:	73 79                	jae    157 <hashtable_get+0x27>
  de:	73 64                	jae    144 <.rodata.str1.8+0x144>
  e0:	69 67 3a 5d 20 72 65 	imul   $0x6572205d,0x3a(%rdi),%esp
  e7:	6d                   	insl   (%dx),%es:(%rdi)
  e8:	6f                   	outsl  %ds:(%rsi),(%dx)
  e9:	76 65                	jbe    150 <.rodata.str1.8+0x150>
  eb:	20 6d 79             	and    %ch,0x79(%rbp)
  ee:	5f                   	pop    %rdi
  ef:	73 79                	jae    16a <hashtable_get+0x3a>
  f1:	73 64                	jae    157 <hashtable_get+0x27>
  f3:	69 67 20 73 75 63 63 	imul   $0x63637573,0x20(%rdi),%esp
  fa:	65 73 73             	gs jae 170 <hashtable_get+0x40>
  fd:	66 75 6c             	data16 jne 16c <hashtable_get+0x3c>
 100:	6c                   	insb   (%dx),%es:(%rdi)
 101:	79 00                	jns    103 <.rodata.str1.8+0x103>
 103:	00 00                	add    %al,(%rax)
 105:	00 00                	add    %al,(%rax)
 107:	00 01                	add    %al,(%rcx)
 109:	36 5b                	ss pop %rbx
 10b:	6d                   	insl   (%dx),%es:(%rdi)
 10c:	79 5f                	jns    16d <hashtable_get+0x3d>
 10e:	73 79                	jae    189 <hashtable_get+0x59>
 110:	73 64                	jae    176 <hashtable_get+0x46>
 112:	69 67 3a 5d 20 70 69 	imul   $0x6970205d,0x3a(%rdi),%esp
 119:	64 3d 25 64 20 61    	fs cmp $0x61206425,%eax
 11f:	6e                   	outsb  %ds:(%rsi),(%dx)
 120:	64 20 70 72          	and    %dh,%fs:0x72(%rax)
 124:	6f                   	outsl  %ds:(%rsi),(%dx)
 125:	63 5f 6e             	movslq 0x6e(%rdi),%ebx
 128:	61                   	(bad)  
 129:	6d                   	insl   (%dx),%es:(%rdi)
 12a:	65 3d 25 73 00 00    	gs cmp $0x7325,%eax
 130:	01 36                	add    %esi,(%rsi)
 132:	5b                   	pop    %rbx
 133:	6d                   	insl   (%dx),%es:(%rdi)
 134:	79 5f                	jns    195 <hashtable_get+0x65>
 136:	73 79                	jae    1b1 <hashtable_modify+0x11>
 138:	73 64                	jae    19e <hashtable_get+0x6e>
 13a:	69 67 3a 5d 20 6c 6f 	imul   $0x6f6c205d,0x3a(%rdi),%esp
 141:	61                   	(bad)  
 142:	64 20 73 75          	and    %dh,%fs:0x75(%rbx)
 146:	63 63 65             	movslq 0x65(%rbx),%esp
 149:	73 73                	jae    1be <hashtable_modify+0x1e>
 14b:	66 75 6c             	data16 jne 1ba <hashtable_modify+0x1a>
 14e:	6c                   	insb   (%dx),%es:(%rdi)
 14f:	79 21                	jns    172 <hashtable_get+0x42>
	...

Disassembly of section .rodata:

0000000000000000 <__func__.5297>:
   0:	73 74                	jae    76 <__UNIQUE_ID_proc_nametype89+0x7>
   2:	72 6e                	jb     72 <__UNIQUE_ID_proc_nametype89+0x3>
   4:	6c                   	insb   (%dx),%es:(%rdi)
   5:	65 6e                	outsb  %gs:(%rsi),(%dx)
	...

0000000000000008 <__func__.5287>:
   8:	73 74                	jae    7e <__UNIQUE_ID_proc_nametype89+0xf>
   a:	72 6c                	jb     78 <__UNIQUE_ID_proc_nametype89+0x9>
   c:	65 6e                	outsb  %gs:(%rsi),(%dx)
	...

0000000000000010 <MAX_STR_LENGTH>:
  10:	0f 00 00             	sldt   (%rax)
  13:	00 00                	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
	...

0000000000000018 <__param_str_proc_name>:
  18:	70 72                	jo     8c <__UNIQUE_ID_pidtype88+0x4>
  1a:	6f                   	outsl  %ds:(%rsi),(%dx)
  1b:	63 5f 6e             	movslq 0x6e(%rdi),%ebx
  1e:	61                   	(bad)  
  1f:	6d                   	insl   (%dx),%es:(%rdi)
  20:	65 00            	add    %dh,%gs:0x69(%rax)

0000000000000022 <__param_str_pid>:
  22:	70 69                	jo     8d <__UNIQUE_ID_pidtype88+0x5>
  24:	64                   	fs
	...

Disassembly of section .modinfo:

0000000000000000 <__UNIQUE_ID_license105>:
   0:	6c                   	insb   (%dx),%es:(%rdi)
   1:	69 63 65 6e 73 65 3d 	imul   $0x3d65736e,0x65(%rbx),%esp
   8:	47 50                	rex.RXB push %r8
   a:	4c 00            	rex.WR add %r14b,0x65(%rsi)

000000000000000c <__UNIQUE_ID_version104>:
   c:	76 65                	jbe    73 <__UNIQUE_ID_proc_nametype89+0x4>
   e:	72 73                	jb     83 <__UNIQUE_ID_proc_nametype89+0x14>
  10:	69 6f 6e 3d 30 2e 30 	imul   $0x302e303d,0x6e(%rdi),%ebp
  17:	31 00                	xor    %eax,(%rax)

0000000000000019 <__UNIQUE_ID_description103>:
  19:	64 65 73 63          	fs gs jae 80 <__UNIQUE_ID_proc_nametype89+0x11>
  1d:	72 69                	jb     88 <__UNIQUE_ID_pidtype88>
  1f:	70 74                	jo     95 <__UNIQUE_ID_pidtype88+0xd>
  21:	69 6f 6e 3d 41 20 4c 	imul   $0x4c20413d,0x6e(%rdi),%ebp
  28:	69 6e 75 78 20 6b 65 	imul   $0x656b2078,0x75(%rsi),%ebp
  2f:	6e                   	outsb  %ds:(%rsi),(%dx)
  30:	72 65                	jb     97 <__UNIQUE_ID_pidtype88+0xf>
  32:	6c                   	insb   (%dx),%es:(%rdi)
  33:	20 6d 6f             	and    %ch,0x6f(%rbp)
  36:	64 75 6c             	fs jne a5 <__UNIQUE_ID_srcversion30+0x5>
  39:	65 20 66 6f          	and    %ah,%gs:0x6f(%rsi)
  3d:	72 20                	jb     5f <__UNIQUE_ID_author102+0xd>
  3f:	63 61 70             	movslq 0x70(%rcx),%esp
  42:	74 75                	je     b9 <__UNIQUE_ID_srcversion30+0x19>
  44:	72 69                	jb     af <__UNIQUE_ID_srcversion30+0xf>
  46:	6e                   	outsb  %ds:(%rsi),(%dx)
  47:	67 20 73 79          	and    %dh,0x79(%ebx)
  4b:	73 63                	jae    b0 <__UNIQUE_ID_srcversion30+0x10>
  4d:	61                   	(bad)  
  4e:	6c                   	insb   (%dx),%es:(%rdi)
  4f:	6c                   	insb   (%dx),%es:(%rdi)
  50:	73 00                	jae    52 <__UNIQUE_ID_author102>

0000000000000052 <__UNIQUE_ID_author102>:
  52:	61                   	(bad)  
  53:	75 74                	jne    c9 <__module_depends+0x1>
  55:	68 6f 72 3d 48       	pushq  $0x483d726f
  5a:	75 61                	jne    bd <__UNIQUE_ID_srcversion30+0x1d>
  5c:	6e                   	outsb  %ds:(%rsi),(%dx)
  5d:	61                   	(bad)  
  5e:	20 4c 69 75          	and    %cl,0x75(%rcx,%rbp,2)
	...

0000000000000063 <__UNIQUE_ID_license101>:
  63:	6c                   	insb   (%dx),%es:(%rdi)
  64:	69 63 65 6e 73 65 3d 	imul   $0x3d65736e,0x65(%rbx),%esp
  6b:	47 50                	rex.RXB push %r8
  6d:	4c 00            	rex.WR add %r14b,0x61(%rax)

000000000000006f <__UNIQUE_ID_proc_nametype89>:
  6f:	70 61                	jo     d2 <__UNIQUE_ID_retpoline29+0x1>
  71:	72 6d                	jb     e0 <__UNIQUE_ID_name28+0x3>
  73:	74 79                	je     ee <__UNIQUE_ID_vermagic27+0x2>
  75:	70 65                	jo     dc <__UNIQUE_ID_retpoline29+0xb>
  77:	3d 70 72 6f 63       	cmp    $0x636f7270,%eax
  7c:	5f                   	pop    %rdi
  7d:	6e                   	outsb  %ds:(%rsi),(%dx)
  7e:	61                   	(bad)  
  7f:	6d                   	insl   (%dx),%es:(%rdi)
  80:	65 3a 63 68          	cmp    %gs:0x68(%rbx),%ah
  84:	61                   	(bad)  
  85:	72 70                	jb     f7 <__UNIQUE_ID_vermagic27+0xb>
	...

0000000000000088 <__UNIQUE_ID_pidtype88>:
  88:	70 61                	jo     eb <__UNIQUE_ID_name28+0xe>
  8a:	72 6d                	jb     f9 <__UNIQUE_ID_vermagic27+0xd>
  8c:	74 79                	je     107 <__UNIQUE_ID_vermagic27+0x1b>
  8e:	70 65                	jo     f5 <__UNIQUE_ID_vermagic27+0x9>
  90:	3d 70 69 64 3a       	cmp    $0x3a646970,%eax
  95:	69 6e 74 00 00 00 00 	imul   $0x0,0x74(%rsi),%ebp
  9c:	00 00                	add    %al,(%rax)
	...

00000000000000a0 <__UNIQUE_ID_srcversion30>:
  a0:	73 72                	jae    114 <__UNIQUE_ID_vermagic27+0x28>
  a2:	63 76 65             	movslq 0x65(%rsi),%esi
  a5:	72 73                	jb     11a <__UNIQUE_ID_vermagic27+0x2e>
  a7:	69 6f 6e 3d 30 30 34 	imul   $0x3430303d,0x6e(%rdi),%ebp
  ae:	31 37                	xor    %esi,(%rdi)
  b0:	32 43 32             	xor    0x32(%rbx),%al
  b3:	34 39                	xor    $0x39,%al
  b5:	33 31                	xor    (%rcx),%esi
  b7:	31 30                	xor    %esi,(%rax)
  b9:	37                   	(bad)  
  ba:	44 33 32             	xor    (%rdx),%r14d
  bd:	41 39 41 46          	cmp    %eax,0x46(%r9)
  c1:	32 00                	xor    (%rax),%al
  c3:	00 00                	add    %al,(%rax)
  c5:	00 00                	add    %al,(%rax)
	...

00000000000000c8 <__module_depends>:
  c8:	64 65 70 65          	fs gs jo 131 <hashtable_get+0x1>
  cc:	6e                   	outsb  %ds:(%rsi),(%dx)
  cd:	64 73 3d             	fs jae 10d <__UNIQUE_ID_vermagic27+0x21>
	...

00000000000000d1 <__UNIQUE_ID_retpoline29>:
  d1:	72 65                	jb     138 <hashtable_get+0x8>
  d3:	74 70                	je     145 <hashtable_get+0x15>
  d5:	6f                   	outsl  %ds:(%rsi),(%dx)
  d6:	6c                   	insb   (%dx),%es:(%rdi)
  d7:	69 6e 65 3d 59 00  	imul   $0x6e00593d,0x65(%rsi),%ebp

00000000000000dd <__UNIQUE_ID_name28>:
  dd:	6e                   	outsb  %ds:(%rsi),(%dx)
  de:	61                   	(bad)  
  df:	6d                   	insl   (%dx),%es:(%rdi)
  e0:	65 3d 6d 79 5f 73    	gs cmp $0x735f796d,%eax
  e6:	79 73                	jns    15b <hashtable_get+0x2b>
  e8:	64 69 67 00    	imul   $0x6d726576,%fs:0x0(%rdi),%esp
  ef:	 

00000000000000ec <__UNIQUE_ID_vermagic27>:
  ec:	76 65                	jbe    153 <hashtable_get+0x23>
  ee:	72 6d                	jb     15d <hashtable_get+0x2d>
  f0:	61                   	(bad)  
  f1:	67 69 63 3d 34 2e 31 	imul   $0x35312e34,0x3d(%ebx),%esp
  f8:	35 
  f9:	2e 30 2d 31 34 30 2d 	xor    %ch,%cs:0x2d303431(%rip)        # 2d303531 <pid+0x2cafc401>
 100:	67 65 6e             	outsb  %gs:(%esi),(%dx)
 103:	65 72 69             	gs jb  16f <hashtable_get+0x3f>
 106:	63 20                	movslq (%rax),%esp
 108:	53                   	push   %rbx
 109:	4d 50                	rex.WRB push %r8
 10b:	20 6d 6f             	and    %ch,0x6f(%rbp)
 10e:	64 5f                	fs pop %rdi
 110:	75 6e                	jne    180 <hashtable_get+0x50>
 112:	6c                   	insb   (%dx),%es:(%rdi)
 113:	6f                   	outsl  %ds:(%rsi),(%dx)
 114:	61                   	(bad)  
 115:	64 20 00             	and    %al,%fs:(%rax)

Disassembly of section __param:

0000000000000000 <__param_proc_name>:
	...
  18:	b0 01                	mov    $0x1,%al
  1a:	ff 00                	incl   (%rax)
	...

0000000000000028 <__param_pid>:
	...
  40:	80 01 ff             	addb   $0xff,(%rcx)
	...

Disassembly of section __mcount_loc:

0000000000000000 <__mcount_loc>:
	...

Disassembly of section .data:

0000000000000000 <interests>:
	...

0000000000000040 <syscall_id_to_name>:
      40:	72 65                	jb     a7 <syscall_id_to_name+0x67>
      42:	61                   	(bad)  
      43:	64 00 00             	add    %al,%fs:(%rax)
	...
      5e:	00 00                	add    %al,(%rax)
      60:	77 72                	ja     d4 <syscall_id_to_name+0x94>
      62:	69 74 65 00 00 00 00 	imul   $0x0,0x0(%rbp,%riz,2),%esi
      69:	00 
	...
      7e:	00 00                	add    %al,(%rax)
      80:	6f                   	outsl  %ds:(%rsi),(%dx)
      81:	70 65                	jo     e8 <syscall_id_to_name+0xa8>
      83:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
      a0:	63 6c 6f 73          	movslq 0x73(%rdi,%rbp,2),%ebp
      a4:	65 00 00             	add    %al,%gs:(%rax)
	...
      bf:	00 73 74             	add    %dh,0x74(%rbx)
      c2:	61                   	(bad)  
      c3:	74 00                	je     c5 <syscall_id_to_name+0x85>
	...
      dd:	00 00                	add    %al,(%rax)
      df:	00 66 73             	add    %ah,0x73(%rsi)
      e2:	74 61                	je     145 <syscall_id_to_name+0x105>
      e4:	74 00                	je     e6 <syscall_id_to_name+0xa6>
	...
      fe:	00 00                	add    %al,(%rax)
     100:	6c                   	insb   (%dx),%es:(%rdi)
     101:	73 74                	jae    177 <syscall_id_to_name+0x137>
     103:	61                   	(bad)  
     104:	74 00                	je     106 <syscall_id_to_name+0xc6>
	...
     11e:	00 00                	add    %al,(%rax)
     120:	70 6f                	jo     191 <syscall_id_to_name+0x151>
     122:	6c                   	insb   (%dx),%es:(%rdi)
     123:	6c                   	insb   (%dx),%es:(%rdi)
	...
     140:	6c                   	insb   (%dx),%es:(%rdi)
     141:	73 65                	jae    1a8 <syscall_id_to_name+0x168>
     143:	65 6b 00 00          	imul   $0x0,%gs:(%rax),%eax
	...
     15f:	00 6d 6d             	add    %ch,0x6d(%rbp)
     162:	61                   	(bad)  
     163:	70 00                	jo     165 <syscall_id_to_name+0x125>
	...
     17d:	00 00                	add    %al,(%rax)
     17f:	00 6d 70             	add    %ch,0x70(%rbp)
     182:	72 6f                	jb     1f3 <syscall_id_to_name+0x1b3>
     184:	74 65                	je     1eb <syscall_id_to_name+0x1ab>
     186:	63 74 00 00          	movslq 0x0(%rax,%rax,1),%esi
	...
     19e:	00 00                	add    %al,(%rax)
     1a0:	6d                   	insl   (%dx),%es:(%rdi)
     1a1:	75 6e                	jne    211 <syscall_id_to_name+0x1d1>
     1a3:	6d                   	insl   (%dx),%es:(%rdi)
     1a4:	61                   	(bad)  
     1a5:	70 00                	jo     1a7 <syscall_id_to_name+0x167>
	...
     1bf:	00 62 72             	add    %ah,0x72(%rdx)
     1c2:	6b 00 00             	imul   $0x0,(%rax),%eax
	...
     1dd:	00 00                	add    %al,(%rax)
     1df:	00 72 74             	add    %dh,0x74(%rdx)
     1e2:	5f                   	pop    %rdi
     1e3:	73 69                	jae    24e <syscall_id_to_name+0x20e>
     1e5:	67 61                	addr32 (bad) 
     1e7:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
     1eb:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
     200:	72 74                	jb     276 <syscall_id_to_name+0x236>
     202:	5f                   	pop    %rdi
     203:	73 69                	jae    26e <syscall_id_to_name+0x22e>
     205:	67 70 72             	addr32 jo 27a <syscall_id_to_name+0x23a>
     208:	6f                   	outsl  %ds:(%rsi),(%dx)
     209:	63 6d 61             	movslq 0x61(%rbp),%ebp
     20c:	73 6b                	jae    279 <syscall_id_to_name+0x239>
	...
     21e:	00 00                	add    %al,(%rax)
     220:	72 74                	jb     296 <syscall_id_to_name+0x256>
     222:	5f                   	pop    %rdi
     223:	73 69                	jae    28e <syscall_id_to_name+0x24e>
     225:	67 72 65             	addr32 jb 28d <syscall_id_to_name+0x24d>
     228:	74 75                	je     29f <syscall_id_to_name+0x25f>
     22a:	72 6e                	jb     29a <syscall_id_to_name+0x25a>
	...
     240:	69 6f 63 74 6c 00 00 	imul   $0x6c74,0x63(%rdi),%ebp
	...
     25f:	00 70 72             	add    %dh,0x72(%rax)
     262:	65 61                	gs (bad) 
     264:	64 36 34 00          	fs ss xor $0x0,%al
	...
     280:	70 77                	jo     2f9 <syscall_id_to_name+0x2b9>
     282:	72 69                	jb     2ed <syscall_id_to_name+0x2ad>
     284:	74 65                	je     2eb <syscall_id_to_name+0x2ab>
     286:	36 34 00             	ss xor $0x0,%al
	...
     29d:	00 00                	add    %al,(%rax)
     29f:	00 72 65             	add    %dh,0x65(%rdx)
     2a2:	61                   	(bad)  
     2a3:	64 76 00             	fs jbe 2a6 <syscall_id_to_name+0x266>
	...
     2be:	00 00                	add    %al,(%rax)
     2c0:	77 72                	ja     334 <syscall_id_to_name+0x2f4>
     2c2:	69 74 65 76 00 00 00 	imul   $0x0,0x76(%rbp,%riz,2),%esi
     2c9:	00 
	...
     2de:	00 00                	add    %al,(%rax)
     2e0:	61                   	(bad)  
     2e1:	63 63 65             	movslq 0x65(%rbx),%esp
     2e4:	73 73                	jae    359 <syscall_id_to_name+0x319>
	...
     2fe:	00 00                	add    %al,(%rax)
     300:	70 69                	jo     36b <syscall_id_to_name+0x32b>
     302:	70 65                	jo     369 <syscall_id_to_name+0x329>
	...
     320:	73 65                	jae    387 <syscall_id_to_name+0x347>
     322:	6c                   	insb   (%dx),%es:(%rdi)
     323:	65 63 74 00 00       	movslq %gs:0x0(%rax,%rax,1),%esi
	...
     340:	73 63                	jae    3a5 <syscall_id_to_name+0x365>
     342:	68 65 64 5f 79       	pushq  $0x795f6465
     347:	69 65 6c 64 00 00 00 	imul   $0x64,0x6c(%rbp),%esp
	...
     35e:	00 00                	add    %al,(%rax)
     360:	6d                   	insl   (%dx),%es:(%rdi)
     361:	72 65                	jb     3c8 <syscall_id_to_name+0x388>
     363:	6d                   	insl   (%dx),%es:(%rdi)
     364:	61                   	(bad)  
     365:	70 00                	jo     367 <syscall_id_to_name+0x327>
	...
     37f:	00 6d 73             	add    %ch,0x73(%rbp)
     382:	79 6e                	jns    3f2 <syscall_id_to_name+0x3b2>
     384:	63 00                	movslq (%rax),%eax
	...
     39e:	00 00                	add    %al,(%rax)
     3a0:	6d                   	insl   (%dx),%es:(%rdi)
     3a1:	69 6e 63 6f 72 65 00 	imul   $0x65726f,0x63(%rsi),%ebp
	...
     3c0:	6d                   	insl   (%dx),%es:(%rdi)
     3c1:	61                   	(bad)  
     3c2:	64 76 69             	fs jbe 42e <syscall_id_to_name+0x3ee>
     3c5:	73 65                	jae    42c <syscall_id_to_name+0x3ec>
	...
     3df:	00 73 68             	add    %dh,0x68(%rbx)
     3e2:	6d                   	insl   (%dx),%es:(%rdi)
     3e3:	67 65 74 00          	addr32 gs je 3e7 <syscall_id_to_name+0x3a7>
	...
     3ff:	00 73 68             	add    %dh,0x68(%rbx)
     402:	6d                   	insl   (%dx),%es:(%rdi)
     403:	61                   	(bad)  
     404:	74 00                	je     406 <syscall_id_to_name+0x3c6>
	...
     41e:	00 00                	add    %al,(%rax)
     420:	73 68                	jae    48a <syscall_id_to_name+0x44a>
     422:	6d                   	insl   (%dx),%es:(%rdi)
     423:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
     43f:	00 64 75 70          	add    %ah,0x70(%rbp,%rsi,2)
	...
     45f:	00 64 75 70          	add    %ah,0x70(%rbp,%rsi,2)
     463:	32 00                	xor    (%rax),%al
	...
     47d:	00 00                	add    %al,(%rax)
     47f:	00 70 61             	add    %dh,0x61(%rax)
     482:	75 73                	jne    4f7 <syscall_id_to_name+0x4b7>
     484:	65 00 00             	add    %al,%gs:(%rax)
	...
     49f:	00 6e 61             	add    %ch,0x61(%rsi)
     4a2:	6e                   	outsb  %ds:(%rsi),(%dx)
     4a3:	6f                   	outsl  %ds:(%rsi),(%dx)
     4a4:	73 6c                	jae    512 <syscall_id_to_name+0x4d2>
     4a6:	65 65 70 00          	gs gs jo 4aa <syscall_id_to_name+0x46a>
	...
     4be:	00 00                	add    %al,(%rax)
     4c0:	67 65 74 69          	addr32 gs je 52d <syscall_id_to_name+0x4ed>
     4c4:	74 69                	je     52f <syscall_id_to_name+0x4ef>
     4c6:	6d                   	insl   (%dx),%es:(%rdi)
     4c7:	65 72 00             	gs jb  4ca <syscall_id_to_name+0x48a>
	...
     4de:	00 00                	add    %al,(%rax)
     4e0:	61                   	(bad)  
     4e1:	6c                   	insb   (%dx),%es:(%rdi)
     4e2:	61                   	(bad)  
     4e3:	72 6d                	jb     552 <syscall_id_to_name+0x512>
	...
     4fd:	00 00                	add    %al,(%rax)
     4ff:	00 73 65             	add    %dh,0x65(%rbx)
     502:	74 69                	je     56d <syscall_id_to_name+0x52d>
     504:	74 69                	je     56f <syscall_id_to_name+0x52f>
     506:	6d                   	insl   (%dx),%es:(%rdi)
     507:	65 72 00             	gs jb  50a <syscall_id_to_name+0x4ca>
	...
     51e:	00 00                	add    %al,(%rax)
     520:	67 65 74 70          	addr32 gs je 594 <syscall_id_to_name+0x554>
     524:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     52b:	00 
	...
     540:	73 65                	jae    5a7 <syscall_id_to_name+0x567>
     542:	6e                   	outsb  %ds:(%rsi),(%dx)
     543:	64 66 69 6c 65 00 00 	imul   $0x0,%fs:0x0(%rbp,%riz,2),%bp
     54a:	00 
	...
     55f:	00 73 6f             	add    %dh,0x6f(%rbx)
     562:	63 6b 65             	movslq 0x65(%rbx),%ebp
     565:	74 00                	je     567 <syscall_id_to_name+0x527>
	...
     57f:	00 63 6f             	add    %ah,0x6f(%rbx)
     582:	6e                   	outsb  %ds:(%rsi),(%dx)
     583:	6e                   	outsb  %ds:(%rsi),(%dx)
     584:	65 63 74 00 00       	movslq %gs:0x0(%rax,%rax,1),%esi
	...
     59d:	00 00                	add    %al,(%rax)
     59f:	00 61 63             	add    %ah,0x63(%rcx)
     5a2:	63 65 70             	movslq 0x70(%rbp),%esp
     5a5:	74 00                	je     5a7 <syscall_id_to_name+0x567>
	...
     5bf:	00 73 65             	add    %dh,0x65(%rbx)
     5c2:	6e                   	outsb  %ds:(%rsi),(%dx)
     5c3:	64 74 6f             	fs je  635 <syscall_id_to_name+0x5f5>
	...
     5de:	00 00                	add    %al,(%rax)
     5e0:	72 65                	jb     647 <syscall_id_to_name+0x607>
     5e2:	63 76 66             	movslq 0x66(%rsi),%esi
     5e5:	72 6f                	jb     656 <syscall_id_to_name+0x616>
     5e7:	6d                   	insl   (%dx),%es:(%rdi)
	...
     600:	73 65                	jae    667 <syscall_id_to_name+0x627>
     602:	6e                   	outsb  %ds:(%rsi),(%dx)
     603:	64 6d                	fs insl (%dx),%es:(%rdi)
     605:	73 67                	jae    66e <syscall_id_to_name+0x62e>
	...
     61f:	00 72 65             	add    %dh,0x65(%rdx)
     622:	63 76 6d             	movslq 0x6d(%rsi),%esi
     625:	73 67                	jae    68e <syscall_id_to_name+0x64e>
	...
     63f:	00 73 68             	add    %dh,0x68(%rbx)
     642:	75 74                	jne    6b8 <syscall_id_to_name+0x678>
     644:	64 6f                	outsl  %fs:(%rsi),(%dx)
     646:	77 6e                	ja     6b6 <syscall_id_to_name+0x676>
	...
     660:	62                   	(bad)  
     661:	69 6e 64 00 00 00 00 	imul   $0x0,0x64(%rsi),%ebp
	...
     680:	6c                   	insb   (%dx),%es:(%rdi)
     681:	69 73 74 65 6e 00 00 	imul   $0x6e65,0x74(%rbx),%esi
	...
     6a0:	67 65 74 73          	addr32 gs je 717 <syscall_id_to_name+0x6d7>
     6a4:	6f                   	outsl  %ds:(%rsi),(%dx)
     6a5:	63 6b 6e             	movslq 0x6e(%rbx),%ebp
     6a8:	61                   	(bad)  
     6a9:	6d                   	insl   (%dx),%es:(%rdi)
     6aa:	65 00 00             	add    %al,%gs:(%rax)
	...
     6bd:	00 00                	add    %al,(%rax)
     6bf:	00 67 65             	add    %ah,0x65(%rdi)
     6c2:	74 70                	je     734 <syscall_id_to_name+0x6f4>
     6c4:	65 65 72 6e          	gs gs jb 736 <syscall_id_to_name+0x6f6>
     6c8:	61                   	(bad)  
     6c9:	6d                   	insl   (%dx),%es:(%rdi)
     6ca:	65 00 00             	add    %al,%gs:(%rax)
	...
     6dd:	00 00                	add    %al,(%rax)
     6df:	00 73 6f             	add    %dh,0x6f(%rbx)
     6e2:	63 6b 65             	movslq 0x65(%rbx),%ebp
     6e5:	74 70                	je     757 <syscall_id_to_name+0x717>
     6e7:	61                   	(bad)  
     6e8:	69 72 00 00 00 00 00 	imul   $0x0,0x0(%rdx),%esi
	...
     6ff:	00 73 65             	add    %dh,0x65(%rbx)
     702:	74 73                	je     777 <syscall_id_to_name+0x737>
     704:	6f                   	outsl  %ds:(%rsi),(%dx)
     705:	63 6b 6f             	movslq 0x6f(%rbx),%ebp
     708:	70 74                	jo     77e <syscall_id_to_name+0x73e>
	...
     71e:	00 00                	add    %al,(%rax)
     720:	67 65 74 73          	addr32 gs je 797 <syscall_id_to_name+0x757>
     724:	6f                   	outsl  %ds:(%rsi),(%dx)
     725:	63 6b 6f             	movslq 0x6f(%rbx),%ebp
     728:	70 74                	jo     79e <syscall_id_to_name+0x75e>
	...
     73e:	00 00                	add    %al,(%rax)
     740:	63 6c 6f 6e          	movslq 0x6e(%rdi,%rbp,2),%ebp
     744:	65 00 00             	add    %al,%gs:(%rax)
	...
     75f:	00 66 6f             	add    %ah,0x6f(%rsi)
     762:	72 6b                	jb     7cf <syscall_id_to_name+0x78f>
	...
     780:	76 66                	jbe    7e8 <syscall_id_to_name+0x7a8>
     782:	6f                   	outsl  %ds:(%rsi),(%dx)
     783:	72 6b                	jb     7f0 <syscall_id_to_name+0x7b0>
	...
     79d:	00 00                	add    %al,(%rax)
     79f:	00 65 78             	add    %ah,0x78(%rbp)
     7a2:	65 63 76 65          	movslq %gs:0x65(%rsi),%esi
	...
     7be:	00 00                	add    %al,(%rax)
     7c0:	65 78 69             	gs js  82c <syscall_id_to_name+0x7ec>
     7c3:	74 00                	je     7c5 <syscall_id_to_name+0x785>
	...
     7dd:	00 00                	add    %al,(%rax)
     7df:	00 77 61             	add    %dh,0x61(%rdi)
     7e2:	69 74 34 00 00 00 00 	imul   $0x0,0x0(%rsp,%rsi,1),%esi
     7e9:	00 
	...
     7fe:	00 00                	add    %al,(%rax)
     800:	6b 69 6c 6c          	imul   $0x6c,0x6c(%rcx),%ebp
	...
     820:	75 6e                	jne    890 <syscall_id_to_name+0x850>
     822:	61                   	(bad)  
     823:	6d                   	insl   (%dx),%es:(%rdi)
     824:	65 00 00             	add    %al,%gs:(%rax)
	...
     83f:	00 73 65             	add    %dh,0x65(%rbx)
     842:	6d                   	insl   (%dx),%es:(%rdi)
     843:	67 65 74 00          	addr32 gs je 847 <syscall_id_to_name+0x807>
	...
     85f:	00 73 65             	add    %dh,0x65(%rbx)
     862:	6d                   	insl   (%dx),%es:(%rdi)
     863:	6f                   	outsl  %ds:(%rsi),(%dx)
     864:	70 00                	jo     866 <syscall_id_to_name+0x826>
	...
     87e:	00 00                	add    %al,(%rax)
     880:	73 65                	jae    8e7 <syscall_id_to_name+0x8a7>
     882:	6d                   	insl   (%dx),%es:(%rdi)
     883:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
     89f:	00 73 68             	add    %dh,0x68(%rbx)
     8a2:	6d                   	insl   (%dx),%es:(%rdi)
     8a3:	64 74 00             	fs je  8a6 <syscall_id_to_name+0x866>
	...
     8be:	00 00                	add    %al,(%rax)
     8c0:	6d                   	insl   (%dx),%es:(%rdi)
     8c1:	73 67                	jae    92a <syscall_id_to_name+0x8ea>
     8c3:	67 65 74 00          	addr32 gs je 8c7 <syscall_id_to_name+0x887>
	...
     8df:	00 6d 73             	add    %ch,0x73(%rbp)
     8e2:	67 73 6e             	addr32 jae 953 <syscall_id_to_name+0x913>
     8e5:	64 00 00             	add    %al,%fs:(%rax)
	...
     900:	6d                   	insl   (%dx),%es:(%rdi)
     901:	73 67                	jae    96a <syscall_id_to_name+0x92a>
     903:	72 63                	jb     968 <syscall_id_to_name+0x928>
     905:	76 00                	jbe    907 <syscall_id_to_name+0x8c7>
	...
     91f:	00 6d 73             	add    %ch,0x73(%rbp)
     922:	67 63 74 6c 00       	movslq 0x0(%esp,%ebp,2),%esi
	...
     93f:	00 66 63             	add    %ah,0x63(%rsi)
     942:	6e                   	outsb  %ds:(%rsi),(%dx)
     943:	74 6c                	je     9b1 <syscall_id_to_name+0x971>
	...
     95d:	00 00                	add    %al,(%rax)
     95f:	00 66 6c             	add    %ah,0x6c(%rsi)
     962:	6f                   	outsl  %ds:(%rsi),(%dx)
     963:	63 6b 00             	movslq 0x0(%rbx),%ebp
	...
     97e:	00 00                	add    %al,(%rax)
     980:	66 73 79             	data16 jae 9fc <syscall_id_to_name+0x9bc>
     983:	6e                   	outsb  %ds:(%rsi),(%dx)
     984:	63 00                	movslq (%rax),%eax
	...
     99e:	00 00                	add    %al,(%rax)
     9a0:	66 64 61             	data16 fs (bad) 
     9a3:	74 61                	je     a06 <syscall_id_to_name+0x9c6>
     9a5:	73 79                	jae    a20 <syscall_id_to_name+0x9e0>
     9a7:	6e                   	outsb  %ds:(%rsi),(%dx)
     9a8:	63 00                	movslq (%rax),%eax
	...
     9be:	00 00                	add    %al,(%rax)
     9c0:	74 72                	je     a34 <syscall_id_to_name+0x9f4>
     9c2:	75 6e                	jne    a32 <syscall_id_to_name+0x9f2>
     9c4:	63 61 74             	movslq 0x74(%rcx),%esp
     9c7:	65 00 00             	add    %al,%gs:(%rax)
	...
     9de:	00 00                	add    %al,(%rax)
     9e0:	66 74 72             	data16 je a55 <syscall_id_to_name+0xa15>
     9e3:	75 6e                	jne    a53 <syscall_id_to_name+0xa13>
     9e5:	63 61 74             	movslq 0x74(%rcx),%esp
     9e8:	65 00 00             	add    %al,%gs:(%rax)
	...
     9ff:	00 67 65             	add    %ah,0x65(%rdi)
     a02:	74 64                	je     a68 <syscall_id_to_name+0xa28>
     a04:	65 6e                	outsb  %gs:(%rsi),(%dx)
     a06:	74 73                	je     a7b <syscall_id_to_name+0xa3b>
	...
     a20:	67 65 74 63          	addr32 gs je a87 <syscall_id_to_name+0xa47>
     a24:	77 64                	ja     a8a <syscall_id_to_name+0xa4a>
	...
     a3e:	00 00                	add    %al,(%rax)
     a40:	63 68 64             	movslq 0x64(%rax),%ebp
     a43:	69 72 00 00 00 00 00 	imul   $0x0,0x0(%rdx),%esi
	...
     a5e:	00 00                	add    %al,(%rax)
     a60:	66 63 68 64          	movslq 0x64(%rax),%bp
     a64:	69 72 00 00 00 00 00 	imul   $0x0,0x0(%rdx),%esi
	...
     a7f:	00 72 65             	add    %dh,0x65(%rdx)
     a82:	6e                   	outsb  %ds:(%rsi),(%dx)
     a83:	61                   	(bad)  
     a84:	6d                   	insl   (%dx),%es:(%rdi)
     a85:	65 00 00             	add    %al,%gs:(%rax)
	...
     aa0:	6d                   	insl   (%dx),%es:(%rdi)
     aa1:	6b 64 69 72 00       	imul   $0x0,0x72(%rcx,%rbp,2),%esp
	...
     abe:	00 00                	add    %al,(%rax)
     ac0:	72 6d                	jb     b2f <syscall_id_to_name+0xaef>
     ac2:	64 69 72 00 00 00 00 	imul   $0x0,%fs:0x0(%rdx),%esi
     ac9:	00 
	...
     ade:	00 00                	add    %al,(%rax)
     ae0:	63 72 65             	movslq 0x65(%rdx),%esi
     ae3:	61                   	(bad)  
     ae4:	74 00                	je     ae6 <syscall_id_to_name+0xaa6>
	...
     afe:	00 00                	add    %al,(%rax)
     b00:	6c                   	insb   (%dx),%es:(%rdi)
     b01:	69 6e 6b 00 00 00 00 	imul   $0x0,0x6b(%rsi),%ebp
	...
     b20:	75 6e                	jne    b90 <syscall_id_to_name+0xb50>
     b22:	6c                   	insb   (%dx),%es:(%rdi)
     b23:	69 6e 6b 00 00 00 00 	imul   $0x0,0x6b(%rsi),%ebp
	...
     b3e:	00 00                	add    %al,(%rax)
     b40:	73 79                	jae    bbb <syscall_id_to_name+0xb7b>
     b42:	6d                   	insl   (%dx),%es:(%rdi)
     b43:	6c                   	insb   (%dx),%es:(%rdi)
     b44:	69 6e 6b 00 00 00 00 	imul   $0x0,0x6b(%rsi),%ebp
	...
     b5f:	00 72 65             	add    %dh,0x65(%rdx)
     b62:	61                   	(bad)  
     b63:	64 6c                	fs insb (%dx),%es:(%rdi)
     b65:	69 6e 6b 00 00 00 00 	imul   $0x0,0x6b(%rsi),%ebp
	...
     b80:	63 68 6d             	movslq 0x6d(%rax),%ebp
     b83:	6f                   	outsl  %ds:(%rsi),(%dx)
     b84:	64 00 00             	add    %al,%fs:(%rax)
	...
     b9f:	00 66 63             	add    %ah,0x63(%rsi)
     ba2:	68 6d 6f 64 00       	pushq  $0x646f6d
	...
     bbf:	00 63 68             	add    %ah,0x68(%rbx)
     bc2:	6f                   	outsl  %ds:(%rsi),(%dx)
     bc3:	77 6e                	ja     c33 <syscall_id_to_name+0xbf3>
	...
     bdd:	00 00                	add    %al,(%rax)
     bdf:	00 66 63             	add    %ah,0x63(%rsi)
     be2:	68 6f 77 6e 00       	pushq  $0x6e776f
	...
     bff:	00 6c 63 68          	add    %ch,0x68(%rbx,%riz,2)
     c03:	6f                   	outsl  %ds:(%rsi),(%dx)
     c04:	77 6e                	ja     c74 <syscall_id_to_name+0xc34>
	...
     c1e:	00 00                	add    %al,(%rax)
     c20:	75 6d                	jne    c8f <syscall_id_to_name+0xc4f>
     c22:	61                   	(bad)  
     c23:	73 6b                	jae    c90 <syscall_id_to_name+0xc50>
	...
     c3d:	00 00                	add    %al,(%rax)
     c3f:	00 67 65             	add    %ah,0x65(%rdi)
     c42:	74 74                	je     cb8 <syscall_id_to_name+0xc78>
     c44:	69 6d 65 6f 66 64 61 	imul   $0x6164666f,0x65(%rbp),%ebp
     c4b:	79 00                	jns    c4d <syscall_id_to_name+0xc0d>
	...
     c5d:	00 00                	add    %al,(%rax)
     c5f:	00 67 65             	add    %ah,0x65(%rdi)
     c62:	74 72                	je     cd6 <syscall_id_to_name+0xc96>
     c64:	6c                   	insb   (%dx),%es:(%rdi)
     c65:	69 6d 69 74 00 00 00 	imul   $0x74,0x69(%rbp),%ebp
	...
     c80:	67 65 74 72          	addr32 gs je cf6 <syscall_id_to_name+0xcb6>
     c84:	75 73                	jne    cf9 <syscall_id_to_name+0xcb9>
     c86:	61                   	(bad)  
     c87:	67 65 00 00          	add    %al,%gs:(%eax)
	...
     c9f:	00 73 79             	add    %dh,0x79(%rbx)
     ca2:	73 69                	jae    d0d <syscall_id_to_name+0xccd>
     ca4:	6e                   	outsb  %ds:(%rsi),(%dx)
     ca5:	66 6f                	outsw  %ds:(%rsi),(%dx)
	...
     cbf:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
     cc3:	65 73 00             	gs jae cc6 <syscall_id_to_name+0xc86>
	...
     cde:	00 00                	add    %al,(%rax)
     ce0:	70 74                	jo     d56 <syscall_id_to_name+0xd16>
     ce2:	72 61                	jb     d45 <syscall_id_to_name+0xd05>
     ce4:	63 65 00             	movslq 0x0(%rbp),%esp
	...
     cff:	00 67 65             	add    %ah,0x65(%rdi)
     d02:	74 75                	je     d79 <syscall_id_to_name+0xd39>
     d04:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     d0b:	00 
	...
     d20:	73 79                	jae    d9b <syscall_id_to_name+0xd5b>
     d22:	73 6c                	jae    d90 <syscall_id_to_name+0xd50>
     d24:	6f                   	outsl  %ds:(%rsi),(%dx)
     d25:	67 00 00             	add    %al,(%eax)
	...
     d40:	67 65 74 67          	addr32 gs je dab <syscall_id_to_name+0xd6b>
     d44:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     d4b:	00 
	...
     d60:	73 65                	jae    dc7 <syscall_id_to_name+0xd87>
     d62:	74 75                	je     dd9 <syscall_id_to_name+0xd99>
     d64:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     d6b:	00 
	...
     d80:	73 65                	jae    de7 <syscall_id_to_name+0xda7>
     d82:	74 67                	je     deb <syscall_id_to_name+0xdab>
     d84:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     d8b:	00 
	...
     da0:	67 65 74 65          	addr32 gs je e09 <syscall_id_to_name+0xdc9>
     da4:	75 69                	jne    e0f <syscall_id_to_name+0xdcf>
     da6:	64 00 00             	add    %al,%fs:(%rax)
	...
     dbd:	00 00                	add    %al,(%rax)
     dbf:	00 67 65             	add    %ah,0x65(%rdi)
     dc2:	74 65                	je     e29 <syscall_id_to_name+0xde9>
     dc4:	67 69 64 00 00 00 00 	imul   $0x0,0x0(%eax,%eax,1),%esp
     dcb:	00 00 
	...
     ddd:	00 00                	add    %al,(%rax)
     ddf:	00 73 65             	add    %dh,0x65(%rbx)
     de2:	74 70                	je     e54 <syscall_id_to_name+0xe14>
     de4:	67 69 64 00 00 00 00 	imul   $0x0,0x0(%eax,%eax,1),%esp
     deb:	00 00 
	...
     dfd:	00 00                	add    %al,(%rax)
     dff:	00 67 65             	add    %ah,0x65(%rdi)
     e02:	74 70                	je     e74 <syscall_id_to_name+0xe34>
     e04:	70 69                	jo     e6f <syscall_id_to_name+0xe2f>
     e06:	64 00 00             	add    %al,%fs:(%rax)
	...
     e1d:	00 00                	add    %al,(%rax)
     e1f:	00 67 65             	add    %ah,0x65(%rdi)
     e22:	74 70                	je     e94 <syscall_id_to_name+0xe54>
     e24:	67 72 70             	addr32 jb e97 <syscall_id_to_name+0xe57>
	...
     e3f:	00 73 65             	add    %dh,0x65(%rbx)
     e42:	74 73                	je     eb7 <syscall_id_to_name+0xe77>
     e44:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     e4b:	00 
	...
     e60:	73 65                	jae    ec7 <syscall_id_to_name+0xe87>
     e62:	74 72                	je     ed6 <syscall_id_to_name+0xe96>
     e64:	65 75 69             	gs jne ed0 <syscall_id_to_name+0xe90>
     e67:	64 00 00             	add    %al,%fs:(%rax)
	...
     e7e:	00 00                	add    %al,(%rax)
     e80:	73 65                	jae    ee7 <syscall_id_to_name+0xea7>
     e82:	74 72                	je     ef6 <syscall_id_to_name+0xeb6>
     e84:	65 67 69 64 00 00 00 	imul   $0x0,%gs:0x0(%eax,%eax,1),%esp
     e8b:	00 00 00 
	...
     e9e:	00 00                	add    %al,(%rax)
     ea0:	67 65 74 67          	addr32 gs je f0b <syscall_id_to_name+0xecb>
     ea4:	72 6f                	jb     f15 <syscall_id_to_name+0xed5>
     ea6:	75 70                	jne    f18 <syscall_id_to_name+0xed8>
     ea8:	73 00                	jae    eaa <syscall_id_to_name+0xe6a>
	...
     ebe:	00 00                	add    %al,(%rax)
     ec0:	73 65                	jae    f27 <syscall_id_to_name+0xee7>
     ec2:	74 67                	je     f2b <syscall_id_to_name+0xeeb>
     ec4:	72 6f                	jb     f35 <syscall_id_to_name+0xef5>
     ec6:	75 70                	jne    f38 <syscall_id_to_name+0xef8>
     ec8:	73 00                	jae    eca <syscall_id_to_name+0xe8a>
	...
     ede:	00 00                	add    %al,(%rax)
     ee0:	73 65                	jae    f47 <syscall_id_to_name+0xf07>
     ee2:	74 72                	je     f56 <syscall_id_to_name+0xf16>
     ee4:	65 73 75             	gs jae f5c <syscall_id_to_name+0xf1c>
     ee7:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     eee:	00 
	...
     eff:	00 67 65             	add    %ah,0x65(%rdi)
     f02:	74 72                	je     f76 <syscall_id_to_name+0xf36>
     f04:	65 73 75             	gs jae f7c <syscall_id_to_name+0xf3c>
     f07:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     f0e:	00 
	...
     f1f:	00 73 65             	add    %dh,0x65(%rbx)
     f22:	74 72                	je     f96 <syscall_id_to_name+0xf56>
     f24:	65 73 67             	gs jae f8e <syscall_id_to_name+0xf4e>
     f27:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     f2e:	00 
	...
     f3f:	00 67 65             	add    %ah,0x65(%rdi)
     f42:	74 72                	je     fb6 <syscall_id_to_name+0xf76>
     f44:	65 73 67             	gs jae fae <syscall_id_to_name+0xf6e>
     f47:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     f4e:	00 
	...
     f5f:	00 67 65             	add    %ah,0x65(%rdi)
     f62:	74 70                	je     fd4 <syscall_id_to_name+0xf94>
     f64:	67 69 64 00 00 00 00 	imul   $0x0,0x0(%eax,%eax,1),%esp
     f6b:	00 00 
	...
     f7d:	00 00                	add    %al,(%rax)
     f7f:	00 73 65             	add    %dh,0x65(%rbx)
     f82:	74 66                	je     fea <syscall_id_to_name+0xfaa>
     f84:	73 75                	jae    ffb <syscall_id_to_name+0xfbb>
     f86:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     f8d:	00 
	...
     f9e:	00 00                	add    %al,(%rax)
     fa0:	73 65                	jae    1007 <syscall_id_to_name+0xfc7>
     fa2:	74 66                	je     100a <syscall_id_to_name+0xfca>
     fa4:	73 67                	jae    100d <syscall_id_to_name+0xfcd>
     fa6:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     fad:	00 
	...
     fbe:	00 00                	add    %al,(%rax)
     fc0:	67 65 74 73          	addr32 gs je 1037 <syscall_id_to_name+0xff7>
     fc4:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
     fcb:	00 
	...
     fe0:	63 61 70             	movslq 0x70(%rcx),%esp
     fe3:	67 65 74 00          	addr32 gs je fe7 <syscall_id_to_name+0xfa7>
	...
     fff:	00 63 61             	add    %ah,0x61(%rbx)
    1002:	70 73                	jo     1077 <syscall_id_to_name+0x1037>
    1004:	65 74 00             	gs je  1007 <syscall_id_to_name+0xfc7>
	...
    101f:	00 72 74             	add    %dh,0x74(%rdx)
    1022:	5f                   	pop    %rdi
    1023:	73 69                	jae    108e <syscall_id_to_name+0x104e>
    1025:	67 70 65             	addr32 jo 108d <syscall_id_to_name+0x104d>
    1028:	6e                   	outsb  %ds:(%rsi),(%dx)
    1029:	64 69 6e 67 00 00 00 	imul   $0x0,%fs:0x67(%rsi),%ebp
    1030:	00 
	...
    103d:	00 00                	add    %al,(%rax)
    103f:	00 72 74             	add    %dh,0x74(%rdx)
    1042:	5f                   	pop    %rdi
    1043:	73 69                	jae    10ae <syscall_id_to_name+0x106e>
    1045:	67 74 69             	addr32 je 10b1 <syscall_id_to_name+0x1071>
    1048:	6d                   	insl   (%dx),%es:(%rdi)
    1049:	65 64 77 61          	gs fs ja 10ae <syscall_id_to_name+0x106e>
    104d:	69 74 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esi
    1054:	00 
	...
    105d:	00 00                	add    %al,(%rax)
    105f:	00 72 74             	add    %dh,0x74(%rdx)
    1062:	5f                   	pop    %rdi
    1063:	73 69                	jae    10ce <syscall_id_to_name+0x108e>
    1065:	67 71 75             	addr32 jno 10dd <syscall_id_to_name+0x109d>
    1068:	65 75 65             	gs jne 10d0 <syscall_id_to_name+0x1090>
    106b:	69 6e 66 6f 00 00 00 	imul   $0x6f,0x66(%rsi),%ebp
	...
    107e:	00 00                	add    %al,(%rax)
    1080:	72 74                	jb     10f6 <syscall_id_to_name+0x10b6>
    1082:	5f                   	pop    %rdi
    1083:	73 69                	jae    10ee <syscall_id_to_name+0x10ae>
    1085:	67 73 75             	addr32 jae 10fd <syscall_id_to_name+0x10bd>
    1088:	73 70                	jae    10fa <syscall_id_to_name+0x10ba>
    108a:	65 6e                	outsb  %gs:(%rsi),(%dx)
    108c:	64 00 00             	add    %al,%fs:(%rax)
	...
    109f:	00 73 69             	add    %dh,0x69(%rbx)
    10a2:	67 61                	addr32 (bad) 
    10a4:	6c                   	insb   (%dx),%es:(%rdi)
    10a5:	74 73                	je     111a <syscall_id_to_name+0x10da>
    10a7:	74 61                	je     110a <syscall_id_to_name+0x10ca>
    10a9:	63 6b 00             	movslq 0x0(%rbx),%ebp
	...
    10c0:	75 74                	jne    1136 <syscall_id_to_name+0x10f6>
    10c2:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    10dd:	00 00                	add    %al,(%rax)
    10df:	00 6d 6b             	add    %ch,0x6b(%rbp)
    10e2:	6e                   	outsb  %ds:(%rsi),(%dx)
    10e3:	6f                   	outsl  %ds:(%rsi),(%dx)
    10e4:	64 00 00             	add    %al,%fs:(%rax)
	...
    10ff:	00 75 73             	add    %dh,0x73(%rbp)
    1102:	65 6c                	gs insb (%dx),%es:(%rdi)
    1104:	69 62 00 00 00 00 00 	imul   $0x0,0x0(%rdx),%esp
	...
    111f:	00 70 65             	add    %dh,0x65(%rax)
    1122:	72 73                	jb     1197 <syscall_id_to_name+0x1157>
    1124:	6f                   	outsl  %ds:(%rsi),(%dx)
    1125:	6e                   	outsb  %ds:(%rsi),(%dx)
    1126:	61                   	(bad)  
    1127:	6c                   	insb   (%dx),%es:(%rdi)
    1128:	69 74 79 00 00 00 00 	imul   $0x0,0x0(%rcx,%rdi,2),%esi
    112f:	00 
	...
    1140:	75 73                	jne    11b5 <syscall_id_to_name+0x1175>
    1142:	74 61                	je     11a5 <syscall_id_to_name+0x1165>
    1144:	74 00                	je     1146 <syscall_id_to_name+0x1106>
	...
    115e:	00 00                	add    %al,(%rax)
    1160:	73 74                	jae    11d6 <syscall_id_to_name+0x1196>
    1162:	61                   	(bad)  
    1163:	74 66                	je     11cb <syscall_id_to_name+0x118b>
    1165:	73 00                	jae    1167 <syscall_id_to_name+0x1127>
	...
    117f:	00 66 73             	add    %ah,0x73(%rsi)
    1182:	74 61                	je     11e5 <syscall_id_to_name+0x11a5>
    1184:	74 66                	je     11ec <syscall_id_to_name+0x11ac>
    1186:	73 00                	jae    1188 <syscall_id_to_name+0x1148>
	...
    11a0:	73 79                	jae    121b <syscall_id_to_name+0x11db>
    11a2:	73 66                	jae    120a <syscall_id_to_name+0x11ca>
    11a4:	73 00                	jae    11a6 <syscall_id_to_name+0x1166>
	...
    11be:	00 00                	add    %al,(%rax)
    11c0:	67 65 74 70          	addr32 gs je 1234 <syscall_id_to_name+0x11f4>
    11c4:	72 69                	jb     122f <syscall_id_to_name+0x11ef>
    11c6:	6f                   	outsl  %ds:(%rsi),(%dx)
    11c7:	72 69                	jb     1232 <syscall_id_to_name+0x11f2>
    11c9:	74 79                	je     1244 <syscall_id_to_name+0x1204>
	...
    11df:	00 73 65             	add    %dh,0x65(%rbx)
    11e2:	74 70                	je     1254 <syscall_id_to_name+0x1214>
    11e4:	72 69                	jb     124f <syscall_id_to_name+0x120f>
    11e6:	6f                   	outsl  %ds:(%rsi),(%dx)
    11e7:	72 69                	jb     1252 <syscall_id_to_name+0x1212>
    11e9:	74 79                	je     1264 <syscall_id_to_name+0x1224>
	...
    11ff:	00 73 63             	add    %dh,0x63(%rbx)
    1202:	68 65 64 5f 73       	pushq  $0x735f6465
    1207:	65 74 70             	gs je  127a <syscall_id_to_name+0x123a>
    120a:	61                   	(bad)  
    120b:	72 61                	jb     126e <syscall_id_to_name+0x122e>
    120d:	6d                   	insl   (%dx),%es:(%rdi)
	...
    121e:	00 00                	add    %al,(%rax)
    1220:	73 63                	jae    1285 <syscall_id_to_name+0x1245>
    1222:	68 65 64 5f 67       	pushq  $0x675f6465
    1227:	65 74 70             	gs je  129a <syscall_id_to_name+0x125a>
    122a:	61                   	(bad)  
    122b:	72 61                	jb     128e <syscall_id_to_name+0x124e>
    122d:	6d                   	insl   (%dx),%es:(%rdi)
	...
    123e:	00 00                	add    %al,(%rax)
    1240:	73 63                	jae    12a5 <syscall_id_to_name+0x1265>
    1242:	68 65 64 5f 73       	pushq  $0x735f6465
    1247:	65 74 73             	gs je  12bd <syscall_id_to_name+0x127d>
    124a:	63 68 65             	movslq 0x65(%rax),%ebp
    124d:	64 75 6c             	fs jne 12bc <syscall_id_to_name+0x127c>
    1250:	65 72 00             	gs jb  1253 <syscall_id_to_name+0x1213>
	...
    125f:	00 73 63             	add    %dh,0x63(%rbx)
    1262:	68 65 64 5f 67       	pushq  $0x675f6465
    1267:	65 74 73             	gs je  12dd <syscall_id_to_name+0x129d>
    126a:	63 68 65             	movslq 0x65(%rax),%ebp
    126d:	64 75 6c             	fs jne 12dc <syscall_id_to_name+0x129c>
    1270:	65 72 00             	gs jb  1273 <syscall_id_to_name+0x1233>
	...
    127f:	00 73 63             	add    %dh,0x63(%rbx)
    1282:	68 65 64 5f 67       	pushq  $0x675f6465
    1287:	65 74 5f             	gs je  12e9 <syscall_id_to_name+0x12a9>
    128a:	70 72                	jo     12fe <syscall_id_to_name+0x12be>
    128c:	69 6f 72 69 74 79 5f 	imul   $0x5f797469,0x72(%rdi),%ebp
    1293:	6d                   	insl   (%dx),%es:(%rdi)
    1294:	61                   	(bad)  
    1295:	78 00                	js     1297 <syscall_id_to_name+0x1257>
	...
    129f:	00 73 63             	add    %dh,0x63(%rbx)
    12a2:	68 65 64 5f 67       	pushq  $0x675f6465
    12a7:	65 74 5f             	gs je  1309 <syscall_id_to_name+0x12c9>
    12aa:	70 72                	jo     131e <syscall_id_to_name+0x12de>
    12ac:	69 6f 72 69 74 79 5f 	imul   $0x5f797469,0x72(%rdi),%ebp
    12b3:	6d                   	insl   (%dx),%es:(%rdi)
    12b4:	69 6e 00 00 00 00 00 	imul   $0x0,0x0(%rsi),%ebp
    12bb:	00 00                	add    %al,(%rax)
    12bd:	00 00                	add    %al,(%rax)
    12bf:	00 73 63             	add    %dh,0x63(%rbx)
    12c2:	68 65 64 5f 72       	pushq  $0x725f6465
    12c7:	72 5f                	jb     1328 <syscall_id_to_name+0x12e8>
    12c9:	67 65 74 5f          	addr32 gs je 132c <syscall_id_to_name+0x12ec>
    12cd:	69 6e 74 65 72 76 61 	imul   $0x61767265,0x74(%rsi),%ebp
    12d4:	6c                   	insb   (%dx),%es:(%rdi)
	...
    12dd:	00 00                	add    %al,(%rax)
    12df:	00 6d 6c             	add    %ch,0x6c(%rbp)
    12e2:	6f                   	outsl  %ds:(%rsi),(%dx)
    12e3:	63 6b 00             	movslq 0x0(%rbx),%ebp
	...
    12fe:	00 00                	add    %al,(%rax)
    1300:	6d                   	insl   (%dx),%es:(%rdi)
    1301:	75 6e                	jne    1371 <syscall_id_to_name+0x1331>
    1303:	6c                   	insb   (%dx),%es:(%rdi)
    1304:	6f                   	outsl  %ds:(%rsi),(%dx)
    1305:	63 6b 00             	movslq 0x0(%rbx),%ebp
	...
    1320:	6d                   	insl   (%dx),%es:(%rdi)
    1321:	6c                   	insb   (%dx),%es:(%rdi)
    1322:	6f                   	outsl  %ds:(%rsi),(%dx)
    1323:	63 6b 61             	movslq 0x61(%rbx),%ebp
    1326:	6c                   	insb   (%dx),%es:(%rdi)
    1327:	6c                   	insb   (%dx),%es:(%rdi)
	...
    1340:	6d                   	insl   (%dx),%es:(%rdi)
    1341:	75 6e                	jne    13b1 <syscall_id_to_name+0x1371>
    1343:	6c                   	insb   (%dx),%es:(%rdi)
    1344:	6f                   	outsl  %ds:(%rsi),(%dx)
    1345:	63 6b 61             	movslq 0x61(%rbx),%ebp
    1348:	6c                   	insb   (%dx),%es:(%rdi)
    1349:	6c                   	insb   (%dx),%es:(%rdi)
	...
    135e:	00 00                	add    %al,(%rax)
    1360:	76 68                	jbe    13ca <syscall_id_to_name+0x138a>
    1362:	61                   	(bad)  
    1363:	6e                   	outsb  %ds:(%rsi),(%dx)
    1364:	67 75 70             	addr32 jne 13d7 <syscall_id_to_name+0x1397>
	...
    137f:	00 6d 6f             	add    %ch,0x6f(%rbp)
    1382:	64 69 66 79 5f 6c 64 	imul   $0x74646c5f,%fs:0x79(%rsi),%esp
    1389:	74 
	...
    139e:	00 00                	add    %al,(%rax)
    13a0:	70 69                	jo     140b <syscall_id_to_name+0x13cb>
    13a2:	76 6f                	jbe    1413 <syscall_id_to_name+0x13d3>
    13a4:	74 5f                	je     1405 <syscall_id_to_name+0x13c5>
    13a6:	72 6f                	jb     1417 <syscall_id_to_name+0x13d7>
    13a8:	6f                   	outsl  %ds:(%rsi),(%dx)
    13a9:	74 00                	je     13ab <syscall_id_to_name+0x136b>
	...
    13bf:	00 5f 73             	add    %bl,0x73(%rdi)
    13c2:	79 73                	jns    1437 <syscall_id_to_name+0x13f7>
    13c4:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
    13e0:	70 72                	jo     1454 <syscall_id_to_name+0x1414>
    13e2:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
    13fe:	00 00                	add    %al,(%rax)
    1400:	61                   	(bad)  
    1401:	72 63                	jb     1466 <syscall_id_to_name+0x1426>
    1403:	68 5f 70 72 63       	pushq  $0x6372705f
    1408:	74 6c                	je     1476 <syscall_id_to_name+0x1436>
	...
    141e:	00 00                	add    %al,(%rax)
    1420:	61                   	(bad)  
    1421:	64 6a 74             	fs pushq $0x74
    1424:	69 6d 65 78 00 00 00 	imul   $0x78,0x65(%rbp),%ebp
	...
    143f:	00 73 65             	add    %dh,0x65(%rbx)
    1442:	74 72                	je     14b6 <syscall_id_to_name+0x1476>
    1444:	6c                   	insb   (%dx),%es:(%rdi)
    1445:	69 6d 69 74 00 00 00 	imul   $0x74,0x69(%rbp),%ebp
	...
    1460:	63 68 72             	movslq 0x72(%rax),%ebp
    1463:	6f                   	outsl  %ds:(%rsi),(%dx)
    1464:	6f                   	outsl  %ds:(%rsi),(%dx)
    1465:	74 00                	je     1467 <syscall_id_to_name+0x1427>
	...
    147f:	00 73 79             	add    %dh,0x79(%rbx)
    1482:	6e                   	outsb  %ds:(%rsi),(%dx)
    1483:	63 00                	movslq (%rax),%eax
	...
    149d:	00 00                	add    %al,(%rax)
    149f:	00 61 63             	add    %ah,0x63(%rcx)
    14a2:	63 74 00 00          	movslq 0x0(%rax,%rax,1),%esi
	...
    14be:	00 00                	add    %al,(%rax)
    14c0:	73 65                	jae    1527 <syscall_id_to_name+0x14e7>
    14c2:	74 74                	je     1538 <syscall_id_to_name+0x14f8>
    14c4:	69 6d 65 6f 66 64 61 	imul   $0x6164666f,0x65(%rbp),%ebp
    14cb:	79 00                	jns    14cd <syscall_id_to_name+0x148d>
	...
    14dd:	00 00                	add    %al,(%rax)
    14df:	00 6d 6f             	add    %ch,0x6f(%rbp)
    14e2:	75 6e                	jne    1552 <syscall_id_to_name+0x1512>
    14e4:	74 00                	je     14e6 <syscall_id_to_name+0x14a6>
	...
    14fe:	00 00                	add    %al,(%rax)
    1500:	75 6d                	jne    156f <syscall_id_to_name+0x152f>
    1502:	6f                   	outsl  %ds:(%rsi),(%dx)
    1503:	75 6e                	jne    1573 <syscall_id_to_name+0x1533>
    1505:	74 32                	je     1539 <syscall_id_to_name+0x14f9>
	...
    151f:	00 73 77             	add    %dh,0x77(%rbx)
    1522:	61                   	(bad)  
    1523:	70 6f                	jo     1594 <syscall_id_to_name+0x1554>
    1525:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
    153e:	00 00                	add    %al,(%rax)
    1540:	73 77                	jae    15b9 <syscall_id_to_name+0x1579>
    1542:	61                   	(bad)  
    1543:	70 6f                	jo     15b4 <syscall_id_to_name+0x1574>
    1545:	66 66 00 00          	data16 data16 add %al,(%rax)
	...
    155d:	00 00                	add    %al,(%rax)
    155f:	00 72 65             	add    %dh,0x65(%rdx)
    1562:	62                   	(bad)  
    1563:	6f                   	outsl  %ds:(%rsi),(%dx)
    1564:	6f                   	outsl  %ds:(%rsi),(%dx)
    1565:	74 00                	je     1567 <syscall_id_to_name+0x1527>
	...
    157f:	00 73 65             	add    %dh,0x65(%rbx)
    1582:	74 68                	je     15ec <syscall_id_to_name+0x15ac>
    1584:	6f                   	outsl  %ds:(%rsi),(%dx)
    1585:	73 74                	jae    15fb <syscall_id_to_name+0x15bb>
    1587:	6e                   	outsb  %ds:(%rsi),(%dx)
    1588:	61                   	(bad)  
    1589:	6d                   	insl   (%dx),%es:(%rdi)
    158a:	65 00 00             	add    %al,%gs:(%rax)
	...
    159d:	00 00                	add    %al,(%rax)
    159f:	00 73 65             	add    %dh,0x65(%rbx)
    15a2:	74 64                	je     1608 <syscall_id_to_name+0x15c8>
    15a4:	6f                   	outsl  %ds:(%rsi),(%dx)
    15a5:	6d                   	insl   (%dx),%es:(%rdi)
    15a6:	61                   	(bad)  
    15a7:	69 6e 6e 61 6d 65 00 	imul   $0x656d61,0x6e(%rsi),%ebp
	...
    15be:	00 00                	add    %al,(%rax)
    15c0:	69 6f 70 6c 00 00 00 	imul   $0x6c,0x70(%rdi),%ebp
	...
    15df:	00 69 6f             	add    %ch,0x6f(%rcx)
    15e2:	70 65                	jo     1649 <syscall_id_to_name+0x1609>
    15e4:	72 6d                	jb     1653 <syscall_id_to_name+0x1613>
	...
    15fe:	00 00                	add    %al,(%rax)
    1600:	63 72 65             	movslq 0x65(%rdx),%esi
    1603:	61                   	(bad)  
    1604:	74 65                	je     166b <syscall_id_to_name+0x162b>
    1606:	5f                   	pop    %rdi
    1607:	6d                   	insl   (%dx),%es:(%rdi)
    1608:	6f                   	outsl  %ds:(%rsi),(%dx)
    1609:	64 75 6c             	fs jne 1678 <syscall_id_to_name+0x1638>
    160c:	65 00 00             	add    %al,%gs:(%rax)
	...
    161f:	00 69 6e             	add    %ch,0x6e(%rcx)
    1622:	69 74 5f 6d 6f 64 75 	imul   $0x6c75646f,0x6d(%rdi,%rbx,2),%esi
    1629:	6c 
    162a:	65 00 00             	add    %al,%gs:(%rax)
	...
    163d:	00 00                	add    %al,(%rax)
    163f:	00 64 65 6c          	add    %ah,0x6c(%rbp,%riz,2)
    1643:	65 74 65             	gs je  16ab <syscall_id_to_name+0x166b>
    1646:	5f                   	pop    %rdi
    1647:	6d                   	insl   (%dx),%es:(%rdi)
    1648:	6f                   	outsl  %ds:(%rsi),(%dx)
    1649:	64 75 6c             	fs jne 16b8 <syscall_id_to_name+0x1678>
    164c:	65 00 00             	add    %al,%gs:(%rax)
	...
    165f:	00 67 65             	add    %ah,0x65(%rdi)
    1662:	74 5f                	je     16c3 <syscall_id_to_name+0x1683>
    1664:	6b 65 72 6e          	imul   $0x6e,0x72(%rbp),%esp
    1668:	65 6c                	gs insb (%dx),%es:(%rdi)
    166a:	5f                   	pop    %rdi
    166b:	73 79                	jae    16e6 <syscall_id_to_name+0x16a6>
    166d:	6d                   	insl   (%dx),%es:(%rdi)
    166e:	73 00                	jae    1670 <syscall_id_to_name+0x1630>
	...
    1680:	71 75                	jno    16f7 <syscall_id_to_name+0x16b7>
    1682:	65 72 79             	gs jb  16fe <syscall_id_to_name+0x16be>
    1685:	5f                   	pop    %rdi
    1686:	6d                   	insl   (%dx),%es:(%rdi)
    1687:	6f                   	outsl  %ds:(%rsi),(%dx)
    1688:	64 75 6c             	fs jne 16f7 <syscall_id_to_name+0x16b7>
    168b:	65 00 00             	add    %al,%gs:(%rax)
	...
    169e:	00 00                	add    %al,(%rax)
    16a0:	71 75                	jno    1717 <syscall_id_to_name+0x16d7>
    16a2:	6f                   	outsl  %ds:(%rsi),(%dx)
    16a3:	74 61                	je     1706 <syscall_id_to_name+0x16c6>
    16a5:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
    16bd:	00 00                	add    %al,(%rax)
    16bf:	00 6e 66             	add    %ch,0x66(%rsi)
    16c2:	73 73                	jae    1737 <syscall_id_to_name+0x16f7>
    16c4:	65 72 76             	gs jb  173d <syscall_id_to_name+0x16fd>
    16c7:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
    16df:	00 67 65             	add    %ah,0x65(%rdi)
    16e2:	74 70                	je     1754 <syscall_id_to_name+0x1714>
    16e4:	6d                   	insl   (%dx),%es:(%rdi)
    16e5:	73 67                	jae    174e <syscall_id_to_name+0x170e>
	...
    16ff:	00 70 75             	add    %dh,0x75(%rax)
    1702:	74 70                	je     1774 <syscall_id_to_name+0x1734>
    1704:	6d                   	insl   (%dx),%es:(%rdi)
    1705:	73 67                	jae    176e <syscall_id_to_name+0x172e>
	...
    171f:	00 61 66             	add    %ah,0x66(%rcx)
    1722:	73 5f                	jae    1783 <syscall_id_to_name+0x1743>
    1724:	73 79                	jae    179f <syscall_id_to_name+0x175f>
    1726:	73 63                	jae    178b <syscall_id_to_name+0x174b>
    1728:	61                   	(bad)  
    1729:	6c                   	insb   (%dx),%es:(%rdi)
    172a:	6c                   	insb   (%dx),%es:(%rdi)
	...
    173f:	00 74 75 78          	add    %dh,0x78(%rbp,%rsi,2)
    1743:	63 61 6c             	movslq 0x6c(%rcx),%esp
    1746:	6c                   	insb   (%dx),%es:(%rdi)
	...
    175f:	00 73 65             	add    %dh,0x65(%rbx)
    1762:	63 75 72             	movslq 0x72(%rbp),%esi
    1765:	69 74 79 00 00 00 00 	imul   $0x0,0x0(%rcx,%rdi,2),%esi
    176c:	00 
	...
    177d:	00 00                	add    %al,(%rax)
    177f:	00 67 65             	add    %ah,0x65(%rdi)
    1782:	74 74                	je     17f8 <syscall_id_to_name+0x17b8>
    1784:	69 64 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esp
    178b:	00 
	...
    17a0:	72 65                	jb     1807 <syscall_id_to_name+0x17c7>
    17a2:	61                   	(bad)  
    17a3:	64 61                	fs (bad) 
    17a5:	68 65 61 64 00       	pushq  $0x646165
	...
    17be:	00 00                	add    %al,(%rax)
    17c0:	73 65                	jae    1827 <syscall_id_to_name+0x17e7>
    17c2:	74 78                	je     183c <syscall_id_to_name+0x17fc>
    17c4:	61                   	(bad)  
    17c5:	74 74                	je     183b <syscall_id_to_name+0x17fb>
    17c7:	72 00                	jb     17c9 <syscall_id_to_name+0x1789>
	...
    17dd:	00 00                	add    %al,(%rax)
    17df:	00 6c 73 65          	add    %ch,0x65(%rbx,%rsi,2)
    17e3:	74 78                	je     185d <syscall_id_to_name+0x181d>
    17e5:	61                   	(bad)  
    17e6:	74 74                	je     185c <syscall_id_to_name+0x181c>
    17e8:	72 00                	jb     17ea <syscall_id_to_name+0x17aa>
	...
    17fe:	00 00                	add    %al,(%rax)
    1800:	66 73 65             	data16 jae 1868 <syscall_id_to_name+0x1828>
    1803:	74 78                	je     187d <syscall_id_to_name+0x183d>
    1805:	61                   	(bad)  
    1806:	74 74                	je     187c <syscall_id_to_name+0x183c>
    1808:	72 00                	jb     180a <syscall_id_to_name+0x17ca>
	...
    181e:	00 00                	add    %al,(%rax)
    1820:	67 65 74 78          	addr32 gs je 189c <syscall_id_to_name+0x185c>
    1824:	61                   	(bad)  
    1825:	74 74                	je     189b <syscall_id_to_name+0x185b>
    1827:	72 00                	jb     1829 <syscall_id_to_name+0x17e9>
	...
    183d:	00 00                	add    %al,(%rax)
    183f:	00 6c 67 65          	add    %ch,0x65(%rdi,%riz,2)
    1843:	74 78                	je     18bd <syscall_id_to_name+0x187d>
    1845:	61                   	(bad)  
    1846:	74 74                	je     18bc <syscall_id_to_name+0x187c>
    1848:	72 00                	jb     184a <syscall_id_to_name+0x180a>
	...
    185e:	00 00                	add    %al,(%rax)
    1860:	66 67 65 74 78       	data16 addr32 gs je 18dd <syscall_id_to_name+0x189d>
    1865:	61                   	(bad)  
    1866:	74 74                	je     18dc <syscall_id_to_name+0x189c>
    1868:	72 00                	jb     186a <syscall_id_to_name+0x182a>
	...
    187e:	00 00                	add    %al,(%rax)
    1880:	6c                   	insb   (%dx),%es:(%rdi)
    1881:	69 73 74 78 61 74 74 	imul   $0x74746178,0x74(%rbx),%esi
    1888:	72 00                	jb     188a <syscall_id_to_name+0x184a>
	...
    189e:	00 00                	add    %al,(%rax)
    18a0:	6c                   	insb   (%dx),%es:(%rdi)
    18a1:	6c                   	insb   (%dx),%es:(%rdi)
    18a2:	69 73 74 78 61 74 74 	imul   $0x74746178,0x74(%rbx),%esi
    18a9:	72 00                	jb     18ab <syscall_id_to_name+0x186b>
	...
    18bf:	00 66 6c             	add    %ah,0x6c(%rsi)
    18c2:	69 73 74 78 61 74 74 	imul   $0x74746178,0x74(%rbx),%esi
    18c9:	72 00                	jb     18cb <syscall_id_to_name+0x188b>
	...
    18df:	00 72 65             	add    %dh,0x65(%rdx)
    18e2:	6d                   	insl   (%dx),%es:(%rdi)
    18e3:	6f                   	outsl  %ds:(%rsi),(%dx)
    18e4:	76 65                	jbe    194b <syscall_id_to_name+0x190b>
    18e6:	78 61                	js     1949 <syscall_id_to_name+0x1909>
    18e8:	74 74                	je     195e <syscall_id_to_name+0x191e>
    18ea:	72 00                	jb     18ec <syscall_id_to_name+0x18ac>
	...
    1900:	6c                   	insb   (%dx),%es:(%rdi)
    1901:	72 65                	jb     1968 <syscall_id_to_name+0x1928>
    1903:	6d                   	insl   (%dx),%es:(%rdi)
    1904:	6f                   	outsl  %ds:(%rsi),(%dx)
    1905:	76 65                	jbe    196c <syscall_id_to_name+0x192c>
    1907:	78 61                	js     196a <syscall_id_to_name+0x192a>
    1909:	74 74                	je     197f <syscall_id_to_name+0x193f>
    190b:	72 00                	jb     190d <syscall_id_to_name+0x18cd>
	...
    191d:	00 00                	add    %al,(%rax)
    191f:	00 66 72             	add    %ah,0x72(%rsi)
    1922:	65 6d                	gs insl (%dx),%es:(%rdi)
    1924:	6f                   	outsl  %ds:(%rsi),(%dx)
    1925:	76 65                	jbe    198c <syscall_id_to_name+0x194c>
    1927:	78 61                	js     198a <syscall_id_to_name+0x194a>
    1929:	74 74                	je     199f <syscall_id_to_name+0x195f>
    192b:	72 00                	jb     192d <syscall_id_to_name+0x18ed>
	...
    193d:	00 00                	add    %al,(%rax)
    193f:	00 74 6b 69          	add    %dh,0x69(%rbx,%rbp,2)
    1943:	6c                   	insb   (%dx),%es:(%rdi)
    1944:	6c                   	insb   (%dx),%es:(%rdi)
	...
    195d:	00 00                	add    %al,(%rax)
    195f:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
    1963:	65 00 00             	add    %al,%gs:(%rax)
	...
    197e:	00 00                	add    %al,(%rax)
    1980:	66 75 74             	data16 jne 19f7 <syscall_id_to_name+0x19b7>
    1983:	65 78 00             	gs js  1986 <syscall_id_to_name+0x1946>
	...
    199e:	00 00                	add    %al,(%rax)
    19a0:	73 63                	jae    1a05 <syscall_id_to_name+0x19c5>
    19a2:	68 65 64 5f 73       	pushq  $0x735f6465
    19a7:	65 74 61             	gs je  1a0b <syscall_id_to_name+0x19cb>
    19aa:	66 66 69 6e 69 74 79 	data16 imul $0x7974,0x69(%rsi),%bp
	...
    19bd:	00 00                	add    %al,(%rax)
    19bf:	00 73 63             	add    %dh,0x63(%rbx)
    19c2:	68 65 64 5f 67       	pushq  $0x675f6465
    19c7:	65 74 61             	gs je  1a2b <syscall_id_to_name+0x19eb>
    19ca:	66 66 69 6e 69 74 79 	data16 imul $0x7974,0x69(%rsi),%bp
	...
    19dd:	00 00                	add    %al,(%rax)
    19df:	00 73 65             	add    %dh,0x65(%rbx)
    19e2:	74 5f                	je     1a43 <syscall_id_to_name+0x1a03>
    19e4:	74 68                	je     1a4e <syscall_id_to_name+0x1a0e>
    19e6:	72 65                	jb     1a4d <syscall_id_to_name+0x1a0d>
    19e8:	61                   	(bad)  
    19e9:	64 5f                	fs pop %rdi
    19eb:	61                   	(bad)  
    19ec:	72 65                	jb     1a53 <syscall_id_to_name+0x1a13>
    19ee:	61                   	(bad)  
	...
    19ff:	00 69 6f             	add    %ch,0x6f(%rcx)
    1a02:	5f                   	pop    %rdi
    1a03:	73 65                	jae    1a6a <syscall_id_to_name+0x1a2a>
    1a05:	74 75                	je     1a7c <syscall_id_to_name+0x1a3c>
    1a07:	70 00                	jo     1a09 <syscall_id_to_name+0x19c9>
	...
    1a1d:	00 00                	add    %al,(%rax)
    1a1f:	00 69 6f             	add    %ch,0x6f(%rcx)
    1a22:	5f                   	pop    %rdi
    1a23:	64 65 73 74          	fs gs jae 1a9b <syscall_id_to_name+0x1a5b>
    1a27:	72 6f                	jb     1a98 <syscall_id_to_name+0x1a58>
    1a29:	79 00                	jns    1a2b <syscall_id_to_name+0x19eb>
	...
    1a3f:	00 69 6f             	add    %ch,0x6f(%rcx)
    1a42:	5f                   	pop    %rdi
    1a43:	67 65 74 65          	addr32 gs je 1aac <syscall_id_to_name+0x1a6c>
    1a47:	76 65                	jbe    1aae <syscall_id_to_name+0x1a6e>
    1a49:	6e                   	outsb  %ds:(%rsi),(%dx)
    1a4a:	74 73                	je     1abf <syscall_id_to_name+0x1a7f>
	...
    1a60:	69 6f 5f 73 75 62 6d 	imul   $0x6d627573,0x5f(%rdi),%ebp
    1a67:	69 74 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esi
    1a6e:	00 
	...
    1a7f:	00 69 6f             	add    %ch,0x6f(%rcx)
    1a82:	5f                   	pop    %rdi
    1a83:	63 61 6e             	movslq 0x6e(%rcx),%esp
    1a86:	63 65 6c             	movslq 0x6c(%rbp),%esp
	...
    1a9d:	00 00                	add    %al,(%rax)
    1a9f:	00 67 65             	add    %ah,0x65(%rdi)
    1aa2:	74 5f                	je     1b03 <syscall_id_to_name+0x1ac3>
    1aa4:	74 68                	je     1b0e <syscall_id_to_name+0x1ace>
    1aa6:	72 65                	jb     1b0d <syscall_id_to_name+0x1acd>
    1aa8:	61                   	(bad)  
    1aa9:	64 5f                	fs pop %rdi
    1aab:	61                   	(bad)  
    1aac:	72 65                	jb     1b13 <syscall_id_to_name+0x1ad3>
    1aae:	61                   	(bad)  
	...
    1abf:	00 6c 6f 6f          	add    %ch,0x6f(%rdi,%rbp,2)
    1ac3:	6b 75 70 5f          	imul   $0x5f,0x70(%rbp),%esi
    1ac7:	64 63 6f 6f          	movslq %fs:0x6f(%rdi),%ebp
    1acb:	6b 69 65 00          	imul   $0x0,0x65(%rcx),%ebp
	...
    1adf:	00 65 70             	add    %ah,0x70(%rbp)
    1ae2:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ae3:	6c                   	insb   (%dx),%es:(%rdi)
    1ae4:	6c                   	insb   (%dx),%es:(%rdi)
    1ae5:	5f                   	pop    %rdi
    1ae6:	63 72 65             	movslq 0x65(%rdx),%esi
    1ae9:	61                   	(bad)  
    1aea:	74 65                	je     1b51 <syscall_id_to_name+0x1b11>
	...
    1b00:	65 70 6f             	gs jo  1b72 <syscall_id_to_name+0x1b32>
    1b03:	6c                   	insb   (%dx),%es:(%rdi)
    1b04:	6c                   	insb   (%dx),%es:(%rdi)
    1b05:	5f                   	pop    %rdi
    1b06:	63 74 6c 5f          	movslq 0x5f(%rsp,%rbp,2),%esi
    1b0a:	6f                   	outsl  %ds:(%rsi),(%dx)
    1b0b:	6c                   	insb   (%dx),%es:(%rdi)
    1b0c:	64 00 00             	add    %al,%fs:(%rax)
	...
    1b1f:	00 65 70             	add    %ah,0x70(%rbp)
    1b22:	6f                   	outsl  %ds:(%rsi),(%dx)
    1b23:	6c                   	insb   (%dx),%es:(%rdi)
    1b24:	6c                   	insb   (%dx),%es:(%rdi)
    1b25:	5f                   	pop    %rdi
    1b26:	77 61                	ja     1b89 <syscall_id_to_name+0x1b49>
    1b28:	69 74 5f 6f 6c 64 00 	imul   $0x646c,0x6f(%rdi,%rbx,2),%esi
    1b2f:	00 
	...
    1b40:	72 65                	jb     1ba7 <syscall_id_to_name+0x1b67>
    1b42:	6d                   	insl   (%dx),%es:(%rdi)
    1b43:	61                   	(bad)  
    1b44:	70 5f                	jo     1ba5 <syscall_id_to_name+0x1b65>
    1b46:	66 69 6c 65 5f 70 61 	imul   $0x6170,0x5f(%rbp,%riz,2),%bp
    1b4d:	67 65 73 00          	addr32 gs jae 1b51 <syscall_id_to_name+0x1b11>
	...
    1b5d:	00 00                	add    %al,(%rax)
    1b5f:	00 67 65             	add    %ah,0x65(%rdi)
    1b62:	74 64                	je     1bc8 <syscall_id_to_name+0x1b88>
    1b64:	65 6e                	outsb  %gs:(%rsi),(%dx)
    1b66:	74 73                	je     1bdb <syscall_id_to_name+0x1b9b>
    1b68:	36 34 00             	ss xor $0x0,%al
	...
    1b7f:	00 73 65             	add    %dh,0x65(%rbx)
    1b82:	74 5f                	je     1be3 <syscall_id_to_name+0x1ba3>
    1b84:	74 69                	je     1bef <syscall_id_to_name+0x1baf>
    1b86:	64 5f                	fs pop %rdi
    1b88:	61                   	(bad)  
    1b89:	64 64 72 65          	fs fs jb 1bf2 <syscall_id_to_name+0x1bb2>
    1b8d:	73 73                	jae    1c02 <syscall_id_to_name+0x1bc2>
	...
    1b9f:	00 72 65             	add    %dh,0x65(%rdx)
    1ba2:	73 74                	jae    1c18 <syscall_id_to_name+0x1bd8>
    1ba4:	61                   	(bad)  
    1ba5:	72 74                	jb     1c1b <syscall_id_to_name+0x1bdb>
    1ba7:	5f                   	pop    %rdi
    1ba8:	73 79                	jae    1c23 <syscall_id_to_name+0x1be3>
    1baa:	73 63                	jae    1c0f <syscall_id_to_name+0x1bcf>
    1bac:	61                   	(bad)  
    1bad:	6c                   	insb   (%dx),%es:(%rdi)
    1bae:	6c                   	insb   (%dx),%es:(%rdi)
	...
    1bbf:	00 73 65             	add    %dh,0x65(%rbx)
    1bc2:	6d                   	insl   (%dx),%es:(%rdi)
    1bc3:	74 69                	je     1c2e <syscall_id_to_name+0x1bee>
    1bc5:	6d                   	insl   (%dx),%es:(%rdi)
    1bc6:	65 64 6f             	gs outsl %fs:(%rsi),(%dx)
    1bc9:	70 00                	jo     1bcb <syscall_id_to_name+0x1b8b>
	...
    1bdf:	00 66 61             	add    %ah,0x61(%rsi)
    1be2:	64 76 69             	fs jbe 1c4e <syscall_id_to_name+0x1c0e>
    1be5:	73 65                	jae    1c4c <syscall_id_to_name+0x1c0c>
    1be7:	36 34 00             	ss xor $0x0,%al
	...
    1bfe:	00 00                	add    %al,(%rax)
    1c00:	74 69                	je     1c6b <syscall_id_to_name+0x1c2b>
    1c02:	6d                   	insl   (%dx),%es:(%rdi)
    1c03:	65 72 5f             	gs jb  1c65 <syscall_id_to_name+0x1c25>
    1c06:	63 72 65             	movslq 0x65(%rdx),%esi
    1c09:	61                   	(bad)  
    1c0a:	74 65                	je     1c71 <syscall_id_to_name+0x1c31>
	...
    1c20:	74 69                	je     1c8b <syscall_id_to_name+0x1c4b>
    1c22:	6d                   	insl   (%dx),%es:(%rdi)
    1c23:	65 72 5f             	gs jb  1c85 <syscall_id_to_name+0x1c45>
    1c26:	73 65                	jae    1c8d <syscall_id_to_name+0x1c4d>
    1c28:	74 74                	je     1c9e <syscall_id_to_name+0x1c5e>
    1c2a:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    1c3d:	00 00                	add    %al,(%rax)
    1c3f:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
    1c43:	65 72 5f             	gs jb  1ca5 <syscall_id_to_name+0x1c65>
    1c46:	67 65 74 74          	addr32 gs je 1cbe <syscall_id_to_name+0x1c7e>
    1c4a:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    1c5d:	00 00                	add    %al,(%rax)
    1c5f:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
    1c63:	65 72 5f             	gs jb  1cc5 <syscall_id_to_name+0x1c85>
    1c66:	67 65 74 6f          	addr32 gs je 1cd9 <syscall_id_to_name+0x1c99>
    1c6a:	76 65                	jbe    1cd1 <syscall_id_to_name+0x1c91>
    1c6c:	72 72                	jb     1ce0 <syscall_id_to_name+0x1ca0>
    1c6e:	75 6e                	jne    1cde <syscall_id_to_name+0x1c9e>
	...
    1c80:	74 69                	je     1ceb <syscall_id_to_name+0x1cab>
    1c82:	6d                   	insl   (%dx),%es:(%rdi)
    1c83:	65 72 5f             	gs jb  1ce5 <syscall_id_to_name+0x1ca5>
    1c86:	64 65 6c             	fs gs insb (%dx),%es:(%rdi)
    1c89:	65 74 65             	gs je  1cf1 <syscall_id_to_name+0x1cb1>
	...
    1ca0:	63 6c 6f 63          	movslq 0x63(%rdi,%rbp,2),%ebp
    1ca4:	6b 5f 73 65          	imul   $0x65,0x73(%rdi),%ebx
    1ca8:	74 74                	je     1d1e <syscall_id_to_name+0x1cde>
    1caa:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    1cbd:	00 00                	add    %al,(%rax)
    1cbf:	00 63 6c             	add    %ah,0x6c(%rbx)
    1cc2:	6f                   	outsl  %ds:(%rsi),(%dx)
    1cc3:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
    1cc6:	67 65 74 74          	addr32 gs je 1d3e <syscall_id_to_name+0x1cfe>
    1cca:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    1cdd:	00 00                	add    %al,(%rax)
    1cdf:	00 63 6c             	add    %ah,0x6c(%rbx)
    1ce2:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ce3:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
    1ce6:	67 65 74 72          	addr32 gs je 1d5c <syscall_id_to_name+0x1d1c>
    1cea:	65 73 00             	gs jae 1ced <syscall_id_to_name+0x1cad>
	...
    1cfd:	00 00                	add    %al,(%rax)
    1cff:	00 63 6c             	add    %ah,0x6c(%rbx)
    1d02:	6f                   	outsl  %ds:(%rsi),(%dx)
    1d03:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
    1d06:	6e                   	outsb  %ds:(%rsi),(%dx)
    1d07:	61                   	(bad)  
    1d08:	6e                   	outsb  %ds:(%rsi),(%dx)
    1d09:	6f                   	outsl  %ds:(%rsi),(%dx)
    1d0a:	73 6c                	jae    1d78 <syscall_id_to_name+0x1d38>
    1d0c:	65 65 70 00          	gs gs jo 1d10 <syscall_id_to_name+0x1cd0>
	...
    1d20:	65 78 69             	gs js  1d8c <syscall_id_to_name+0x1d4c>
    1d23:	74 5f                	je     1d84 <syscall_id_to_name+0x1d44>
    1d25:	67 72 6f             	addr32 jb 1d97 <syscall_id_to_name+0x1d57>
    1d28:	75 70                	jne    1d9a <syscall_id_to_name+0x1d5a>
	...
    1d3e:	00 00                	add    %al,(%rax)
    1d40:	65 70 6f             	gs jo  1db2 <syscall_id_to_name+0x1d72>
    1d43:	6c                   	insb   (%dx),%es:(%rdi)
    1d44:	6c                   	insb   (%dx),%es:(%rdi)
    1d45:	5f                   	pop    %rdi
    1d46:	77 61                	ja     1da9 <syscall_id_to_name+0x1d69>
    1d48:	69 74 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esi
    1d4f:	00 
	...
    1d60:	65 70 6f             	gs jo  1dd2 <syscall_id_to_name+0x1d92>
    1d63:	6c                   	insb   (%dx),%es:(%rdi)
    1d64:	6c                   	insb   (%dx),%es:(%rdi)
    1d65:	5f                   	pop    %rdi
    1d66:	63 74 6c 00          	movslq 0x0(%rsp,%rbp,2),%esi
	...
    1d7e:	00 00                	add    %al,(%rax)
    1d80:	74 67                	je     1de9 <syscall_id_to_name+0x1da9>
    1d82:	6b 69 6c 6c          	imul   $0x6c,0x6c(%rcx),%ebp
	...
    1d9e:	00 00                	add    %al,(%rax)
    1da0:	75 74                	jne    1e16 <syscall_id_to_name+0x1dd6>
    1da2:	69 6d 65 73 00 00 00 	imul   $0x73,0x65(%rbp),%ebp
	...
    1dbd:	00 00                	add    %al,(%rax)
    1dbf:	00 76 73             	add    %dh,0x73(%rsi)
    1dc2:	65 72 76             	gs jb  1e3b <syscall_id_to_name+0x1dfb>
    1dc5:	65 72 00             	gs jb  1dc8 <syscall_id_to_name+0x1d88>
	...
    1de0:	6d                   	insl   (%dx),%es:(%rdi)
    1de1:	62                   	(bad)  
    1de2:	69 6e 64 00 00 00 00 	imul   $0x0,0x64(%rsi),%ebp
	...
    1dfd:	00 00                	add    %al,(%rax)
    1dff:	00 73 65             	add    %dh,0x65(%rbx)
    1e02:	74 5f                	je     1e63 <syscall_id_to_name+0x1e23>
    1e04:	6d                   	insl   (%dx),%es:(%rdi)
    1e05:	65 6d                	gs insl (%dx),%es:(%rdi)
    1e07:	70 6f                	jo     1e78 <syscall_id_to_name+0x1e38>
    1e09:	6c                   	insb   (%dx),%es:(%rdi)
    1e0a:	69 63 79 00 00 00 00 	imul   $0x0,0x79(%rbx),%esp
	...
    1e1d:	00 00                	add    %al,(%rax)
    1e1f:	00 67 65             	add    %ah,0x65(%rdi)
    1e22:	74 5f                	je     1e83 <syscall_id_to_name+0x1e43>
    1e24:	6d                   	insl   (%dx),%es:(%rdi)
    1e25:	65 6d                	gs insl (%dx),%es:(%rdi)
    1e27:	70 6f                	jo     1e98 <syscall_id_to_name+0x1e58>
    1e29:	6c                   	insb   (%dx),%es:(%rdi)
    1e2a:	69 63 79 00 00 00 00 	imul   $0x0,0x79(%rbx),%esp
	...
    1e3d:	00 00                	add    %al,(%rax)
    1e3f:	00 6d 71             	add    %ch,0x71(%rbp)
    1e42:	5f                   	pop    %rdi
    1e43:	6f                   	outsl  %ds:(%rsi),(%dx)
    1e44:	70 65                	jo     1eab <syscall_id_to_name+0x1e6b>
    1e46:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
    1e5f:	00 6d 71             	add    %ch,0x71(%rbp)
    1e62:	5f                   	pop    %rdi
    1e63:	75 6e                	jne    1ed3 <syscall_id_to_name+0x1e93>
    1e65:	6c                   	insb   (%dx),%es:(%rdi)
    1e66:	69 6e 6b 00 00 00 00 	imul   $0x0,0x6b(%rsi),%ebp
	...
    1e7d:	00 00                	add    %al,(%rax)
    1e7f:	00 6d 71             	add    %ch,0x71(%rbp)
    1e82:	5f                   	pop    %rdi
    1e83:	74 69                	je     1eee <syscall_id_to_name+0x1eae>
    1e85:	6d                   	insl   (%dx),%es:(%rdi)
    1e86:	65 64 73 65          	gs fs jae 1eef <syscall_id_to_name+0x1eaf>
    1e8a:	6e                   	outsb  %ds:(%rsi),(%dx)
    1e8b:	64 00 00             	add    %al,%fs:(%rax)
	...
    1e9e:	00 00                	add    %al,(%rax)
    1ea0:	6d                   	insl   (%dx),%es:(%rdi)
    1ea1:	71 5f                	jno    1f02 <syscall_id_to_name+0x1ec2>
    1ea3:	74 69                	je     1f0e <syscall_id_to_name+0x1ece>
    1ea5:	6d                   	insl   (%dx),%es:(%rdi)
    1ea6:	65 64 72 65          	gs fs jb 1f0f <syscall_id_to_name+0x1ecf>
    1eaa:	63 65 69             	movslq 0x69(%rbp),%esp
    1ead:	76 65                	jbe    1f14 <syscall_id_to_name+0x1ed4>
	...
    1ebf:	00 6d 71             	add    %ch,0x71(%rbp)
    1ec2:	5f                   	pop    %rdi
    1ec3:	6e                   	outsb  %ds:(%rsi),(%dx)
    1ec4:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ec5:	74 69                	je     1f30 <syscall_id_to_name+0x1ef0>
    1ec7:	66 79 00             	data16 jns 1eca <syscall_id_to_name+0x1e8a>
	...
    1ede:	00 00                	add    %al,(%rax)
    1ee0:	6d                   	insl   (%dx),%es:(%rdi)
    1ee1:	71 5f                	jno    1f42 <syscall_id_to_name+0x1f02>
    1ee3:	67 65 74 73          	addr32 gs je 1f5a <syscall_id_to_name+0x1f1a>
    1ee7:	65 74 61             	gs je  1f4b <syscall_id_to_name+0x1f0b>
    1eea:	74 74                	je     1f60 <syscall_id_to_name+0x1f20>
    1eec:	72 00                	jb     1eee <syscall_id_to_name+0x1eae>
	...
    1efe:	00 00                	add    %al,(%rax)
    1f00:	6b 65 78 65          	imul   $0x65,0x78(%rbp),%esp
    1f04:	63 5f 6c             	movslq 0x6c(%rdi),%ebx
    1f07:	6f                   	outsl  %ds:(%rsi),(%dx)
    1f08:	61                   	(bad)  
    1f09:	64 00 00             	add    %al,%fs:(%rax)
	...
    1f20:	77 61                	ja     1f83 <syscall_id_to_name+0x1f43>
    1f22:	69 74 69 64 00 00 00 	imul   $0x0,0x64(%rcx,%rbp,2),%esi
    1f29:	00 
	...
    1f3e:	00 00                	add    %al,(%rax)
    1f40:	61                   	(bad)  
    1f41:	64 64 5f             	fs fs pop %rdi
    1f44:	6b 65 79 00          	imul   $0x0,0x79(%rbp),%esp
	...
    1f60:	72 65                	jb     1fc7 <syscall_id_to_name+0x1f87>
    1f62:	71 75                	jno    1fd9 <syscall_id_to_name+0x1f99>
    1f64:	65 73 74             	gs jae 1fdb <syscall_id_to_name+0x1f9b>
    1f67:	5f                   	pop    %rdi
    1f68:	6b 65 79 00          	imul   $0x0,0x79(%rbp),%esp
	...
    1f80:	6b 65 79 63          	imul   $0x63,0x79(%rbp),%esp
    1f84:	74 6c                	je     1ff2 <syscall_id_to_name+0x1fb2>
	...
    1f9e:	00 00                	add    %al,(%rax)
    1fa0:	69 6f 70 72 69 6f 5f 	imul   $0x5f6f6972,0x70(%rdi),%ebp
    1fa7:	73 65                	jae    200e <syscall_id_to_name+0x1fce>
    1fa9:	74 00                	je     1fab <syscall_id_to_name+0x1f6b>
	...
    1fbf:	00 69 6f             	add    %ch,0x6f(%rcx)
    1fc2:	70 72                	jo     2036 <syscall_id_to_name+0x1ff6>
    1fc4:	69 6f 5f 67 65 74 00 	imul   $0x746567,0x5f(%rdi),%ebp
	...
    1fdf:	00 69 6e             	add    %ch,0x6e(%rcx)
    1fe2:	6f                   	outsl  %ds:(%rsi),(%dx)
    1fe3:	74 69                	je     204e <syscall_id_to_name+0x200e>
    1fe5:	66 79 5f             	data16 jns 2047 <syscall_id_to_name+0x2007>
    1fe8:	69 6e 69 74 00 00 00 	imul   $0x74,0x69(%rsi),%ebp
	...
    1fff:	00 69 6e             	add    %ch,0x6e(%rcx)
    2002:	6f                   	outsl  %ds:(%rsi),(%dx)
    2003:	74 69                	je     206e <syscall_id_to_name+0x202e>
    2005:	66 79 5f             	data16 jns 2067 <syscall_id_to_name+0x2027>
    2008:	61                   	(bad)  
    2009:	64 64 5f             	fs fs pop %rdi
    200c:	77 61                	ja     206f <syscall_id_to_name+0x202f>
    200e:	74 63                	je     2073 <syscall_id_to_name+0x2033>
    2010:	68 00 00 00 00       	pushq  $0x0
	...
    201d:	00 00                	add    %al,(%rax)
    201f:	00 69 6e             	add    %ch,0x6e(%rcx)
    2022:	6f                   	outsl  %ds:(%rsi),(%dx)
    2023:	74 69                	je     208e <syscall_id_to_name+0x204e>
    2025:	66 79 5f             	data16 jns 2087 <syscall_id_to_name+0x2047>
    2028:	72 6d                	jb     2097 <syscall_id_to_name+0x2057>
    202a:	5f                   	pop    %rdi
    202b:	77 61                	ja     208e <syscall_id_to_name+0x204e>
    202d:	74 63                	je     2092 <syscall_id_to_name+0x2052>
    202f:	68 00 00 00 00       	pushq  $0x0
	...
    2040:	6d                   	insl   (%dx),%es:(%rdi)
    2041:	69 67 72 61 74 65 5f 	imul   $0x5f657461,0x72(%rdi),%esp
    2048:	70 61                	jo     20ab <syscall_id_to_name+0x206b>
    204a:	67 65 73 00          	addr32 gs jae 204e <syscall_id_to_name+0x200e>
	...
    205e:	00 00                	add    %al,(%rax)
    2060:	6f                   	outsl  %ds:(%rsi),(%dx)
    2061:	70 65                	jo     20c8 <syscall_id_to_name+0x2088>
    2063:	6e                   	outsb  %ds:(%rsi),(%dx)
    2064:	61                   	(bad)  
    2065:	74 00                	je     2067 <syscall_id_to_name+0x2027>
	...
    207f:	00 6d 6b             	add    %ch,0x6b(%rbp)
    2082:	64 69 72 61 74 00 00 	imul   $0x74,%fs:0x61(%rdx),%esi
    2089:	00 
	...
    209e:	00 00                	add    %al,(%rax)
    20a0:	6d                   	insl   (%dx),%es:(%rdi)
    20a1:	6b 6e 6f 64          	imul   $0x64,0x6f(%rsi),%ebp
    20a5:	61                   	(bad)  
    20a6:	74 00                	je     20a8 <syscall_id_to_name+0x2068>
	...
    20c0:	66 63 68 6f          	movslq 0x6f(%rax),%bp
    20c4:	77 6e                	ja     2134 <syscall_id_to_name+0x20f4>
    20c6:	61                   	(bad)  
    20c7:	74 00                	je     20c9 <syscall_id_to_name+0x2089>
	...
    20dd:	00 00                	add    %al,(%rax)
    20df:	00 66 75             	add    %ah,0x75(%rsi)
    20e2:	74 69                	je     214d <syscall_id_to_name+0x210d>
    20e4:	6d                   	insl   (%dx),%es:(%rdi)
    20e5:	65 73 61             	gs jae 2149 <syscall_id_to_name+0x2109>
    20e8:	74 00                	je     20ea <syscall_id_to_name+0x20aa>
	...
    20fe:	00 00                	add    %al,(%rax)
    2100:	6e                   	outsb  %ds:(%rsi),(%dx)
    2101:	65 77 66             	gs ja  216a <syscall_id_to_name+0x212a>
    2104:	73 74                	jae    217a <syscall_id_to_name+0x213a>
    2106:	61                   	(bad)  
    2107:	74 61                	je     216a <syscall_id_to_name+0x212a>
    2109:	74 00                	je     210b <syscall_id_to_name+0x20cb>
	...
    211f:	00 75 6e             	add    %dh,0x6e(%rbp)
    2122:	6c                   	insb   (%dx),%es:(%rdi)
    2123:	69 6e 6b 61 74 00 00 	imul   $0x7461,0x6b(%rsi),%ebp
	...
    213e:	00 00                	add    %al,(%rax)
    2140:	72 65                	jb     21a7 <syscall_id_to_name+0x2167>
    2142:	6e                   	outsb  %ds:(%rsi),(%dx)
    2143:	61                   	(bad)  
    2144:	6d                   	insl   (%dx),%es:(%rdi)
    2145:	65 61                	gs (bad) 
    2147:	74 00                	je     2149 <syscall_id_to_name+0x2109>
	...
    215d:	00 00                	add    %al,(%rax)
    215f:	00 6c 69 6e          	add    %ch,0x6e(%rcx,%rbp,2)
    2163:	6b 61 74 00          	imul   $0x0,0x74(%rcx),%esp
	...
    217f:	00 73 79             	add    %dh,0x79(%rbx)
    2182:	6d                   	insl   (%dx),%es:(%rdi)
    2183:	6c                   	insb   (%dx),%es:(%rdi)
    2184:	69 6e 6b 61 74 00 00 	imul   $0x7461,0x6b(%rsi),%ebp
	...
    219f:	00 72 65             	add    %dh,0x65(%rdx)
    21a2:	61                   	(bad)  
    21a3:	64 6c                	fs insb (%dx),%es:(%rdi)
    21a5:	69 6e 6b 61 74 00 00 	imul   $0x7461,0x6b(%rsi),%ebp
	...
    21c0:	66 63 68 6d          	movslq 0x6d(%rax),%bp
    21c4:	6f                   	outsl  %ds:(%rsi),(%dx)
    21c5:	64 61                	fs (bad) 
    21c7:	74 00                	je     21c9 <syscall_id_to_name+0x2189>
	...
    21dd:	00 00                	add    %al,(%rax)
    21df:	00 66 61             	add    %ah,0x61(%rsi)
    21e2:	63 63 65             	movslq 0x65(%rbx),%esp
    21e5:	73 73                	jae    225a <syscall_id_to_name+0x221a>
    21e7:	61                   	(bad)  
    21e8:	74 00                	je     21ea <syscall_id_to_name+0x21aa>
	...
    21fe:	00 00                	add    %al,(%rax)
    2200:	70 73                	jo     2275 <syscall_id_to_name+0x2235>
    2202:	65 6c                	gs insb (%dx),%es:(%rdi)
    2204:	65 63 74 36 00       	movslq %gs:0x0(%rsi,%rsi,1),%esi
	...
    221d:	00 00                	add    %al,(%rax)
    221f:	00 70 70             	add    %dh,0x70(%rax)
    2222:	6f                   	outsl  %ds:(%rsi),(%dx)
    2223:	6c                   	insb   (%dx),%es:(%rdi)
    2224:	6c                   	insb   (%dx),%es:(%rdi)
	...
    223d:	00 00                	add    %al,(%rax)
    223f:	00 75 6e             	add    %dh,0x6e(%rbp)
    2242:	73 68                	jae    22ac <syscall_id_to_name+0x226c>
    2244:	61                   	(bad)  
    2245:	72 65                	jb     22ac <syscall_id_to_name+0x226c>
	...
    225f:	00 73 65             	add    %dh,0x65(%rbx)
    2262:	74 5f                	je     22c3 <syscall_id_to_name+0x2283>
    2264:	72 6f                	jb     22d5 <syscall_id_to_name+0x2295>
    2266:	62                   	(bad)  
    2267:	75 73                	jne    22dc <syscall_id_to_name+0x229c>
    2269:	74 5f                	je     22ca <syscall_id_to_name+0x228a>
    226b:	6c                   	insb   (%dx),%es:(%rdi)
    226c:	69 73 74 00 00 00 00 	imul   $0x0,0x74(%rbx),%esi
	...
    227f:	00 67 65             	add    %ah,0x65(%rdi)
    2282:	74 5f                	je     22e3 <syscall_id_to_name+0x22a3>
    2284:	72 6f                	jb     22f5 <syscall_id_to_name+0x22b5>
    2286:	62                   	(bad)  
    2287:	75 73                	jne    22fc <syscall_id_to_name+0x22bc>
    2289:	74 5f                	je     22ea <syscall_id_to_name+0x22aa>
    228b:	6c                   	insb   (%dx),%es:(%rdi)
    228c:	69 73 74 00 00 00 00 	imul   $0x0,0x74(%rbx),%esi
	...
    229f:	00 73 70             	add    %dh,0x70(%rbx)
    22a2:	6c                   	insb   (%dx),%es:(%rdi)
    22a3:	69 63 65 00 00 00 00 	imul   $0x0,0x65(%rbx),%esp
	...
    22be:	00 00                	add    %al,(%rax)
    22c0:	74 65                	je     2327 <syscall_id_to_name+0x22e7>
    22c2:	65 00 00             	add    %al,%gs:(%rax)
	...
    22dd:	00 00                	add    %al,(%rax)
    22df:	00 73 79             	add    %dh,0x79(%rbx)
    22e2:	6e                   	outsb  %ds:(%rsi),(%dx)
    22e3:	63 5f 66             	movslq 0x66(%rdi),%ebx
    22e6:	69 6c 65 5f 72 61 6e 	imul   $0x676e6172,0x5f(%rbp,%riz,2),%ebp
    22ed:	67 
    22ee:	65 00 00             	add    %al,%gs:(%rax)
	...
    22fd:	00 00                	add    %al,(%rax)
    22ff:	00 76 6d             	add    %dh,0x6d(%rsi)
    2302:	73 70                	jae    2374 <syscall_id_to_name+0x2334>
    2304:	6c                   	insb   (%dx),%es:(%rdi)
    2305:	69 63 65 00 00 00 00 	imul   $0x0,0x65(%rbx),%esp
	...
    2320:	6d                   	insl   (%dx),%es:(%rdi)
    2321:	6f                   	outsl  %ds:(%rsi),(%dx)
    2322:	76 65                	jbe    2389 <syscall_id_to_name+0x2349>
    2324:	5f                   	pop    %rdi
    2325:	70 61                	jo     2388 <syscall_id_to_name+0x2348>
    2327:	67 65 73 00          	addr32 gs jae 232b <syscall_id_to_name+0x22eb>
	...
    233f:	00 75 74             	add    %dh,0x74(%rbp)
    2342:	69 6d 65 6e 73 61 74 	imul   $0x7461736e,0x65(%rbp),%ebp
	...
    235d:	00 00                	add    %al,(%rax)
    235f:	00 65 70             	add    %ah,0x70(%rbp)
    2362:	6f                   	outsl  %ds:(%rsi),(%dx)
    2363:	6c                   	insb   (%dx),%es:(%rdi)
    2364:	6c                   	insb   (%dx),%es:(%rdi)
    2365:	5f                   	pop    %rdi
    2366:	70 77                	jo     23df <syscall_id_to_name+0x239f>
    2368:	61                   	(bad)  
    2369:	69 74 00 00 00 00 00 	imul   $0x0,0x0(%rax,%rax,1),%esi
    2370:	00 
	...
    237d:	00 00                	add    %al,(%rax)
    237f:	00 73 69             	add    %dh,0x69(%rbx)
    2382:	67 6e                	outsb  %ds:(%esi),(%dx)
    2384:	61                   	(bad)  
    2385:	6c                   	insb   (%dx),%es:(%rdi)
    2386:	66 64 00 00          	data16 add %al,%fs:(%rax)
	...
    239e:	00 00                	add    %al,(%rax)
    23a0:	74 69                	je     240b <syscall_id_to_name+0x23cb>
    23a2:	6d                   	insl   (%dx),%es:(%rdi)
    23a3:	65 72 66             	gs jb  240c <syscall_id_to_name+0x23cc>
    23a6:	64 5f                	fs pop %rdi
    23a8:	63 72 65             	movslq 0x65(%rdx),%esi
    23ab:	61                   	(bad)  
    23ac:	74 65                	je     2413 <syscall_id_to_name+0x23d3>
	...
    23be:	00 00                	add    %al,(%rax)
    23c0:	65 76 65             	gs jbe 2428 <syscall_id_to_name+0x23e8>
    23c3:	6e                   	outsb  %ds:(%rsi),(%dx)
    23c4:	74 66                	je     242c <syscall_id_to_name+0x23ec>
    23c6:	64 00 00             	add    %al,%fs:(%rax)
	...
    23dd:	00 00                	add    %al,(%rax)
    23df:	00 66 61             	add    %ah,0x61(%rsi)
    23e2:	6c                   	insb   (%dx),%es:(%rdi)
    23e3:	6c                   	insb   (%dx),%es:(%rdi)
    23e4:	6f                   	outsl  %ds:(%rsi),(%dx)
    23e5:	63 61 74             	movslq 0x74(%rcx),%esp
    23e8:	65 00 00             	add    %al,%gs:(%rax)
	...
    23ff:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
    2403:	65 72 66             	gs jb  246c <syscall_id_to_name+0x242c>
    2406:	64 5f                	fs pop %rdi
    2408:	73 65                	jae    246f <syscall_id_to_name+0x242f>
    240a:	74 74                	je     2480 <syscall_id_to_name+0x2440>
    240c:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    241f:	00 74 69 6d          	add    %dh,0x6d(%rcx,%rbp,2)
    2423:	65 72 66             	gs jb  248c <syscall_id_to_name+0x244c>
    2426:	64 5f                	fs pop %rdi
    2428:	67 65 74 74          	addr32 gs je 24a0 <syscall_id_to_name+0x2460>
    242c:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    243f:	00 61 63             	add    %ah,0x63(%rcx)
    2442:	63 65 70             	movslq 0x70(%rbp),%esp
    2445:	74 34                	je     247b <syscall_id_to_name+0x243b>
	...
    245f:	00 73 69             	add    %dh,0x69(%rbx)
    2462:	67 6e                	outsb  %ds:(%esi),(%dx)
    2464:	61                   	(bad)  
    2465:	6c                   	insb   (%dx),%es:(%rdi)
    2466:	66 64 34 00          	data16 fs xor $0x0,%al
	...
    247e:	00 00                	add    %al,(%rax)
    2480:	65 76 65             	gs jbe 24e8 <syscall_id_to_name+0x24a8>
    2483:	6e                   	outsb  %ds:(%rsi),(%dx)
    2484:	74 66                	je     24ec <syscall_id_to_name+0x24ac>
    2486:	64 32 00             	xor    %fs:(%rax),%al
	...
    249d:	00 00                	add    %al,(%rax)
    249f:	00 65 70             	add    %ah,0x70(%rbp)
    24a2:	6f                   	outsl  %ds:(%rsi),(%dx)
    24a3:	6c                   	insb   (%dx),%es:(%rdi)
    24a4:	6c                   	insb   (%dx),%es:(%rdi)
    24a5:	5f                   	pop    %rdi
    24a6:	63 72 65             	movslq 0x65(%rdx),%esi
    24a9:	61                   	(bad)  
    24aa:	74 65                	je     2511 <syscall_id_to_name+0x24d1>
    24ac:	31 00                	xor    %eax,(%rax)
	...
    24be:	00 00                	add    %al,(%rax)
    24c0:	64 75 70             	fs jne 2533 <syscall_id_to_name+0x24f3>
    24c3:	33 00                	xor    (%rax),%eax
	...
    24dd:	00 00                	add    %al,(%rax)
    24df:	00 70 69             	add    %dh,0x69(%rax)
    24e2:	70 65                	jo     2549 <syscall_id_to_name+0x2509>
    24e4:	32 00                	xor    (%rax),%al
	...
    24fe:	00 00                	add    %al,(%rax)
    2500:	69 6e 6f 74 69 66 79 	imul   $0x79666974,0x6f(%rsi),%ebp
    2507:	5f                   	pop    %rdi
    2508:	69 6e 69 74 31 00 00 	imul   $0x3174,0x69(%rsi),%ebp
	...
    251f:	00 70 72             	add    %dh,0x72(%rax)
    2522:	65 61                	gs (bad) 
    2524:	64 76 00             	fs jbe 2527 <syscall_id_to_name+0x24e7>
	...
    253f:	00 70 77             	add    %dh,0x77(%rax)
    2542:	72 69                	jb     25ad <syscall_id_to_name+0x256d>
    2544:	74 65                	je     25ab <syscall_id_to_name+0x256b>
    2546:	76 00                	jbe    2548 <syscall_id_to_name+0x2508>
	...
    2560:	72 74                	jb     25d6 <syscall_id_to_name+0x2596>
    2562:	5f                   	pop    %rdi
    2563:	74 67                	je     25cc <syscall_id_to_name+0x258c>
    2565:	73 69                	jae    25d0 <syscall_id_to_name+0x2590>
    2567:	67 71 75             	addr32 jno 25df <syscall_id_to_name+0x259f>
    256a:	65 75 65             	gs jne 25d2 <syscall_id_to_name+0x2592>
    256d:	69 6e 66 6f 00 00 00 	imul   $0x6f,0x66(%rsi),%ebp
	...
    2580:	70 65                	jo     25e7 <syscall_id_to_name+0x25a7>
    2582:	72 66                	jb     25ea <syscall_id_to_name+0x25aa>
    2584:	5f                   	pop    %rdi
    2585:	65 76 65             	gs jbe 25ed <syscall_id_to_name+0x25ad>
    2588:	6e                   	outsb  %ds:(%rsi),(%dx)
    2589:	74 5f                	je     25ea <syscall_id_to_name+0x25aa>
    258b:	6f                   	outsl  %ds:(%rsi),(%dx)
    258c:	70 65                	jo     25f3 <syscall_id_to_name+0x25b3>
    258e:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
    259f:	00 72 65             	add    %dh,0x65(%rdx)
    25a2:	63 76 6d             	movslq 0x6d(%rsi),%esi
    25a5:	6d                   	insl   (%dx),%es:(%rdi)
    25a6:	73 67                	jae    260f <syscall_id_to_name+0x25cf>
	...
    25c0:	66 61                	data16 (bad) 
    25c2:	6e                   	outsb  %ds:(%rsi),(%dx)
    25c3:	6f                   	outsl  %ds:(%rsi),(%dx)
    25c4:	74 69                	je     262f <syscall_id_to_name+0x25ef>
    25c6:	66 79 5f             	data16 jns 2628 <syscall_id_to_name+0x25e8>
    25c9:	69 6e 69 74 00 00 00 	imul   $0x74,0x69(%rsi),%ebp
	...
    25e0:	66 61                	data16 (bad) 
    25e2:	6e                   	outsb  %ds:(%rsi),(%dx)
    25e3:	6f                   	outsl  %ds:(%rsi),(%dx)
    25e4:	74 69                	je     264f <syscall_id_to_name+0x260f>
    25e6:	66 79 5f             	data16 jns 2648 <syscall_id_to_name+0x2608>
    25e9:	6d                   	insl   (%dx),%es:(%rdi)
    25ea:	61                   	(bad)  
    25eb:	72 6b                	jb     2658 <syscall_id_to_name+0x2618>
	...
    25fd:	00 00                	add    %al,(%rax)
    25ff:	00 70 72             	add    %dh,0x72(%rax)
    2602:	6c                   	insb   (%dx),%es:(%rdi)
    2603:	69 6d 69 74 36 34 00 	imul   $0x343674,0x69(%rbp),%ebp
	...
    261e:	00 00                	add    %al,(%rax)
    2620:	6e                   	outsb  %ds:(%rsi),(%dx)
    2621:	61                   	(bad)  
    2622:	6d                   	insl   (%dx),%es:(%rdi)
    2623:	65 5f                	gs pop %rdi
    2625:	74 6f                	je     2696 <syscall_id_to_name+0x2656>
    2627:	5f                   	pop    %rdi
    2628:	68 61 6e 64 6c       	pushq  $0x6c646e61
    262d:	65 5f                	gs pop %rdi
    262f:	61                   	(bad)  
    2630:	74 00                	je     2632 <syscall_id_to_name+0x25f2>
	...
    263e:	00 00                	add    %al,(%rax)
    2640:	6f                   	outsl  %ds:(%rsi),(%dx)
    2641:	70 65                	jo     26a8 <syscall_id_to_name+0x2668>
    2643:	6e                   	outsb  %ds:(%rsi),(%dx)
    2644:	5f                   	pop    %rdi
    2645:	62                   	(bad)  
    2646:	79 5f                	jns    26a7 <syscall_id_to_name+0x2667>
    2648:	68 61 6e 64 6c       	pushq  $0x6c646e61
    264d:	65 5f                	gs pop %rdi
    264f:	61                   	(bad)  
    2650:	74 00                	je     2652 <syscall_id_to_name+0x2612>
	...
    265e:	00 00                	add    %al,(%rax)
    2660:	63 6c 6f 63          	movslq 0x63(%rdi,%rbp,2),%ebp
    2664:	6b 5f 61 64          	imul   $0x64,0x61(%rdi),%ebx
    2668:	6a 74                	pushq  $0x74
    266a:	69 6d 65 00 00 00 00 	imul   $0x0,0x65(%rbp),%ebp
	...
    267d:	00 00                	add    %al,(%rax)
    267f:	00 73 79             	add    %dh,0x79(%rbx)
    2682:	6e                   	outsb  %ds:(%rsi),(%dx)
    2683:	63 66 73             	movslq 0x73(%rsi),%esp
	...
    269e:	00 00                	add    %al,(%rax)
    26a0:	73 65                	jae    2707 <syscall_id_to_name+0x26c7>
    26a2:	6e                   	outsb  %ds:(%rsi),(%dx)
    26a3:	64 6d                	fs insl (%dx),%es:(%rdi)
    26a5:	6d                   	insl   (%dx),%es:(%rdi)
    26a6:	73 67                	jae    270f <syscall_id_to_name+0x26cf>
	...
    26c0:	73 65                	jae    2727 <syscall_id_to_name+0x26e7>
    26c2:	74 6e                	je     2732 <syscall_id_to_name+0x26f2>
    26c4:	73 00                	jae    26c6 <syscall_id_to_name+0x2686>
	...
    26de:	00 00                	add    %al,(%rax)
    26e0:	67 65 74 63          	addr32 gs je 2747 <syscall_id_to_name+0x2707>
    26e4:	70 75                	jo     275b <syscall_id_to_name+0x271b>
	...
    26fe:	00 00                	add    %al,(%rax)
    2700:	70 72                	jo     2774 <syscall_id_to_name+0x2734>
    2702:	6f                   	outsl  %ds:(%rsi),(%dx)
    2703:	63 65 73             	movslq 0x73(%rbp),%esp
    2706:	73 5f                	jae    2767 <syscall_id_to_name+0x2727>
    2708:	76 6d                	jbe    2777 <syscall_id_to_name+0x2737>
    270a:	5f                   	pop    %rdi
    270b:	72 65                	jb     2772 <syscall_id_to_name+0x2732>
    270d:	61                   	(bad)  
    270e:	64 76 00             	fs jbe 2711 <syscall_id_to_name+0x26d1>
	...
    271d:	00 00                	add    %al,(%rax)
    271f:	00 70 72             	add    %dh,0x72(%rax)
    2722:	6f                   	outsl  %ds:(%rsi),(%dx)
    2723:	63 65 73             	movslq 0x73(%rbp),%esp
    2726:	73 5f                	jae    2787 <syscall_id_to_name+0x2747>
    2728:	76 6d                	jbe    2797 <syscall_id_to_name+0x2757>
    272a:	5f                   	pop    %rdi
    272b:	77 72                	ja     279f <syscall_id_to_name+0x275f>
    272d:	69 74 65 76 00 00 00 	imul   $0x0,0x76(%rbp,%riz,2),%esi
    2734:	00 
	...
    273d:	00 00                	add    %al,(%rax)
    273f:	00 6b 63             	add    %ch,0x63(%rbx)
    2742:	6d                   	insl   (%dx),%es:(%rdi)
    2743:	70 00                	jo     2745 <syscall_id_to_name+0x2705>
	...
    275d:	00 00                	add    %al,(%rax)
    275f:	00 66 69             	add    %ah,0x69(%rsi)
    2762:	6e                   	outsb  %ds:(%rsi),(%dx)
    2763:	69 74 5f 6d 6f 64 75 	imul   $0x6c75646f,0x6d(%rdi,%rbx,2),%esi
    276a:	6c 
    276b:	65 00 00             	add    %al,%gs:(%rax)
	...
    277e:	00 00                	add    %al,(%rax)
    2780:	73 63                	jae    27e5 <syscall_id_to_name+0x27a5>
    2782:	68 65 64 5f 73       	pushq  $0x735f6465
    2787:	65 74 61             	gs je  27eb <syscall_id_to_name+0x27ab>
    278a:	74 74                	je     2800 <syscall_id_to_name+0x27c0>
    278c:	72 00                	jb     278e <syscall_id_to_name+0x274e>
	...
    279e:	00 00                	add    %al,(%rax)
    27a0:	73 63                	jae    2805 <syscall_id_to_name+0x27c5>
    27a2:	68 65 64 5f 67       	pushq  $0x675f6465
    27a7:	65 74 61             	gs je  280b <syscall_id_to_name+0x27cb>
    27aa:	74 74                	je     2820 <syscall_id_to_name+0x27e0>
    27ac:	72 00                	jb     27ae <syscall_id_to_name+0x276e>
	...
    27be:	00 00                	add    %al,(%rax)
    27c0:	72 65                	jb     2827 <syscall_id_to_name+0x27e7>
    27c2:	6e                   	outsb  %ds:(%rsi),(%dx)
    27c3:	61                   	(bad)  
    27c4:	6d                   	insl   (%dx),%es:(%rdi)
    27c5:	65 61                	gs (bad) 
    27c7:	74 32                	je     27fb <syscall_id_to_name+0x27bb>
	...
    27dd:	00 00                	add    %al,(%rax)
    27df:	00 73 65             	add    %dh,0x65(%rbx)
    27e2:	63 63 6f             	movslq 0x6f(%rbx),%esp
    27e5:	6d                   	insl   (%dx),%es:(%rdi)
    27e6:	70 00                	jo     27e8 <syscall_id_to_name+0x27a8>
	...
    2800:	67 65 74 72          	addr32 gs je 2876 <syscall_id_to_name+0x2836>
    2804:	61                   	(bad)  
    2805:	6e                   	outsb  %ds:(%rsi),(%dx)
    2806:	64 6f                	outsl  %fs:(%rsi),(%dx)
    2808:	6d                   	insl   (%dx),%es:(%rdi)
	...
    281d:	00 00                	add    %al,(%rax)
    281f:	00 6d 65             	add    %ch,0x65(%rbp)
    2822:	6d                   	insl   (%dx),%es:(%rdi)
    2823:	66 64 5f             	fs pop %di
    2826:	63 72 65             	movslq 0x65(%rdx),%esi
    2829:	61                   	(bad)  
    282a:	74 65                	je     2891 <syscall_id_to_name+0x2851>
	...
    2840:	6b 65 78 65          	imul   $0x65,0x78(%rbp),%esp
    2844:	63 5f 66             	movslq 0x66(%rdi),%ebx
    2847:	69 6c 65 5f 6c 6f 61 	imul   $0x64616f6c,0x5f(%rbp,%riz,2),%ebp
    284e:	64 
	...
    285f:	00 62 70             	add    %ah,0x70(%rdx)
    2862:	66 00 00             	data16 add %al,(%rax)
	...
    287d:	00 00                	add    %al,(%rax)
    287f:	00 65 78             	add    %ah,0x78(%rbp)
    2882:	65 63 76 65          	movslq %gs:0x65(%rsi),%esi
    2886:	61                   	(bad)  
    2887:	74 00                	je     2889 <syscall_id_to_name+0x2849>
	...
    289d:	00 00                	add    %al,(%rax)
    289f:	00 75 73             	add    %dh,0x73(%rbp)
    28a2:	65 72 66             	gs jb  290b <syscall_id_to_name+0x28cb>
    28a5:	61                   	(bad)  
    28a6:	75 6c                	jne    2914 <syscall_id_to_name+0x28d4>
    28a8:	74 66                	je     2910 <syscall_id_to_name+0x28d0>
    28aa:	64 00 00             	add    %al,%fs:(%rax)
	...
    28bd:	00 00                	add    %al,(%rax)
    28bf:	00 6d 65             	add    %ch,0x65(%rbp)
    28c2:	6d                   	insl   (%dx),%es:(%rdi)
    28c3:	62 61                	(bad)  
    28c5:	72 72                	jb     2939 <syscall_id_to_name+0x28f9>
    28c7:	69 65 72 00 00 00 00 	imul   $0x0,0x72(%rbp),%esp
	...
    28de:	00 00                	add    %al,(%rax)
    28e0:	6d                   	insl   (%dx),%es:(%rdi)
    28e1:	6c                   	insb   (%dx),%es:(%rdi)
    28e2:	6f                   	outsl  %ds:(%rsi),(%dx)
    28e3:	63 6b 32             	movslq 0x32(%rbx),%ebp
	...
    28fe:	00 00                	add    %al,(%rax)
    2900:	63 6f 70             	movslq 0x70(%rdi),%ebp
    2903:	79 5f                	jns    2964 <syscall_id_to_name+0x2924>
    2905:	66 69 6c 65 5f 72 61 	imul   $0x6172,0x5f(%rbp,%riz,2),%bp
    290c:	6e                   	outsb  %ds:(%rsi),(%dx)
    290d:	67 65 00 00          	add    %al,%gs:(%eax)
	...
    291d:	00 00                	add    %al,(%rax)
    291f:	00 70 72             	add    %dh,0x72(%rax)
    2922:	65 61                	gs (bad) 
    2924:	64 76 32             	fs jbe 2959 <syscall_id_to_name+0x2919>
	...
    293f:	00 70 77             	add    %dh,0x77(%rax)
    2942:	72 69                	jb     29ad <syscall_id_to_name+0x296d>
    2944:	74 65                	je     29ab <syscall_id_to_name+0x296b>
    2946:	76 32                	jbe    297a <syscall_id_to_name+0x293a>
	...
    2960:	70 6b                	jo     29cd <syscall_id_to_name+0x298d>
    2962:	65 79 5f             	gs jns 29c4 <syscall_id_to_name+0x2984>
    2965:	6d                   	insl   (%dx),%es:(%rdi)
    2966:	70 72                	jo     29da <syscall_id_to_name+0x299a>
    2968:	6f                   	outsl  %ds:(%rsi),(%dx)
    2969:	74 65                	je     29d0 <syscall_id_to_name+0x2990>
    296b:	63 74 00 00          	movslq 0x0(%rax,%rax,1),%esi
	...
    297f:	00 70 6b             	add    %dh,0x6b(%rax)
    2982:	65 79 5f             	gs jns 29e4 <proc_name+0x4>
    2985:	61                   	(bad)  
    2986:	6c                   	insb   (%dx),%es:(%rdi)
    2987:	6c                   	insb   (%dx),%es:(%rdi)
    2988:	6f                   	outsl  %ds:(%rsi),(%dx)
    2989:	63 00                	movslq (%rax),%eax
	...
    299f:	00 70 6b             	add    %dh,0x6b(%rax)
    29a2:	65 79 5f             	gs jns 2a04 <proc_name+0x24>
    29a5:	66 72 65             	data16 jb 2a0d <proc_name+0x2d>
    29a8:	65 00 00             	add    %al,%gs:(%rax)
	...
    29bf:	00 73 74             	add    %dh,0x74(%rbx)
    29c2:	61                   	(bad)  
    29c3:	74 78                	je     2a3d <proc_name+0x5d>
	...

00000000000029e0 <proc_name>:
	...

Disassembly of section .gnu.linkonce.this_module:

0000000000000000 <__this_module>:
	...
  18:	6d                   	insl   (%dx),%es:(%rdi)
  19:	79 5f                	jns    7a <__this_module+0x7a>
  1b:	73 79                	jae    96 <__this_module+0x96>
  1d:	73 64                	jae    83 <__this_module+0x83>
  1f:	69 67 00 00 00 00 00 	imul   $0x0,0x0(%rdi),%esp
	...

Disassembly of section .bss:

0000000000000000 <proc_arg0_hash_table>:
	...

00000000000070e8 <syscall_count>:
	...

00000000000070f0 <buf_offset>:
	...

00000000000070f8 <small_buf_lock>:
	...

0000000000007100 <real_buffer>:
	...

0000000000807100 <file_write_mutex>:
	...

0000000000807120 <real_offset>:
	...

0000000000807128 <__file_to_record>:
	...

0000000000807130 <pid>:
  807130:	00 00                	add    %al,(%rax)
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	00 47 43             	add    %al,0x43(%rdi)
   3:	43 3a 20             	rex.XB cmp (%r8),%spl
   6:	28 55 62             	sub    %dl,0x62(%rbp)
   9:	75 6e                	jne    79 <__UNIQUE_ID_proc_nametype89+0xa>
   b:	74 75                	je     82 <__UNIQUE_ID_proc_nametype89+0x13>
   d:	20 37                	and    %dh,(%rdi)
   f:	2e 35 2e 30 2d 33    	cs xor $0x332d302e,%eax
  15:	75 62                	jne    79 <__UNIQUE_ID_proc_nametype89+0xa>
  17:	75 6e                	jne    87 <__UNIQUE_ID_proc_nametype89+0x18>
  19:	74 75                	je     90 <bitset_get>
  1b:	31 7e 31             	xor    %edi,0x31(%rsi)
  1e:	38 2e                	cmp    %ch,(%rsi)
  20:	30 34 29             	xor    %dh,(%rcx,%rbp,1)
  23:	20 37                	and    %dh,(%rdi)
  25:	2e 35 2e 30 00 00    	cs xor $0x302e,%eax
  2b:	47                   	rex.RXB
  2c:	43                   	rex.XB
  2d:	43 3a 20             	rex.XB cmp (%r8),%spl
  30:	28 55 62             	sub    %dl,0x62(%rbp)
  33:	75 6e                	jne    a3 <__UNIQUE_ID_srcversion30+0x3>
  35:	74 75                	je     ac <__UNIQUE_ID_srcversion30+0xc>
  37:	20 37                	and    %dh,(%rdi)
  39:	2e 35 2e 30 2d 33    	cs xor $0x332d302e,%eax
  3f:	75 62                	jne    a3 <__UNIQUE_ID_srcversion30+0x3>
  41:	75 6e                	jne    b1 <__UNIQUE_ID_srcversion30+0x11>
  43:	74 75                	je     ba <__UNIQUE_ID_srcversion30+0x1a>
  45:	31 7e 31             	xor    %edi,0x31(%rsi)
  48:	38 2e                	cmp    %ch,(%rsi)
  4a:	30 34 29             	xor    %dh,(%rcx,%rbp,1)
  4d:	20 37                	and    %dh,(%rdi)
  4f:	2e                   	cs
  50:	35                   	.byte 0x35
  51:	2e 30 00             	xor    %al,%cs:(%rax)
