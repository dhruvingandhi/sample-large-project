# Explore: explore_2032
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06097.view.lkml"
include: "/views/domain_49/view_06099.view.lkml"
include: "/views/domain_50/view_06100.view.lkml"
include: "/views/domain_01/view_06101.view.lkml"

explore: explore_2032 {
  label: "Explore Explore 2032"
  description: "Comprehensive analytics explore joining base view_06097 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06097
  
  always_filter: {
    filters: [view_06097.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06097.created_at_date: "7 days"]
    unless: [view_06097.id, view_06097.status]
  }

  join: view_06099 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06097.user_id} = ${view_06099.id} ;;
    required_joins: []
  }

  join: view_06100 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06097.account_id} = ${view_06100.account_id} ;;
    required_joins: [view_06099]
  }

  join: view_06101 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06097.category} = ${view_06101.category} ;;
  }

  access_filter: {
    field: view_06097.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06097.is_deleted} = false ;;
}
