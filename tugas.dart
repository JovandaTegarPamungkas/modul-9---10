class TNode {
  int data;
  TNode? left;
  TNode? right;

  TNode(this.data, {this.left, this.right});
}

TNode? copyTree(TNode? t) {
  if (t == null) return null;

  TNode newNode = TNode(t.data);
  newNode.left = copyTree(t.left);
  newNode.right = copyTree(t.right);

  return newNode;
}

// Fungsi bantu untuk print inorder traversal
void inorderTraversal(TNode? root) {
  if (root == null) return;
  inorderTraversal(root.left);
  print(root.data);
  inorderTraversal(root.right);
}

void main() {
  // Membuat tree contoh
  TNode root = TNode(1,
      left: TNode(2, left: TNode(4), right: TNode(5)),
      right: TNode(3));

  print('Inorder tree asli:');
  inorderTraversal(root);

  // Salin tree
  TNode? copiedRoot = copyTree(root);

  print('Inorder tree hasil copy:');
  inorderTraversal(copiedRoot);
}
