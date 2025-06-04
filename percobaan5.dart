class Node<T> {
  T key;
  Node<T>? left, right;
  Node(this.key);
}

class BinaryTree<T> {
  Node<T>? root;

  int maxDepth(Node<T>? node) {
    if (node == null) return 0;
    int lDepth = maxDepth(node.left);
    int rDepth = maxDepth(node.right);
    return (lDepth > rDepth ? lDepth : rDepth) + 1;
  }
}

void main() {
  var t = BinaryTree<int>();
  t.root = Node(10);
  t.root!.left = Node(20);
  t.root!.right = Node(30);
  t.root!.right!.left = Node(4);

  print("Height of Binary Tree: ${t.maxDepth(t.root)}");
}
