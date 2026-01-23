``` bash
npm install i18next react-i18next
```

`src/i18n/index.ts`
``` ts
export { LanguageProvider, useLanguage } from './LanguageContext';
export type { Language, Translations } from './translations';
export { default as translations } from './translations';
```
`src/i18n/LanguageContext.tsx`
``` ts
import { createContext, useContext, useState, type ReactNode } from 'react';
import translations, { type Language, type Translations } from './translations';

interface LanguageContextType {
  language: Language;
  setLanguage: (lang: Language) => void;
  t: Translations;
}

const LanguageContext = createContext<LanguageContextType | undefined>(undefined);

export function LanguageProvider({ children }: { children: ReactNode }) {
  const [language, setLanguage] = useState<Language>('ka');

  const value: LanguageContextType = {
    language,
    setLanguage,
    t: translations[language],
  };

  return (
    <LanguageContext.Provider value={value}>
      {children}
    </LanguageContext.Provider>
  );
}

export function useLanguage() {
  const context = useContext(LanguageContext);
  if (context === undefined) {
    throw new Error('useLanguage must be used within a LanguageProvider');
  }
  return context;
}
```
`src/i18n/translations.ts
``` js
export type Language = 'ka' | 'en' | 'ru';

export interface Translations {
  nav: {
    home: string;
    about: string;
  };
  header: {
    physical: string;
    legal: string;
    mandatory: string;
  };
}

const translations: Record<Language, Translations> = {
  ka: {
    nav: {
      home: 'მთავარი',
      about: 'ჩვენ შესახებ',
    },
    header: {
      physical: 'ფიზიკური პირებისთვის',
      legal: 'იურიდიული პირებისთვის',
      mandatory: 'სავალდებულო დაზღვევა',
    },
  },
  en: {
    nav: {
      home: 'Home',
      about: 'About Us',
    },
    header: {
      physical: 'For Individuals',
      legal: 'For Legal Entities',
      mandatory: 'Mandatory Insurance',
    },
  },
  ru: {
    nav: {
      home: 'Главная',
      about: 'О нас',
    },
    header: {
      physical: 'для физических лиц',
      legal: 'для юридических лиц',
      mandatory: 'Обязательное страхование',
    },
  },
};

export default translations;
```
`App.tsx`
``` ts
import { LanguageProvider } from './i18n'

function App() {
  return (
    <LanguageProvider>
        <!-- Rest of the code -->
    </LanguageProvider>
  )
}
```
`Component.tsx`
``` ts
import { useLanguage } from "../i18n";

export default function Title() {
  const { t } = useLanguage();
  return (
    <div>
      {t.header.legal}
    </div>
  )
}
```
