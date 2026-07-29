# Explore: explore_1633
# Auto-generated LookML Explore File

include: "/views/domain_50/view_04900.view.lkml"
include: "/views/domain_02/view_04902.view.lkml"
include: "/views/domain_03/view_04903.view.lkml"
include: "/views/domain_04/view_04904.view.lkml"

explore: explore_1633 {
  label: "Explore Explore 1633"
  description: "Comprehensive analytics explore joining base view_04900 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_04900
  
  always_filter: {
    filters: [view_04900.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04900.created_at_date: "7 days"]
    unless: [view_04900.id, view_04900.status]
  }

  join: view_04902 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04900.user_id} = ${view_04902.id} ;;
    required_joins: []
  }

  join: view_04903 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04900.account_id} = ${view_04903.account_id} ;;
    required_joins: [view_04902]
  }

  join: view_04904 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04900.category} = ${view_04904.category} ;;
  }

  access_filter: {
    field: view_04900.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04900.is_deleted} = false ;;
}
