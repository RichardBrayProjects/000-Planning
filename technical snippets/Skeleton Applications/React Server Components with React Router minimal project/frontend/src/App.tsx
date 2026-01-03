import { Routes, Route } from 'react-router';
import HomePage from './HomePage';

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<HomePage />} />
    </Routes>
  );
}
