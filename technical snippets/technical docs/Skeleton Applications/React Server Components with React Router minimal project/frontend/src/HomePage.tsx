// This is a React Server Component (no 'use client')
// It runs on the server and can fetch data directly

async function getData() {
  const res = await fetch('http://localhost:3001/api/data');
  return res.json();
}

export default async function HomePage() {
  const data = await getData();
  
  return (
    <div>
      <h1>React Server Component</h1>
      <p>Message from Lambda: {data.message}</p>
      <p>This component ran on the SERVER and fetched data from AWS Lambda!</p>
    </div>
  );
}
