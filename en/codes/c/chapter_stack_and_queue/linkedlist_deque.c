/**
 * File: linkedlist_deque.c
 * Created Time: 2023-03-13
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Double-linked list node */
typedef struct DoublyListNode {
    int val;                     // Node value
    struct DoublyListNode *next; // Successor node
    struct DoublyListNode *prev; // Predecessor node
} DoublyListNode;

/* Constructor */
DoublyListNode *newDoublyListNode(int num) {
    DoublyListNode *new = (DoublyListNode *)malloc(sizeof(DoublyListNode));
    new->val = num;
    new->next = NULL;
    new->prev = NULL;
    return new;
}

/* Destructor */
void delDoublyListNode(DoublyListNode *node) {
    free(node);
}

/* Double-ended queue class based on double-linked list */
typedef struct {
    DoublyListNode *front, *rear; // Front node front, back node rear
    int queSize;                  // Length of the double-ended queue
} LinkedListDeque;

/* Constructor */
LinkedListDeque *newLinkedListDeque() {
    LinkedListDeque *deque = (LinkedListDeque *)malloc(sizeof(LinkedListDeque));
    deque->front = NULL;
    deque->rear = NULL;
    deque->queSize = 0;
    return deque;
}

/* Destructor */
void delLinkedListdeque(LinkedListDeque *deque) {
    // Free all nodes
    for (int i = 0; i < deque->queSize && deque->front != NULL; i++) {
        DoublyListNode *tmp = deque->front;
        deque->front = deque->front->next;
        free(tmp);
    }
    // Free deque structure
    free(deque);
}

/* Get the length of the queue */
int size(LinkedListDeque *deque) {
    return deque->queSize;
}

/* Determine if the queue is empty */
bool empty(LinkedListDeque *deque) {
    return (size(deque) == 0);
}

/* Enqueue */
void push(LinkedListDeque *deque, int num, bool isFront) {
    DoublyListNode *node = newDoublyListNode(num);
    // If the linked list is empty, let both front and rear point to node
    if (empty(deque)) {
        deque->front = deque->rear = node;
    }
    // Front enqueue operation
    else if (isFront) {
        // Add node to the head of the list
        deque->front->prev = node;
        node->next = deque->front;
        deque->front = node; // Update head node
    }
    // Rear enqueue operation
    else {
        // Add node to the tail of the list
        deque->rear->next = node;
        node->prev = deque->rear;
        deque->rear = node;
    }
    deque->queSize++; // Update queue length
}

/* Front enqueue */
void pushFirst(LinkedListDeque *deque, int num) {
    push(deque, num, true);
}

/* Rear enqueue */
void pushLast(LinkedListDeque *deque, int num) {
    push(deque, num, false);
}

/* Access front element */
int peekFirst(LinkedListDeque *deque) {
    assert(size(deque) && deque->front);
    return deque->front->val;
}

/* Access rear element */
int peekLast(LinkedListDeque *deque) {
    assert(size(deque) && deque->rear);
    return deque->rear->val;
}

/* Dequeue */
int pop(LinkedListDeque *deque, bool isFront) {
    if (empty(deque))
        return -1;
    int val;
    // Front dequeue operation
    if (isFront) {
        val = peekFirst(deque); // Temporarily store the head node value
        DoublyListNode *fNext = deque->front->next;
        if (fNext) {
            fNext->prev = NULL;
            deque->front->next = NULL;
        }
        delDoublyListNode(deque->front);
        deque->front = fNext; // Update head node
    }
    // Rear dequeue operation
    else {
        val = peekLast(deque); // Temporarily store the tail node value
        DoublyListNode *rPrev = deque->rear->prev;
        if (rPrev) {
            rPrev->next = NULL;
            deque->rear->prev = NULL;
        }
        delDoublyListNode(deque->rear);
        deque->rear = rPrev; // Update tail node
    }
    deque->queSize--; // Update queue length
    return val;
}

/* Front dequeue */
int popFirst(LinkedListDeque *deque) {
    return pop(deque, true);
}

/* Rear dequeue */
int popLast(LinkedListDeque *deque) {
    return pop(deque, false);
}

/* Print queue */
void printLinkedListDeque(LinkedListDeque *deque) {
    int *arr = malloc(sizeof(int) * deque->queSize);
    // Copy data from linked list to array
    int i;
    DoublyListNode *node;
    for (i = 0, node = deque->front; i < deque->queSize; i++) {
        arr[i] = node->val;
        node = node->next;
    }
    printArray(arr, deque->queSize);
    free(arr);
}

/* Driver Code */
int main() {
    /* Initialize double-ended queue */
    LinkedListDeque *deque = newLinkedListDeque();
    pushLast(deque, 3);
    pushLast(deque, 2);
    pushLast(deque, 5);
    printf("Double-ended queue deque =");
    printLinkedListDeque(deque);

    /* Access element */
    int peekFirstNum = peekFirst(deque);
    printf("Front element peekFirst = %d\r\n", peekFirstNum);
    int peekLastNum = peekLast(deque);
    printf("Back element peekLast = %d\r\n", peekLastNum);

    /* Element enqueue */
    pushLast(deque, 4);
    printf("Element 4 rear enqueued, deque =");
    printLinkedListDeque(deque);
    pushFirst(deque, 1);
    printf("Element 1 front enqueued, deque =");
    printLinkedListDeque(deque);

    /* Element dequeue */
    int popLastNum = popLast(deque);
    printf("Back dequeue element popLast = %d, deque after back dequeue = ", popLastNum);
    printLinkedListDeque(deque);
    int popFirstNum = popFirst(deque);
    printf("Front dequeue element popFirst = %d, deque after front dequeue = ", popFirstNum);
    printLinkedListDeque(deque);

    /* Get the length of the queue */
    int dequeSize = size(deque);
    printf("Double-ended queue length size = %d\r\n", dequeSize);

    /* Determine if the queue is empty */
    bool isEmpty = empty(deque);
    printf("Is the queue empty = %s\r\n", isEmpty ? "true" : "false");

    // Free memory
    delLinkedListdeque(deque);

    return 0;
}
