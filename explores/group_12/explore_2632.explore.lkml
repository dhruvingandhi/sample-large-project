# Explore: explore_2632
# Auto-generated LookML Explore File

include: "/views/domain_47/view_07897.view.lkml"
include: "/views/domain_49/view_07899.view.lkml"
include: "/views/domain_50/view_07900.view.lkml"
include: "/views/domain_01/view_07901.view.lkml"

explore: explore_2632 {
  label: "Explore Explore 2632"
  description: "Comprehensive analytics explore joining base view_07897 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07897
  
  always_filter: {
    filters: [view_07897.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07897.created_at_date: "7 days"]
    unless: [view_07897.id, view_07897.status]
  }

  join: view_07899 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07897.user_id} = ${view_07899.id} ;;
    required_joins: []
  }

  join: view_07900 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07897.account_id} = ${view_07900.account_id} ;;
    required_joins: [view_07899]
  }

  join: view_07901 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07897.category} = ${view_07901.category} ;;
  }

  access_filter: {
    field: view_07897.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07897.is_deleted} = false ;;
}
