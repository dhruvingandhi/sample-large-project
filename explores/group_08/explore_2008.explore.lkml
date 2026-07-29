# Explore: explore_2008
# Auto-generated LookML Explore File

include: "/views/domain_25/view_06025.view.lkml"
include: "/views/domain_27/view_06027.view.lkml"
include: "/views/domain_28/view_06028.view.lkml"
include: "/views/domain_29/view_06029.view.lkml"

explore: explore_2008 {
  label: "Explore Explore 2008"
  description: "Comprehensive analytics explore joining base view_06025 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_06025
  
  always_filter: {
    filters: [view_06025.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06025.created_at_date: "7 days"]
    unless: [view_06025.id, view_06025.status]
  }

  join: view_06027 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06025.user_id} = ${view_06027.id} ;;
    required_joins: []
  }

  join: view_06028 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06025.account_id} = ${view_06028.account_id} ;;
    required_joins: [view_06027]
  }

  join: view_06029 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06025.category} = ${view_06029.category} ;;
  }

  access_filter: {
    field: view_06025.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06025.is_deleted} = false ;;
}
