# Explore: explore_1024
# Auto-generated LookML Explore File

include: "/views/domain_23/view_03073.view.lkml"
include: "/views/domain_25/view_03075.view.lkml"
include: "/views/domain_26/view_03076.view.lkml"
include: "/views/domain_27/view_03077.view.lkml"

explore: explore_1024 {
  label: "Explore Explore 1024"
  description: "Comprehensive analytics explore joining base view_03073 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03073
  
  always_filter: {
    filters: [view_03073.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03073.created_at_date: "7 days"]
    unless: [view_03073.id, view_03073.status]
  }

  join: view_03075 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03073.user_id} = ${view_03075.id} ;;
    required_joins: []
  }

  join: view_03076 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03073.account_id} = ${view_03076.account_id} ;;
    required_joins: [view_03075]
  }

  join: view_03077 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03073.category} = ${view_03077.category} ;;
  }

  access_filter: {
    field: view_03073.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03073.is_deleted} = false ;;
}
