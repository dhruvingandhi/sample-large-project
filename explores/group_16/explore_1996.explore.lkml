# Explore: explore_1996
# Auto-generated LookML Explore File

include: "/views/domain_39/view_05989.view.lkml"
include: "/views/domain_41/view_05991.view.lkml"
include: "/views/domain_42/view_05992.view.lkml"
include: "/views/domain_43/view_05993.view.lkml"

explore: explore_1996 {
  label: "Explore Explore 1996"
  description: "Comprehensive analytics explore joining base view_05989 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05989
  
  always_filter: {
    filters: [view_05989.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05989.created_at_date: "7 days"]
    unless: [view_05989.id, view_05989.status]
  }

  join: view_05991 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05989.user_id} = ${view_05991.id} ;;
    required_joins: []
  }

  join: view_05992 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05989.account_id} = ${view_05992.account_id} ;;
    required_joins: [view_05991]
  }

  join: view_05993 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05989.category} = ${view_05993.category} ;;
  }

  access_filter: {
    field: view_05989.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05989.is_deleted} = false ;;
}
