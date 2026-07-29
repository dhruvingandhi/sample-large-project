# Explore: explore_0327
# Auto-generated LookML Explore File

include: "/views/domain_32/view_00982.view.lkml"
include: "/views/domain_34/view_00984.view.lkml"
include: "/views/domain_35/view_00985.view.lkml"
include: "/views/domain_36/view_00986.view.lkml"

explore: explore_0327 {
  label: "Explore Explore 0327"
  description: "Comprehensive analytics explore joining base view_00982 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00982
  
  always_filter: {
    filters: [view_00982.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00982.created_at_date: "7 days"]
    unless: [view_00982.id, view_00982.status]
  }

  join: view_00984 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00982.user_id} = ${view_00984.id} ;;
    required_joins: []
  }

  join: view_00985 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00982.account_id} = ${view_00985.account_id} ;;
    required_joins: [view_00984]
  }

  join: view_00986 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00982.category} = ${view_00986.category} ;;
  }

  access_filter: {
    field: view_00982.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00982.is_deleted} = false ;;
}
