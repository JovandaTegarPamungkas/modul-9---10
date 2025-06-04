class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  void _postOrderDisplay(Node<T>? node) {
    if (node != null) {
      _postOrderDisplay(node.left);
      _postOrderDisplay(node.right);
      print('${node.key}');
    }
  }

  void printPostorderFromRoot() {
    _postOrderDisplay(root);
  }
}

void main() {
  var t = BinaryTree<int>();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("Post Order traversal of binary tree is:");
  t.printPostorderFromRoot();
}
