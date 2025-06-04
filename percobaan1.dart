class Node<T> {
  T data;
  Node<T>? left;
  Node<T>? right;

  Node(this.data);
}

class BinaryTree<T> {
  Node<T>? root;

  BinaryTree();
}

void main() {
  BinaryTree<int> t = BinaryTree<int>();
  t.root = Node<int>(10);
  t.root!.left = Node<int>(20);
  t.root!.right = Node<int>(30);
  t.root!.right!.left = Node<int>(4);

  print("Root: ${t.root!.data}");
  print("Left child: ${t.root!.left!.data}");
  print("Right child: ${t.root!.right!.data}");
  print("Right-Left grandchild: ${t.root!.right!.left!.data}");
}
