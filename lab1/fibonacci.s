	.file	"fibonacci.c" # Название файла
	.text                 # Начало области команд
	.section	.rodata   # Незименяемые данные
.LC0:                     # Локальная метка
	.string	"%d\n"
	.text
	.globl	fibonacci
	.type	fibonacci, @function
fibonacci:                # Глобальная метка
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16   # Информация для отладчика
	movq	%rsp, %rbp   # 32-битовый регистр
	.cfi_def_cfa_register 6
	subq	$16, %rsp    # Добавление в стек
	movl	$0, -12(%rbp)# Помещает значение в локальную переменную
	movl	$1, -8(%rbp)
	movl	$0, -16(%rbp)# Счётчик цикла i
	jmp	.L2          # Переход к локальной метке .L2
.L5:                     # Тело цикла
	cmpl	$1, -16(%rbp)# Сравнивает значение в регистре с 1
	jg	.L3              # Переход, если  i  < 1
	movl	-16(%rbp), %eax# Иначе манипаляции с данными в регистрах
	movl	%eax, -4(%rbp)
	jmp	.L4
.L3:
	movl	-12(%rbp), %edx # Для работы операторов в else
	movl	-8(%rbp), %eax
	addl	%edx, %eax      # Увеличение значения вдвое
	movl	%eax, -4(%rbp)
	movl	-8(%rbp), %eax  # Операции с переменными внутри блока else
	movl	%eax, -12(%rbp)
	movl	-4(%rbp), %eax
	movl	%eax, -8(%rbp)
.L4:
	movl	-4(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi # Эффективный адрес (?)
	movl	$0, %eax
	call	printf@PLT       # Вызов функции потока вывода
	addl	$1, -16(%rbp)
.L2:
	cmpl	$29, -16(%rbp)   # Проверка, выполняется ли выходное условие
	jle	.L5              # Если рано завершать цикл, то новая итерация
	nop
	nop
	leave                    # Выход из цикла
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:                       # Информация о  компляторе
	.size	fibonacci, .-fibonacci
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
