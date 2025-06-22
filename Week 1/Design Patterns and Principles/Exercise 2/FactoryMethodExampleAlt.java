public class FactoryMethodExampleAlt {

    interface Document {
        void open();
    }

    static class WordDocument implements Document {
        public void open() {
            System.out.println("Opening a Word Document.");
        }
    }

    static class PdfDocument implements Document {
        public void open() {
            System.out.println("Opening a PDF Document.");
        }
    }

    static class ExcelDocument implements Document {
        public void open() {
            System.out.println("Opening an Excel Document.");
        }
    }


    static class DocumentFactory {
        public static Document createDocument(String type) {
            switch (type.toLowerCase()) {
                case "word":
                    return new WordDocument();
                case "pdf":
                    return new PdfDocument();
                case "excel":
                    return new ExcelDocument();
                default:
                    throw new IllegalArgumentException("Unsupported document type: " + type);
            }
        }
    }
]    public static void main(String[] args) {
]
        Document doc1 = DocumentFactory.createDocument("word");
        doc1.open();

        Document doc2 = DocumentFactory.createDocument("pdf");
        doc2.open();

        Document doc3 = DocumentFactory.createDocument("excel");
        doc3.open();
    }
}
