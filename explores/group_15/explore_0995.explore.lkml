# Explore: explore_0995
# Auto-generated LookML Explore File

include: "/views/domain_36/view_02986.view.lkml"
include: "/views/domain_38/view_02988.view.lkml"
include: "/views/domain_39/view_02989.view.lkml"
include: "/views/domain_40/view_02990.view.lkml"

explore: explore_0995 {
  label: "Explore Explore 0995"
  description: "Comprehensive analytics explore joining base view_02986 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_02986
  
  always_filter: {
    filters: [view_02986.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02986.created_at_date: "7 days"]
    unless: [view_02986.id, view_02986.status]
  }

  join: view_02988 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02986.user_id} = ${view_02988.id} ;;
    required_joins: []
  }

  join: view_02989 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02986.account_id} = ${view_02989.account_id} ;;
    required_joins: [view_02988]
  }

  join: view_02990 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02986.category} = ${view_02990.category} ;;
  }

  access_filter: {
    field: view_02986.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02986.is_deleted} = false ;;
}
