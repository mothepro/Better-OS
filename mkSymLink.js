import { promises as fsPromises } from 'fs'
import { join, basename } from 'path'

const [
  nodeDir,
  cwd,
  binaryDir,
  target,
] = process.argv


fsPromises.symlink(target, join(binaryDir, basename(target)))
