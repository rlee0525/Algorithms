const invertTree = root => {
  if (!root) return null;

  let temp = root.right;
  root.right = invertTree(root.left);
  root.left = invertTree(temp);

  return root;
};