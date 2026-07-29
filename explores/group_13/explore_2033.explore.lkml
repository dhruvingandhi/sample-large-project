# Explore: explore_2033
# Auto-generated LookML Explore File

include: "/views/domain_50/view_06100.view.lkml"
include: "/views/domain_02/view_06102.view.lkml"
include: "/views/domain_03/view_06103.view.lkml"
include: "/views/domain_04/view_06104.view.lkml"

explore: explore_2033 {
  label: "Explore Explore 2033"
  description: "Comprehensive analytics explore joining base view_06100 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06100
  
  always_filter: {
    filters: [view_06100.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06100.created_at_date: "7 days"]
    unless: [view_06100.id, view_06100.status]
  }

  join: view_06102 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06100.user_id} = ${view_06102.id} ;;
    required_joins: []
  }

  join: view_06103 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06100.account_id} = ${view_06103.account_id} ;;
    required_joins: [view_06102]
  }

  join: view_06104 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06100.category} = ${view_06104.category} ;;
  }

  access_filter: {
    field: view_06100.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06100.is_deleted} = false ;;
}
