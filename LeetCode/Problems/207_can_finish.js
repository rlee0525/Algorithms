const canFinish = (numCourses, prerequisites) => {
  let inEdgesCount = {};
  let outEdges = {};

  for (let i = 0; i < prerequisites.length; i++) {
    let pair = prerequisites[i];

    if (!inEdgesCount[pair[0]]) {
      inEdgesCount[pair[0]] = 0;
    }

    if (!inEdgesCount[pair[1]]) {
      inEdgesCount[pair[1]] = 1;
    } else {
      inEdgesCount[pair[1]]++;
    }

    if (!outEdges[pair[0]]) {
      outEdges[pair[0]] = [pair[1]];
    } else {
      outEdges[pair[0]].push(pair[1]);
    }
  }

  let queue = [];
  let coursesTaken = {};
  let vertex;

  for (vertex in inEdgesCount) {
    if (inEdgesCount[vertex] === 0) queue.push(vertex);
  }

  while (queue.length !== 0) {
    let current = queue.shift();
    numCourses--;

    let edges = outEdges[current];

    if (edges) {
      for (let i = 0; i < edges.length; i++) {
        let edge = edges[i];
        inEdgesCount[edge]--;

        if (inEdgesCount[edge] === 0) queue.push(edge);
      }
    }
  }

  for (vertex in inEdgesCount) {
    if (inEdgesCount[vertex] !== 0) return false;
  }

  return true;
};

console.log(canFinish(2, [[1,0], [0,1]]));





