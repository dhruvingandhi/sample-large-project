# Explore: explore_0177
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00532.view.lkml"
include: "/views/domain_34/view_00534.view.lkml"
include: "/views/domain_35/view_00535.view.lkml"
include: "/views/domain_36/view_00536.view.lkml"

explore: explore_0177 {
  label: "Explore Explore 0177"
  description: "Comprehensive analytics explore joining base view_00532 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_00532
  
  always_filter: {
    filters: [view_00532.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00532.created_at_date: "7 days"]
    unless: [view_00532.id, view_00532.status]
  }

  join: view_00534 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00532.user_id} = ${view_00534.id} ;;
    required_joins: []
  }

  join: view_00535 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00532.account_id} = ${view_00535.account_id} ;;
    required_joins: [view_00534]
  }

  join: view_00536 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00532.category} = ${view_00536.category} ;;
  }

  access_filter: {
    field: view_00532.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00532.is_deleted} = false ;;
}
