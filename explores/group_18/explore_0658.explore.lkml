# Explore: explore_0658
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01975.view.lkml"
include: "/views/domain_27/view_01977.view.lkml"
include: "/views/domain_28/view_01978.view.lkml"
include: "/views/domain_29/view_01979.view.lkml"

explore: explore_0658 {
  label: "Explore Explore 0658"
  description: "Comprehensive analytics explore joining base view_01975 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01975
  
  always_filter: {
    filters: [view_01975.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01975.created_at_date: "7 days"]
    unless: [view_01975.id, view_01975.status]
  }

  join: view_01977 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01975.user_id} = ${view_01977.id} ;;
    required_joins: []
  }

  join: view_01978 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01975.account_id} = ${view_01978.account_id} ;;
    required_joins: [view_01977]
  }

  join: view_01979 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01975.category} = ${view_01979.category} ;;
  }

  access_filter: {
    field: view_01975.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01975.is_deleted} = false ;;
}
