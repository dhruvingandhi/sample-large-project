# Explore: explore_3721
# Auto-generated LookML Explore File

include: "/views/domain_14/view_11164.view.lkml"
include: "/views/domain_16/view_11166.view.lkml"
include: "/views/domain_17/view_11167.view.lkml"
include: "/views/domain_18/view_11168.view.lkml"

explore: explore_3721 {
  label: "Explore Explore 3721"
  description: "Comprehensive analytics explore joining base view_11164 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11164
  
  always_filter: {
    filters: [view_11164.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11164.created_at_date: "7 days"]
    unless: [view_11164.id, view_11164.status]
  }

  join: view_11166 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11164.user_id} = ${view_11166.id} ;;
    required_joins: []
  }

  join: view_11167 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11164.account_id} = ${view_11167.account_id} ;;
    required_joins: [view_11166]
  }

  join: view_11168 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11164.category} = ${view_11168.category} ;;
  }

  access_filter: {
    field: view_11164.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11164.is_deleted} = false ;;
}
