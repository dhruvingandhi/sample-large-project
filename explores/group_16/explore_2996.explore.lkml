# Explore: explore_2996
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08989.view.lkml"
include: "/views/domain_41/view_08991.view.lkml"
include: "/views/domain_42/view_08992.view.lkml"
include: "/views/domain_43/view_08993.view.lkml"

explore: explore_2996 {
  label: "Explore Explore 2996"
  description: "Comprehensive analytics explore joining base view_08989 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08989
  
  always_filter: {
    filters: [view_08989.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08989.created_at_date: "7 days"]
    unless: [view_08989.id, view_08989.status]
  }

  join: view_08991 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08989.user_id} = ${view_08991.id} ;;
    required_joins: []
  }

  join: view_08992 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08989.account_id} = ${view_08992.account_id} ;;
    required_joins: [view_08991]
  }

  join: view_08993 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08989.category} = ${view_08993.category} ;;
  }

  access_filter: {
    field: view_08989.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08989.is_deleted} = false ;;
}
