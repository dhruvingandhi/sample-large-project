# Explore: explore_1952
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05857.view.lkml"
include: "/views/domain_09/view_05859.view.lkml"
include: "/views/domain_10/view_05860.view.lkml"
include: "/views/domain_11/view_05861.view.lkml"

explore: explore_1952 {
  label: "Explore Explore 1952"
  description: "Comprehensive analytics explore joining base view_05857 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05857
  
  always_filter: {
    filters: [view_05857.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05857.created_at_date: "7 days"]
    unless: [view_05857.id, view_05857.status]
  }

  join: view_05859 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05857.user_id} = ${view_05859.id} ;;
    required_joins: []
  }

  join: view_05860 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05857.account_id} = ${view_05860.account_id} ;;
    required_joins: [view_05859]
  }

  join: view_05861 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05857.category} = ${view_05861.category} ;;
  }

  access_filter: {
    field: view_05857.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05857.is_deleted} = false ;;
}
