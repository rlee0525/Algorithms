// reverse a singly linked list

class ListNode {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

// iterative
// const reverseList = head => {
//   if (!head) return [];

//   let prev = null;

//   while (head) {
//     let current = head;
//     head = head.next;
//     current.next = prev;
//     prev = current;
//   }

//   return prev;
// };

// recursive
const reverseList = head => {
  return _reverseList(head);
};

const _reverseList = (head, prev = null) => {
  if (!head) return prev;

  let current = head;
  head = head.next;
  current.next = prev;
  prev = current;
  return _reverseList(head, prev);
};

let node1 = new ListNode(1);
let node2 = new ListNode(2);
node1.next = node2;

console.log(reverseList(node1, node2));