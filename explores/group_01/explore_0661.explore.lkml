# Explore: explore_0661
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01984.view.lkml"
include: "/views/domain_36/view_01986.view.lkml"
include: "/views/domain_37/view_01987.view.lkml"
include: "/views/domain_38/view_01988.view.lkml"

explore: explore_0661 {
  label: "Explore Explore 0661"
  description: "Comprehensive analytics explore joining base view_01984 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01984
  
  always_filter: {
    filters: [view_01984.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01984.created_at_date: "7 days"]
    unless: [view_01984.id, view_01984.status]
  }

  join: view_01986 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01984.user_id} = ${view_01986.id} ;;
    required_joins: []
  }

  join: view_01987 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01984.account_id} = ${view_01987.account_id} ;;
    required_joins: [view_01986]
  }

  join: view_01988 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01984.category} = ${view_01988.category} ;;
  }

  access_filter: {
    field: view_01984.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01984.is_deleted} = false ;;
}
