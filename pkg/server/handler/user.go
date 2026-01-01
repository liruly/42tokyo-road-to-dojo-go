package handler

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
	"github.com/google/uuid"
)

// HandleUserCreate ユーザ作成処理
func HandleUserCreate() http.HandlerFunc {
	return func(writer http.ResponseWriter, request *http.Request) {
		var req userCreateRequest
		if err := json.NewDecoder(request.Body).Decode(&req); err != nil {
			writer.WriteHeader(http.StatusBadRequest)
			return
		}

		userName := req.Name

		userID := uuid.New().String()
		token := uuid.New().String()

		// TODO: DBにユーザ情報を保存する

		response := userCreateResponse{
			Token: token,
		}

		data, err := json.Marshal(response)
		if err != nil {
			writer.WriteHeader(http.StatusInternalServerError)
			return
		}
		writer.Write(data)
	}
}

type userCreateRequest struct {
	Name string `json:"name"`
}

type userCreateResponse struct {
	Token string `json:"token"`
}
