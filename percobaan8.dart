import 'dart:collection';

class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  // Percobaan 2 & 7
  void _inOrderDisplay(Node<T>? node) {
    if (node != null) {
      _inOrderDisplay(node.left);
      print('${node.key}');
      _inOrderDisplay(node.right);
    }
  }

  void printInOrderFromRoot() {
    _inOrderDisplay(root);
  }

  // Percobaan 5
  int maxDepth(Node<T>? node) {
    if (node == null) return 0;
    int lDepth = maxDepth(node.left);
    int rDepth = maxDepth(node.right);
    return (lDepth > rDepth ? lDepth : rDepth) + 1;
  }

  // Percobaan 7
  void deleteDeepest(Node<T> root, Node<T> delNode) {
    Queue<Node<T>> q = Queue();
    q.add(root);
    Node<T>? temp;

    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp == delNode) {
        temp = null;
        return;
      }
      if (temp.right != null) {
        if (temp.right == delNode) {
          temp.right = null;
          return;
        } else {
          q.add(temp.right!);
        }
      }
      if (temp.left != null) {
        if (temp.left == delNode) {
          temp.left = null;
          return;
        } else {
          q.add(temp.left!);
        }
      }
    }
  }

  void delete(Node<T>? root, T key) {
    if (root == null) return;

    if (root.left == null && root.right == null) {
      if (root.key == key) {
        this.root = null;
      }
      return;
    }

    Queue<Node<T>> q = Queue();
    q.add(root);
    Node<T>? temp;
    Node<T>? keyNode;

    while (q.isNotEmpty) {
      temp = q.removeFirst();
      if (temp.key == key) keyNode = temp;
      if (temp.left != null) q.add(temp.left!);
      if (temp.right != null) q.add(temp.right!);
    }

    if (keyNode != null && temp != null) {
      T x = temp.key;
      deleteDeepest(root, temp);
      keyNode.key = x;
    }
  }

  // Percobaan 8
  void printCurrentLevel(Node<T>? node, int level) {
    if (node == null) return;
    if (level == 0) {
      print('${node.key}');
    } else {
      printCurrentLevel(node.left, level - 1);
      printCurrentLevel(node.right, level - 1);
    }
  }
}

void main() {
  BinaryTree<int> t = BinaryTree();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("In Order traversal of binary tree is: ");
  t.printInOrderFromRoot();

  print("Height of Binary Tree: ${t.maxDepth(t.root)}");

  t.delete(t.root, 19); // Tidak ada node 19

  print("In Order traversal of binary tree is: ");
  t.printInOrderFromRoot();

  print("Nilai pada Level Tertentu pada Binary Tree: ");
  t.printCurrentLevel(t.root, 1); // Menampilkan node level 1 (anak dari root)
}
