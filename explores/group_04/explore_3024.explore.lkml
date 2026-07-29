# Explore: explore_3024
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09073.view.lkml"
include: "/views/domain_25/view_09075.view.lkml"
include: "/views/domain_26/view_09076.view.lkml"
include: "/views/domain_27/view_09077.view.lkml"

explore: explore_3024 {
  label: "Explore Explore 3024"
  description: "Comprehensive analytics explore joining base view_09073 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09073
  
  always_filter: {
    filters: [view_09073.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09073.created_at_date: "7 days"]
    unless: [view_09073.id, view_09073.status]
  }

  join: view_09075 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09073.user_id} = ${view_09075.id} ;;
    required_joins: []
  }

  join: view_09076 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09073.account_id} = ${view_09076.account_id} ;;
    required_joins: [view_09075]
  }

  join: view_09077 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09073.category} = ${view_09077.category} ;;
  }

  access_filter: {
    field: view_09073.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09073.is_deleted} = false ;;
}
