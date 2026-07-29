# Explore: explore_3033
# Auto-generated LookML Explore File

include: "/views/domain_50/view_09100.view.lkml"
include: "/views/domain_02/view_09102.view.lkml"
include: "/views/domain_03/view_09103.view.lkml"
include: "/views/domain_04/view_09104.view.lkml"

explore: explore_3033 {
  label: "Explore Explore 3033"
  description: "Comprehensive analytics explore joining base view_09100 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09100
  
  always_filter: {
    filters: [view_09100.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09100.created_at_date: "7 days"]
    unless: [view_09100.id, view_09100.status]
  }

  join: view_09102 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09100.user_id} = ${view_09102.id} ;;
    required_joins: []
  }

  join: view_09103 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09100.account_id} = ${view_09103.account_id} ;;
    required_joins: [view_09102]
  }

  join: view_09104 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09100.category} = ${view_09104.category} ;;
  }

  access_filter: {
    field: view_09100.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09100.is_deleted} = false ;;
}
