Есть 2 синхронизированных потока, имеющих общий доступ к File.

Первый поток – генерирует в буфер 30 случайных чисел из интервала от  –1 до 1. 
Второй поток – извлекает числа из буфера, начиная с первого, и возводит их в квадрат. Результат выводится на экран.
