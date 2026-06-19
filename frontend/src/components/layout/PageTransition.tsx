"use client";

import { motion } from "framer-motion";
import { usePathname } from "next/navigation";
import type { ReactNode } from "react";

const variants = {
  hidden: { opacity: 0, y: 4, filter: "blur(6px)" },
  enter: { opacity: 1, y: 0, filter: "blur(0px)" },
};

export function PageTransition({ children }: { readonly children: ReactNode }) {
  const pathname = usePathname();

  return (
    <motion.div
      key={pathname}
      variants={variants}
      initial="hidden"
      animate="enter"
      transition={{ duration: 0.55, ease: [0.22, 1, 0.36, 1] }}
    >
      {children}
    </motion.div>
  );
}
