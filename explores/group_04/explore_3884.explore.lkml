# Explore: explore_3884
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11653.view.lkml"
include: "/views/domain_05/view_11655.view.lkml"
include: "/views/domain_06/view_11656.view.lkml"
include: "/views/domain_07/view_11657.view.lkml"

explore: explore_3884 {
  label: "Explore Explore 3884"
  description: "Comprehensive analytics explore joining base view_11653 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11653
  
  always_filter: {
    filters: [view_11653.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11653.created_at_date: "7 days"]
    unless: [view_11653.id, view_11653.status]
  }

  join: view_11655 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11653.user_id} = ${view_11655.id} ;;
    required_joins: []
  }

  join: view_11656 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11653.account_id} = ${view_11656.account_id} ;;
    required_joins: [view_11655]
  }

  join: view_11657 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11653.category} = ${view_11657.category} ;;
  }

  access_filter: {
    field: view_11653.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11653.is_deleted} = false ;;
}
