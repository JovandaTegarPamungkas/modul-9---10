class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  void printLevelOrder() {
    int h = height(root);
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }

  int height(Node<T>? node) {
    if (node == null) return 0;
    int l = height(node.left);
    int r = height(node.right);
    return (l > r ? l : r) + 1;
  }

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
  var t = BinaryTree<int>();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("Level Order traversal of binary tree is:");
  t.printLevelOrder();
}
