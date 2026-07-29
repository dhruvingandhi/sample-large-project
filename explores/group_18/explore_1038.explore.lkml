# Explore: explore_1038
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03115.view.lkml"
include: "/views/domain_17/view_03117.view.lkml"
include: "/views/domain_18/view_03118.view.lkml"
include: "/views/domain_19/view_03119.view.lkml"

explore: explore_1038 {
  label: "Explore Explore 1038"
  description: "Comprehensive analytics explore joining base view_03115 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03115
  
  always_filter: {
    filters: [view_03115.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03115.created_at_date: "7 days"]
    unless: [view_03115.id, view_03115.status]
  }

  join: view_03117 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03115.user_id} = ${view_03117.id} ;;
    required_joins: []
  }

  join: view_03118 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03115.account_id} = ${view_03118.account_id} ;;
    required_joins: [view_03117]
  }

  join: view_03119 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03115.category} = ${view_03119.category} ;;
  }

  access_filter: {
    field: view_03115.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03115.is_deleted} = false ;;
}
