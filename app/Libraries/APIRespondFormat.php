<?php
    namespace App\Libraries;

    class APIRespondFormat{
        private array $respond;

        public function __construct(bool $status, ?string $message, ?array $data = null){
            $returnedData   =   [
                'status'    =>  $status,
                'message'   =>  $message,
                'data'      =>  $data
            ];
            
            $this->respond  =   $returnedData;
        }
        public function getRespond(): array{
            $respond    =   $this->respond;
            return $respond;
        }
    }
?>