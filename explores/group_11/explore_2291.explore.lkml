# Explore: explore_2291
# Auto-generated LookML Explore File

include: "/views/domain_24/view_06874.view.lkml"
include: "/views/domain_26/view_06876.view.lkml"
include: "/views/domain_27/view_06877.view.lkml"
include: "/views/domain_28/view_06878.view.lkml"

explore: explore_2291 {
  label: "Explore Explore 2291"
  description: "Comprehensive analytics explore joining base view_06874 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06874
  
  always_filter: {
    filters: [view_06874.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06874.created_at_date: "7 days"]
    unless: [view_06874.id, view_06874.status]
  }

  join: view_06876 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06874.user_id} = ${view_06876.id} ;;
    required_joins: []
  }

  join: view_06877 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06874.account_id} = ${view_06877.account_id} ;;
    required_joins: [view_06876]
  }

  join: view_06878 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06874.category} = ${view_06878.category} ;;
  }

  access_filter: {
    field: view_06874.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06874.is_deleted} = false ;;
}
