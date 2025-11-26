# Day 1 Notes – SQL Basics (Devil)

This is your **quick mental model** for Day 1.  
If you can’t explain these points, you didn’t really learn today.

---

## 1. Tables & Relationships

We used:

- `customers` (one row per customer)
- `orders` (one row per order)
- `payments` (one row per payment)

Basic relationships:

- One **customer** → many **orders**
- One **order** → zero or one **payment** (in this toy data, we give one payment per paid order)

If you don’t understand these relationships, your joins will be trash.

---

## 2. Joins (Non-Negotiable Skill)

Most analytics queries need joins.

Pattern you must burn into your brain:

```sql
FROM tableA a
JOIN tableB b ON a.key = b.key
