# Explore: explore_2976
# Auto-generated LookML Explore File

include: "/views/domain_29/view_08929.view.lkml"
include: "/views/domain_31/view_08931.view.lkml"
include: "/views/domain_32/view_08932.view.lkml"
include: "/views/domain_33/view_08933.view.lkml"

explore: explore_2976 {
  label: "Explore Explore 2976"
  description: "Comprehensive analytics explore joining base view_08929 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08929
  
  always_filter: {
    filters: [view_08929.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08929.created_at_date: "7 days"]
    unless: [view_08929.id, view_08929.status]
  }

  join: view_08931 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08929.user_id} = ${view_08931.id} ;;
    required_joins: []
  }

  join: view_08932 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08929.account_id} = ${view_08932.account_id} ;;
    required_joins: [view_08931]
  }

  join: view_08933 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08929.category} = ${view_08933.category} ;;
  }

  access_filter: {
    field: view_08929.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08929.is_deleted} = false ;;
}
