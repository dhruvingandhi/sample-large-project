# Explore: explore_0693
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02080.view.lkml"
include: "/views/domain_32/view_02082.view.lkml"
include: "/views/domain_33/view_02083.view.lkml"
include: "/views/domain_34/view_02084.view.lkml"

explore: explore_0693 {
  label: "Explore Explore 0693"
  description: "Comprehensive analytics explore joining base view_02080 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02080
  
  always_filter: {
    filters: [view_02080.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02080.created_at_date: "7 days"]
    unless: [view_02080.id, view_02080.status]
  }

  join: view_02082 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02080.user_id} = ${view_02082.id} ;;
    required_joins: []
  }

  join: view_02083 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02080.account_id} = ${view_02083.account_id} ;;
    required_joins: [view_02082]
  }

  join: view_02084 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02080.category} = ${view_02084.category} ;;
  }

  access_filter: {
    field: view_02080.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02080.is_deleted} = false ;;
}
