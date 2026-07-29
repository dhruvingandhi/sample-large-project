# Explore: explore_3297
# Auto-generated LookML Explore File

include: "/views/domain_42/view_09892.view.lkml"
include: "/views/domain_44/view_09894.view.lkml"
include: "/views/domain_45/view_09895.view.lkml"
include: "/views/domain_46/view_09896.view.lkml"

explore: explore_3297 {
  label: "Explore Explore 3297"
  description: "Comprehensive analytics explore joining base view_09892 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09892
  
  always_filter: {
    filters: [view_09892.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09892.created_at_date: "7 days"]
    unless: [view_09892.id, view_09892.status]
  }

  join: view_09894 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09892.user_id} = ${view_09894.id} ;;
    required_joins: []
  }

  join: view_09895 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09892.account_id} = ${view_09895.account_id} ;;
    required_joins: [view_09894]
  }

  join: view_09896 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09892.category} = ${view_09896.category} ;;
  }

  access_filter: {
    field: view_09892.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09892.is_deleted} = false ;;
}
