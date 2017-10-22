// Some people are standing in a row in a park. There are trees between them which
//  cannot be moved. Your task is to rearrange the people by their heights in a
//  non-descending order without moving the trees.



function sortByHeight(a) {
  const noTrees = a.filter(x => x != -1);
  noTrees.sort((p, q) => p - q);

  for(let i = 0; i < a.length; i ++){
    if (a[i] != -1) a[i] = noTrees.shift();
  }
  return a;
}
