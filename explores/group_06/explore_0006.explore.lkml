# Explore: explore_0006
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00019.view.lkml"
include: "/views/domain_21/view_00021.view.lkml"
include: "/views/domain_22/view_00022.view.lkml"
include: "/views/domain_23/view_00023.view.lkml"

explore: explore_0006 {
  label: "Explore Explore 0006"
  description: "Comprehensive analytics explore joining base view_00019 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00019
  
  always_filter: {
    filters: [view_00019.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00019.created_at_date: "7 days"]
    unless: [view_00019.id, view_00019.status]
  }

  join: view_00021 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00019.user_id} = ${view_00021.id} ;;
    required_joins: []
  }

  join: view_00022 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00019.account_id} = ${view_00022.account_id} ;;
    required_joins: [view_00021]
  }

  join: view_00023 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00019.category} = ${view_00023.category} ;;
  }

  access_filter: {
    field: view_00019.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00019.is_deleted} = false ;;
}
