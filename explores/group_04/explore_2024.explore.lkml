# Explore: explore_2024
# Auto-generated LookML Explore File

include: "/views/domain_23/view_06073.view.lkml"
include: "/views/domain_25/view_06075.view.lkml"
include: "/views/domain_26/view_06076.view.lkml"
include: "/views/domain_27/view_06077.view.lkml"

explore: explore_2024 {
  label: "Explore Explore 2024"
  description: "Comprehensive analytics explore joining base view_06073 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06073
  
  always_filter: {
    filters: [view_06073.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06073.created_at_date: "7 days"]
    unless: [view_06073.id, view_06073.status]
  }

  join: view_06075 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06073.user_id} = ${view_06075.id} ;;
    required_joins: []
  }

  join: view_06076 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06073.account_id} = ${view_06076.account_id} ;;
    required_joins: [view_06075]
  }

  join: view_06077 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06073.category} = ${view_06077.category} ;;
  }

  access_filter: {
    field: view_06073.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06073.is_deleted} = false ;;
}
