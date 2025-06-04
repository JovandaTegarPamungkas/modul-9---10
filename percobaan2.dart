class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

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
}

void main() {
  var t = BinaryTree<int>();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("In Order traversal of binary tree is:");
  t.printInOrderFromRoot();
}
