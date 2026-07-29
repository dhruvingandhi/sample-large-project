# Explore: explore_3006
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09019.view.lkml"
include: "/views/domain_21/view_09021.view.lkml"
include: "/views/domain_22/view_09022.view.lkml"
include: "/views/domain_23/view_09023.view.lkml"

explore: explore_3006 {
  label: "Explore Explore 3006"
  description: "Comprehensive analytics explore joining base view_09019 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09019
  
  always_filter: {
    filters: [view_09019.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09019.created_at_date: "7 days"]
    unless: [view_09019.id, view_09019.status]
  }

  join: view_09021 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09019.user_id} = ${view_09021.id} ;;
    required_joins: []
  }

  join: view_09022 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09019.account_id} = ${view_09022.account_id} ;;
    required_joins: [view_09021]
  }

  join: view_09023 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09019.category} = ${view_09023.category} ;;
  }

  access_filter: {
    field: view_09019.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09019.is_deleted} = false ;;
}
