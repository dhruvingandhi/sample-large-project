# Explore: explore_2884
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08653.view.lkml"
include: "/views/domain_05/view_08655.view.lkml"
include: "/views/domain_06/view_08656.view.lkml"
include: "/views/domain_07/view_08657.view.lkml"

explore: explore_2884 {
  label: "Explore Explore 2884"
  description: "Comprehensive analytics explore joining base view_08653 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08653
  
  always_filter: {
    filters: [view_08653.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08653.created_at_date: "7 days"]
    unless: [view_08653.id, view_08653.status]
  }

  join: view_08655 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08653.user_id} = ${view_08655.id} ;;
    required_joins: []
  }

  join: view_08656 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08653.account_id} = ${view_08656.account_id} ;;
    required_joins: [view_08655]
  }

  join: view_08657 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08653.category} = ${view_08657.category} ;;
  }

  access_filter: {
    field: view_08653.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08653.is_deleted} = false ;;
}
