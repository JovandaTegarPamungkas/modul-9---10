class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  void _preOrderDisplay(Node<T>? node) {
    if (node != null) {
      print('${node.key}');
      _preOrderDisplay(node.left);
      _preOrderDisplay(node.right);
    }
  }

  void printPreorderFromRoot() {
    _preOrderDisplay(root);
  }
}

void main() {
  var t = BinaryTree<int>();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("Pre Order traversal of binary tree is:");
  t.printPreorderFromRoot();
}
