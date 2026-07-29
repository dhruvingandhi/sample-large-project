# Explore: explore_2889
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08668.view.lkml"
include: "/views/domain_20/view_08670.view.lkml"
include: "/views/domain_21/view_08671.view.lkml"
include: "/views/domain_22/view_08672.view.lkml"

explore: explore_2889 {
  label: "Explore Explore 2889"
  description: "Comprehensive analytics explore joining base view_08668 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08668
  
  always_filter: {
    filters: [view_08668.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08668.created_at_date: "7 days"]
    unless: [view_08668.id, view_08668.status]
  }

  join: view_08670 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08668.user_id} = ${view_08670.id} ;;
    required_joins: []
  }

  join: view_08671 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08668.account_id} = ${view_08671.account_id} ;;
    required_joins: [view_08670]
  }

  join: view_08672 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08668.category} = ${view_08672.category} ;;
  }

  access_filter: {
    field: view_08668.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08668.is_deleted} = false ;;
}
