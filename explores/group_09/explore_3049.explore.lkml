# Explore: explore_3049
# Auto-generated LookML Explore File

include: "/views/domain_48/view_09148.view.lkml"
include: "/views/domain_50/view_09150.view.lkml"
include: "/views/domain_01/view_09151.view.lkml"
include: "/views/domain_02/view_09152.view.lkml"

explore: explore_3049 {
  label: "Explore Explore 3049"
  description: "Comprehensive analytics explore joining base view_09148 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09148
  
  always_filter: {
    filters: [view_09148.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09148.created_at_date: "7 days"]
    unless: [view_09148.id, view_09148.status]
  }

  join: view_09150 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09148.user_id} = ${view_09150.id} ;;
    required_joins: []
  }

  join: view_09151 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09148.account_id} = ${view_09151.account_id} ;;
    required_joins: [view_09150]
  }

  join: view_09152 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09148.category} = ${view_09152.category} ;;
  }

  access_filter: {
    field: view_09148.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09148.is_deleted} = false ;;
}
