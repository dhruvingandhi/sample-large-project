# Explore: explore_1021
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03064.view.lkml"
include: "/views/domain_16/view_03066.view.lkml"
include: "/views/domain_17/view_03067.view.lkml"
include: "/views/domain_18/view_03068.view.lkml"

explore: explore_1021 {
  label: "Explore Explore 1021"
  description: "Comprehensive analytics explore joining base view_03064 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03064
  
  always_filter: {
    filters: [view_03064.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03064.created_at_date: "7 days"]
    unless: [view_03064.id, view_03064.status]
  }

  join: view_03066 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03064.user_id} = ${view_03066.id} ;;
    required_joins: []
  }

  join: view_03067 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03064.account_id} = ${view_03067.account_id} ;;
    required_joins: [view_03066]
  }

  join: view_03068 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03064.category} = ${view_03068.category} ;;
  }

  access_filter: {
    field: view_03064.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03064.is_deleted} = false ;;
}
