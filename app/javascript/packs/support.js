export default function params() {
  return Object.fromEntries(new URLSearchParams(location.search))
}
