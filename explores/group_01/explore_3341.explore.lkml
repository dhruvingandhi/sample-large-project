# Explore: explore_3341
# Auto-generated LookML Explore File

include: "/views/domain_24/view_10024.view.lkml"
include: "/views/domain_26/view_10026.view.lkml"
include: "/views/domain_27/view_10027.view.lkml"
include: "/views/domain_28/view_10028.view.lkml"

explore: explore_3341 {
  label: "Explore Explore 3341"
  description: "Comprehensive analytics explore joining base view_10024 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10024
  
  always_filter: {
    filters: [view_10024.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10024.created_at_date: "7 days"]
    unless: [view_10024.id, view_10024.status]
  }

  join: view_10026 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10024.user_id} = ${view_10026.id} ;;
    required_joins: []
  }

  join: view_10027 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10024.account_id} = ${view_10027.account_id} ;;
    required_joins: [view_10026]
  }

  join: view_10028 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10024.category} = ${view_10028.category} ;;
  }

  access_filter: {
    field: view_10024.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10024.is_deleted} = false ;;
}
