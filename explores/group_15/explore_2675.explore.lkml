# Explore: explore_2675
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08026.view.lkml"
include: "/views/domain_28/view_08028.view.lkml"
include: "/views/domain_29/view_08029.view.lkml"
include: "/views/domain_30/view_08030.view.lkml"

explore: explore_2675 {
  label: "Explore Explore 2675"
  description: "Comprehensive analytics explore joining base view_08026 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08026
  
  always_filter: {
    filters: [view_08026.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08026.created_at_date: "7 days"]
    unless: [view_08026.id, view_08026.status]
  }

  join: view_08028 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08026.user_id} = ${view_08028.id} ;;
    required_joins: []
  }

  join: view_08029 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08026.account_id} = ${view_08029.account_id} ;;
    required_joins: [view_08028]
  }

  join: view_08030 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08026.category} = ${view_08030.category} ;;
  }

  access_filter: {
    field: view_08026.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08026.is_deleted} = false ;;
}
